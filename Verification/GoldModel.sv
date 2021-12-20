`ifndef apb_trans
`define apb_trans
`include "transaction.sv"
`endif 

`ifndef out_trans
`define out_trans
`include "output_transaction.sv"
`endif 



class golden_model;
    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;
    parameter       DATA_WIDTH = 32;

  	bit [0:3][7:0]  H1 = 32'b11111111111001001101001010110001;
    bit [0:4][15:0] H2 = 80'b11111111111111111111111000001000111100011100010011001101101000101010101101100001;
    bit [0:5][31:0] H3 = 192'b111111111111111111111111111111111111111111111110000000000001000011111111000000011111110000001000111100001111000111100011100001001100110011001101100110110100001010101010101010110101011011000001;

    localparam encoder_only = 0;
    localparam decoder_only = 1;
    localparam full_channel = 2;
    
    localparam width_8 = 0;
    localparam width_16 = 1;
    localparam width_32 = 2;
    
    function new();
        
        
    endfunction

    task create_expected( apb_trans trans, out_trans expected);
        //out_trans expected = new;
        assert(trans.ctrl <=2 && trans.ctrl >=0);
        case (trans.ctrl)
            encoder_only: encode(trans,expected);
            decoder_only: decode(trans,expected);
            full_channel: full(trans,expected);
        endcase
        //return expected;
    endtask


    task full(apb_trans trans, out_trans expected);
      	int unsigned num_of_errors = $countones(trans.noise);

        assert(num_of_errors <= 2);
        expected.num_of_errors = num_of_errors;
        expected.data_out = trans.data_in; // if there are less then 2 errors, the data should be the same, else , we dont care about data_out
    endtask


    task decode(apb_trans trans,  out_trans expected);
        assert(trans.codeword_width <=2 && trans.codeword_width >=0);
        case (trans.codeword_width)
          0: decode_0(trans, expected); 
          1: decode_1(trans, expected);
          2: decode_2(trans, expected);
        endcase
    endtask

    task decode_0(apb_trans trans, out_trans expected);
    
        localparam int codeword_l = 8;
        localparam int parity_l = 4;
        localparam int info_l = codeword_l - parity_l;

      	automatic bit  [parity_l-1:0] s_vector = 0;
        automatic bit  [codeword_l-1:0] temp ;
        for (int row = 0; row < parity_l; row++) begin
            temp = (H1[row] & trans.data_in[codeword_l-1:0]); 
            s_vector[row] = ^temp;
        end
        if (s_vector == 0) begin
            expected.num_of_errors = 0;
            expected.data_out = {{parity_l{1'b0}},trans.data_in[31:parity_l]};
        end else begin // now we check if S is equal to any column in the matrix
            automatic int equal_to_col = -1;
            for (int col =0; col < codeword_l; col ++) begin
              	automatic bit [parity_l:0] temp_col =0;
              	for (int row = 0; row < parity_l; row++)begin
                  	temp_col[row]= H1[row][col];
                end
                if (temp_col == s_vector) begin
                    equal_to_col = col;
                    break;
                end
            end
            if (equal_to_col >= 0) begin // one mistake, equal to a column
                temp = trans.data_in;
                temp[equal_to_col] = !temp[equal_to_col]; // flip the bad bit
              	expected.data_out = temp[codeword_l-1:parity_l]; // test if this zero padding correctly
                expected.num_of_errors = 1;
            end else begin //2 mistakes, equal to no column
                expected.data_out = trans.data_in; // dont care of this value
                expected.num_of_errors = 2;
            end
        end
        return;
    endtask
    
    task decode_1(apb_trans trans, out_trans expected);
    
        localparam int codeword_l = 16;
        localparam int parity_l = 5;
        localparam int info_l = codeword_l - parity_l;

      	automatic bit  [parity_l-1:0] s_vector = 0;
        automatic bit  [codeword_l-1:0] temp ;
        for (int row = 0; row < parity_l; row++) begin
            temp = (H2[row] & trans.data_in[codeword_l-1:0]); 
            s_vector[row] = ^temp;
        end
        if (s_vector == 0) begin
            expected.num_of_errors = 0;
            expected.data_out = {{parity_l{1'b0}},trans.data_in[31:parity_l]};
        end else begin // now we check if S is equal to any column in the matrix
            automatic int equal_to_col = -1;
            for (int col =0; col < codeword_l; col ++) begin
              	automatic bit [parity_l:0] temp_col =0;
              	for (int row = 0; row < parity_l; row++)begin
                  	temp_col[row]= H2[row][col];
                end
                if (temp_col == s_vector) begin
                    equal_to_col = col;
                    break;
                end
            end
            if (equal_to_col >= 0) begin // one mistake, equal to a column
                temp = trans.data_in;
                temp[equal_to_col] = !temp[equal_to_col]; // flip the bad bit
              	expected.data_out = temp[codeword_l-1:parity_l]; // test if this zero padding correctly
                expected.num_of_errors = 1;
            end else begin //2 mistakes, equal to no column
                expected.data_out = trans.data_in; // dont care of this value
                expected.num_of_errors = 2;
            end
        end
        return;
    endtask
  
    task decode_2(apb_trans trans, out_trans expected);
    
        localparam int codeword_l = 32;
        localparam int parity_l = 6;
        localparam int info_l = codeword_l - parity_l;

      	automatic bit  [parity_l-1:0] s_vector = 0;
        automatic bit  [codeword_l-1:0] temp ;
        for (int row = 0; row < parity_l; row++) begin
            temp = (H3[row] & trans.data_in[codeword_l-1:0]); 
            s_vector[row] = ^temp;
        end
        if (s_vector == 0) begin
            expected.num_of_errors = 0;
            expected.data_out = {{parity_l{1'b0}},trans.data_in[31:parity_l]};
        end else begin // now we check if S is equal to any column in the matrix
            automatic int equal_to_col = -1;
            for (int col =0; col < codeword_l; col ++) begin
              	automatic bit [parity_l:0] temp_col =0;
              	for (int row = 0; row < parity_l; row++)begin
                  	temp_col[row]= H3[row][col];
                end
                if (temp_col == s_vector) begin
                    equal_to_col = col;
                    break;
                end
            end
            if (equal_to_col >= 0) begin // one mistake, equal to a column
                temp = trans.data_in;
                temp[equal_to_col] = !temp[equal_to_col]; // flip the bad bit
              	expected.data_out = temp[codeword_l-1:parity_l]; // test if this zero padding correctly
                expected.num_of_errors = 1;
            end else begin //2 mistakes, equal to no column
                expected.data_out = trans.data_in; // dont care of this value
                expected.num_of_errors = 2;
            end
        end
        return;
    endtask


    task encode(apb_trans trans, out_trans expected);
        assert(trans.codeword_width <=2 && trans.codeword_width >=0);
        case (trans.codeword_width)
          0: encode_0(trans, expected);
          1: encode_1(trans, expected);
          2: encode_2(trans, expected);
        endcase
    endtask

              
  	task encode_0(apb_trans trans, out_trans expected);
    
        localparam int codeword_l = 8;
        localparam int parity_l = 4;
        localparam int info_l = codeword_l - parity_l;

      	automatic bit [codeword_l-1:0] data_out = {trans.data_in[info_l-1:0],{parity_l{1'b0}}};
        automatic bit  [info_l-1:0] temp ;
        for (int row = 1; row < parity_l; row++) begin
            temp = (H1[row][codeword_l-1:parity_l] & data_out[codeword_l-1:parity_l]); 
            data_out[parity_l-1-row] = ^temp;
        end
        data_out[parity_l-1] = ^data_out;
      	expected.data_out = data_out;
    endtask
          
          
    task encode_1(apb_trans trans,  out_trans expected);
    
        localparam int codeword_l = 16;
        localparam int parity_l = 5;
        localparam int info_l = codeword_l - parity_l;

      	automatic bit [codeword_l-1:0] data_out = {trans.data_in[info_l-1:0],{parity_l{1'b0}}};
        automatic bit  [info_l-1:0] temp ;
        for (int row = 1; row < parity_l; row++) begin
            temp = (H2[row][codeword_l-1:parity_l] & data_out[codeword_l-1:parity_l]); 
            data_out[parity_l-1-row] = ^temp;
        end
        data_out[parity_l-1] = ^data_out;
      	expected.data_out = data_out;
    endtask
    
    task encode_2(apb_trans trans,  out_trans expected);
    
        localparam int codeword_l = 32;
        localparam int parity_l = 6;
        localparam int info_l = codeword_l - parity_l;

      	automatic bit [codeword_l-1:0] data_out = {trans.data_in[info_l-1:0],{parity_l{1'b0}}};
        automatic bit  [info_l-1:0] temp ;
        for (int row = 1; row < parity_l; row++) begin
            temp = (H3[row][codeword_l-1:parity_l] & data_out[codeword_l-1:parity_l]); 
            data_out[parity_l-1-row] = ^temp;
        end
        data_out[parity_l-1] = ^data_out;
      	expected.data_out = data_out;
    endtask
endclass