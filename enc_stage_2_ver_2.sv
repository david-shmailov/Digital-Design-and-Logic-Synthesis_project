module ENC_STAGE_2 (
                clk,rst,
                data_in,
                work_mod,
                data_out,
                temp
);
    parameter   MAX_CODEWORD_WIDTH = 32;
    parameter   MAX_INFO_WIDTH=26;
    localparam  MAX_PARITY_WIDTH = MAX_CODEWORD_WIDTH - MAX_INFO_WIDTH;
    localparam  info_mod_1 = 4;
    localparam  info_mod_2 = 11;
    localparam  info_mod_3 = 26;
    localparam  parity_mod_1 = 4;
    localparam  parity_mod_2 = 5;
    localparam  parity_mod_3 = 6;

    localparam  pad_zero_1 = MAX_CODEWORD_WIDTH - info_mod_1 - parity_mod_1;
    localparam  pad_zero_2 = MAX_CODEWORD_WIDTH - info_mod_2 - parity_mod_2;
    //localparam pad_zero_3 = MAX_CODEWORD_WIDTH - info_mod_3 - parity_mod_3;


    logic   [MAX_CODEWORD_WIDTH-1:0]      one_vec;

    input logic                                 rst,clk;
    input logic      [MAX_CODEWORD_WIDTH-1:0]   data_in;
    input logic      [1:0]                      work_mod;
    output logic     [MAX_CODEWORD_WIDTH-1:0]   data_out;
    output logic                                temp;
    
    logic     [MAX_CODEWORD_WIDTH-1:0] final_temp;


    assign  one_vec = {MAX_CODEWORD_WIDTH{1'b1}};
    // multiply first row of matrix with codeword
    MAT_MULT    #(  .A_ROWS(1),
                    .A_COLS(MAX_CODEWORD_WIDTH),
                    .B_COLS(1)) m1
                (
                .A_data_in(one_vec), //todo test that this is the correct selection
                .B_data_in(data_in),
                .C_data_out(temp));
    
    
    always_comb begin : output_mux
        case(work_mod)
            2'b00   :   final_temp =    {{pad_zero_1{1'b0}},
                                        data_in[info_mod_1+parity_mod_1-1:parity_mod_1],
                                        temp,  // index parity_mod_1 -1
                                        data_in[parity_mod_1-2:0]};
                                        
            2'b01   :   final_temp =    {{pad_zero_2{1'b0}},
                                        data_in[info_mod_2+ parity_mod_2-1:parity_mod_2],
                                        temp,  // index parity_mod_2 -1
                                        data_in[parity_mod_2-2:0]};

            2'b10   :   final_temp =    {                              //not genric??           // 0
                                        data_in[info_mod_3+parity_mod_3 -1 : parity_mod_3],     // 31 - 6
                                        temp,  // index parity_mod_3 -1                         // 5
                                        data_in[parity_mod_3-2:0]};                             // 4 - 0
                                        
            default :   final_temp =    {MAX_CODEWORD_WIDTH{1'b0}};
        endcase
    end
    
    always_ff @( posedge clk or negedge rst) begin : DataOut_stage2
        if (!rst) begin
            data_out <= {MAX_CODEWORD_WIDTH{1'b0}};
        end else begin
            data_out <= final_temp;
        end
    end

endmodule

// H1 matrix zero padded
// 00000000000000000000000000000000
// 00000000000000000000000000000000
// 00000000000000000000000011111111
// 00000000000000000000000011100100
// 00000000000000000000000011010010
// 00000000000000000000000010110001
//H2 matrix zero padded
// 00000000000000000000000000000000
// 00000000000000001111111111111111
// 00000000000000001111111000001000
// 00000000000000001111000111000100
// 00000000000000001100110110100010
// 00000000000000001010101101100001
// H3 matriz zero padded
// 11111111111111111111111111111111
// 11111111111111100000000000010000
// 11111111000000011111110000001000
// 11110000111100011110001110000100
// 11001100110011011001101101000010
// 10101010101010110101011011000001