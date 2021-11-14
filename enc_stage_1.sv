module ENC_STAGE_1 #(
    parameter   MAX_CODEWORD_WIDTH = 32;
    parameter   MAX_INFO_WIDTH=26;

)(
    input       clk,rst,
                data_in,
                mod,
    output      data_out
);

    localparam MAX_PARITY_WIDTH = MAX_CODEWORD_WIDTH - MAX_INFO_WIDTH;
    localparam info_mod_1 = 4;
    localparam info_mod_2 = 11;
    localparam info_mod_3 = 26;
    localparam parity_mod_1 = 4;
    localparam parity_mod_2 = 5;
    localparam parity_mod_3 = 6;

    localparam pad_zero_1 = MAX_CODEWORD_WIDTH - info_mod_1 - parity_mod_1;
    localparam pad_zero_2 = MAX_CODEWORD_WIDTH - info_mod_2 - parity_mod_2;
    localparam pad_zero_3 = MAX_CODEWORD_WIDTH - info_mod_3 - parity_mod_3;
    
    wire [3:0][7:0]     H_matrix_1      = 32'hffe4_d2b1;
    wire [4:0][15:0]    H_matrix_2 = 80'hffff_fe08_f1c4_cda2_ab61;
    wire [5:0][31:0]    H_matrix_3 = 192'hffff_ffff_fffe_0010_ff01_fc08_f0f1_e384_cccd_9b42_aaab_56c1;

    // wire [3:0][3:0] right_side_H_1  = 16'hd2b1;
    // wire [3:0][3:0] left_side_H_1   = 16'hffe4;

    wire    rst,clk;
    wire    [MAX_INFO_WIDTH-1:0] data_in;
    wire    [1:0] mod;
    reg     [MAX_CODEWORD_WIDTH-1:0] data_out;



    reg     [parity_mod_1-1:0] temp1;
    reg     [parity_mod_2-1:0] temp2;
    reg     [parity_mod_3-1:0] temp3;
    
    reg     [MAX_CODEWORD_WIDTH-1:0] final_temp;

    // multiply left_side matrix without the first row with data in
    MAT_MULT    #(  parameter A_ROWS = parity_mod_1 -1,
                    parameter A_COLS = info_mod_1,
                    parameter B_COLS = 1) m1
                (.clk(clk),
                .rst(rst),
                .A_data_in(H_matrix_1[parity_mod_1-1:1][info_mod_1-1:0]), //todo test that this is the correct selelction
                .B_data_in(data_in[info_mod_1-1:0]),
                .C_data_out(temp1));

    MAT_MULT    #(  parameter A_ROWS = parity_mod_2 -1,
                    parameter A_COLS = info_mod_2,
                    parameter B_COLS = 1) m2
                (.clk(clk),
                .rst(rst),
                .A_data_in(H_matrix_2[parity_mod_2-1:1][info_mod_2-1:0]), //todo test that this is the correct selelction
                .B_data_in(data_in[info_mod_2-1:0]),
                .C_data_out(temp2));

    MAT_MULT    #(  parameter A_ROWS = parity_mod_3 -1,
                    parameter A_COLS = info_mod_3,
                    parameter B_COLS = 1) m3
                (.clk(clk),
                .rst(rst),
                .A_data_in(H_matrix_3[parity_mod_3-1:1][info_mod_3-1:0]), //todo test that this is the correct selelction
                .B_data_in(data_in[info_mod_3-1:0]),
                .C_data_out(temp3));
    
    
    always_comb begin : output_mux
        case(mod)
            2'b00   :   final_temp =    {pad_zero_1{1'b0},
                                        data_in[info_mod_1-1:0],
                                        temp1};
            2'b01   :   final_temp =    {pad_zero_2{1'b0},
                                        data_in[info_mod_2-1:0],
                                        temp2};
            2'b10   :   final_temp =    {pad_zero_3{1'b0},
                                        data_in[info_mod_3-1:0],
                                        temp3};
            default :   final_temp =    MAX_CODEWORD_WIDTH{1'b0};
    end
    
    
    always_ff @( posedge clk ) begin 
        if (rst) begin
            data_out <= MAX_CODEWORD_WIDTH{1'b0};
        end else begin
            data_out <= final_temp;
        end
    end



endmodule

