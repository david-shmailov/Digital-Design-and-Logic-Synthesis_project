module DEC_CHK (
            rst,
            clk,
            data_in,
            s_vector,
            work_mod,
            data_out,
            num_of_errors
);  
    parameter   MAX_CODEWORD_WIDTH = 32;
    parameter   MAX_INFO_WIDTH=26;
    localparam  MAX_PARITY_WIDTH = MAX_CODEWORD_WIDTH - MAX_INFO_WIDTH ;
    localparam info_mod_1 = 4;
    localparam info_mod_2 = 11;
    localparam info_mod_3 = 26;
    localparam parity_mod_1 = 4;
    localparam parity_mod_2 = 5;
    localparam parity_mod_3 = 6;
    localparam full_length_mod_1 = info_mod_1 + parity_mod_1;
    localparam full_length_mod_2 = info_mod_2 + parity_mod_2;
    localparam full_length_mod_3 = info_mod_3 + parity_mod_3;
    
    localparam pad_zero_1 = MAX_CODEWORD_WIDTH - full_length_mod_1;
    localparam pad_zero_2 = MAX_CODEWORD_WIDTH - full_length_mod_2;
    localparam pad_zero_3 = MAX_CODEWORD_WIDTH - full_length_mod_3;

    input   logic                               rst,clk;
    input   logic   [MAX_CODEWORD_WIDTH-1:0]    data_in;
    input   logic   [MAX_PARITY_WIDTH-1:0]      s_vector;
    input   logic   [1:0]                       work_mod;
    output  logic   [MAX_CODEWORD_WIDTH-1:0]    data_out;
    output  logic   [1:0]                       num_of_errors;


    logic   [MAX_PARITY_WIDTH-1:0][full_length_mod_1-1:0]     H_matrix_1;
    logic   [MAX_PARITY_WIDTH-1:0][full_length_mod_2-1:0]     H_matrix_2;
    logic   [MAX_PARITY_WIDTH-1:0][full_length_mod_3-1:0]     H_matrix_3;

    logic   [full_length_mod_1-1:0][MAX_PARITY_WIDTH-1:0]     H_1_transpose;
    logic   [full_length_mod_2-1:0][MAX_PARITY_WIDTH-1:0]     H_2_transpose;
    logic   [full_length_mod_3-1:0][MAX_PARITY_WIDTH-1:0]     H_3_transpose;

    logic     [MAX_CODEWORD_WIDTH-1:0]    correction_vector_mod_1;
    logic     [MAX_CODEWORD_WIDTH-1:0]    correction_vector_mod_2;
    logic     [MAX_CODEWORD_WIDTH-1:0]    correction_vector_mod_3;
    logic     eq_to_col;
    logic     [MAX_CODEWORD_WIDTH-1:0]    temp_out;


    assign H_matrix_1 = 48'hFFE4_D2B1; // i assume MSB bits will be zero padded
    assign H_matrix_2 = 96'hFFFF_FE08_F1C4_CDA2_AB61;
    assign H_matrix_3 = 192'hFFFF_FFFF_FFFE_0010_FF01_FC08_F0F1_E384_CCCD_9B42_AAAB_56C1;



    genvar row,col; 
    // in an attempt to discard useless zeros from the matrix we did that:
    generate   
    for (row = 0; row < MAX_PARITY_WIDTH ; row = row +1 ) begin
        for (col = 0; col < full_length_mod_1 ; col = col +1) begin
            assign H_1_transpose [col][row] = H_matrix_1 [row][col];
        end
        for (col = 0; col < full_length_mod_2 ; col = col +1) begin
            assign H_2_transpose [col][row] = H_matrix_2 [row][col];
        end
        for (col = 0; col < full_length_mod_3 ; col = col +1) begin
            assign H_3_transpose [col][row] = H_matrix_3 [row][col];
        end     
    end
    endgenerate


    
    


    // assumption: unspecified bits are zero for correction_vector_mod_#
    genvar i;
    generate
        for (i=0; i<full_length_mod_1; i=i+1) begin // need to full work_mod 1 so it doesnt check equality with zero padding
            assign correction_vector_mod_1[i] = (H_1_transpose[i] == s_vector) ? 1'b1 : 1'b0; // this checks if they are equal 
        end
        assign correction_vector_mod_1 [MAX_CODEWORD_WIDTH-1 : full_length_mod_1] = {pad_zero_1{1'b0}};

        for (i=0; i<full_length_mod_2; i=i+1) begin
            assign correction_vector_mod_2[i] = (H_2_transpose[i] == s_vector) ? 1'b1 : 1'b0; // this checks if they are equal
        end
        assign correction_vector_mod_2 [MAX_CODEWORD_WIDTH-1 : full_length_mod_2] = {pad_zero_2{1'b0}};

        for (i=0; i<full_length_mod_3; i=i+1) begin
            assign correction_vector_mod_3[i] = (H_3_transpose[i] == s_vector) ? 1'b1 : 1'b0; // this checks if they are equal
        end
    endgenerate

    // always_ff @( posedge clk) begin : after_CV_compute
    //     if (!rst) begin
    //         correction_vector_mod_1_sample <= {MAX_CODEWORD_WIDTH{1'b0}};
    //         correction_vector_mod_2_sample <= {MAX_CODEWORD_WIDTH{1'b0}};
    //         correction_vector_mod_3_sample <= {MAX_CODEWORD_WIDTH{1'b0}};
    //     end else begin
    //         correction_vector_mod_1_sample <= correction_vector_mod_1;
    //         correction_vector_mod_2_sample <= correction_vector_mod_2;
    //         correction_vector_mod_3_sample <= correction_vector_mod_3;
    //     end
    // end



    always_comb begin : reduce
        case(work_mod)
            2'b00   :   begin
                        eq_to_col = |correction_vector_mod_1;
                        temp_out   = data_in ^ correction_vector_mod_1; //correct the data (XOR)
            end
            2'b01   :   begin
                        eq_to_col = |correction_vector_mod_2;
                        temp_out   = data_in ^ correction_vector_mod_2; //correct the data
            end
            2'b10   :   begin
                        eq_to_col = |correction_vector_mod_3;
                        temp_out   = data_in ^ correction_vector_mod_3; //correct the data
            end
            default :   begin
                        eq_to_col = 1'b0;
                        temp_out   = data_in; 
            end
        endcase
    end

    
    always_ff @( posedge clk) begin : DEC_outputs
        if (!rst) begin
            num_of_errors <= 2'b00;
            data_out <= {MAX_CODEWORD_WIDTH{1'b0}};
        end 
        else begin //priority if is required here. do not change to case
            if (s_vector == {MAX_PARITY_WIDTH{1'b0}}) 
                num_of_errors <= 2'b00;
            else if (eq_to_col) 
                num_of_errors <= 2'b01;
            else if (!eq_to_col) 
                num_of_errors <= 2'b10;
            else
                num_of_errors <= 2'b11; //this is not a correct state of the machine.
            data_out <= temp_out;
        end

    end
        
endmodule