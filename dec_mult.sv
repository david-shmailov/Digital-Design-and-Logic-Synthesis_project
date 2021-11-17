module DEC_MULT #(
    parameter   MAX_CODEWORD_WIDTH = 32;
    parameter   MAX_INFO_WIDTH=26;
) (
    input   rst,
            clk,
            data_in,
            mod,
    output  data_out
);
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

    wire    rst,clk;
    wire    [MAX_CODEWORD_WIDTH-1:0]    data_in;
    wire    [1:0]                       mod;
    reg     [MAX_CODEWORD_WIDTH-1:0]      data_out;


    wire [3:0][7:0]     H_matrix_1 = 32'hffe4_d2b1;
    wire [4:0][15:0]    H_matrix_2 = 80'hffff_fe08_f1c4_cda2_ab61;
    wire [5:0][31:0]    H_matrix_3 = 192'hffff_ffff_fffe_0010_ff01_fc08_f0f1_e384_cccd_9b42_aaab_56c1;

    
    reg     [full_length_mod_1-1:0] temp1;
    reg     [full_length_mod_2-1:0] temp2; 
    reg     [full_length_mod_3-1:0] temp3;
    
    reg     [MAX_CODEWORD_WIDTH-1 :0] mult_result;

    MAT_MULT    #(  parameter A_ROWS = parity_mod_1 ,
                    parameter A_COLS = full_length_mod_1,
                    parameter B_COLS = 1) m1
                (.clk(clk),
                .rst(rst),
                // we take only the info_length left side of the matrix and also without the first row.
                // because we calculate the last parity bit in stage 2.
                .A_data_in(H_matrix_1), 
                .B_data_in(data_in[full_length_mod_1 - 1]),
                .C_data_out(temp1));

    MAT_MULT    #(  parameter A_ROWS = parity_mod_2 ,
                    parameter A_COLS = full_length_mod_2,
                    parameter B_COLS = 1) m1
                (.clk(clk),
                .rst(rst),
                // we take only the info_length left side of the matrix and also without the first row.
                // because we calculate the last parity bit in stage 2.
                .A_data_in(H_matrix_2), 
                .B_data_in(data_in[full_length_mod_2]),
                .C_data_out(temp2));

    MAT_MULT    #(  parameter A_ROWS = parity_mod_3 ,
                    parameter A_COLS = full_length_mod_3,
                    parameter B_COLS = 1) m1
                (.clk(clk),
                .rst(rst),
                // we take only the info_length left side of the matrix and also without the first row.
                // because we calculate the last parity bit in stage 2.
                .A_data_in(H_matrix_3), 
                .B_data_in(data_in[full_length_mod_3]),
                .C_data_out(temp3));

    always_comb begin : output_mux
        case(mod)
            2'b00   :   mult_result =    {pad_zero_1{1'b0}, temp1};
            2'b01   :   mult_result =    {pad_zero_2{1'b0}, temp2};
            2'b10   :   mult_result =    {pad_zero_3{1'b0}, temp3};

            default :   mult_result =    MAX_CODEWORD_WIDTH{1'b0};
    end

    always_ff @( posedge clk ) begin : output_reg
        if (rst) begin
            data_out <= MAX_CODEWORD_WIDTH{1'b0};
        end else begin
            data_out <= mult_result;
        end
    end



endmodule