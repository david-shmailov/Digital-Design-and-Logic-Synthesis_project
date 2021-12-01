module ENC_STAGE_1 (
                clk,rst,
                data_in,
                work_mod,
                data_out
);
    parameter   MAX_CODEWORD_WIDTH = 32;
    parameter   MAX_INFO_WIDTH=26;


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
    
    // logic [3:0][7:0]     H_matrix_1 = 32'hffe4_d2b1;
    // logic [4:0][15:0]    H_matrix_2 = 80'hffff_fe08_f1c4_cda2_ab61;
    // logic [5:0][31:0]    H_matrix_3 = 192'hffff_ffff_fffe_0010_ff01_fc08_f0f1_e384_cccd_9b42_aaab_56c1;

    // logic [4*8-1:0]      H1_MAT_D1 = 32'hffe4_d2b1;
    // logic [5*16-1:0]     H2_MAT_D1 = 80'hffff_fe08_f1c4_cda2_ab61;
    // logic [6*32-1:0]     H3_MAT_D1 = 192'hffff_ffff_fffe_0010_ff01_fc08_f0f1_e384_cccd_9b42_aaab_56c1;

    // logic   [MAX_INFO_WIDTH*MAX_PARITY_WIDTH-1:0]     H_matrix_1 = 192'h0000_0000_e400_0000_d200_0000_b100_0000; // i assume MSB bits will be zero padded
    // logic   [6*32-1:0]     H_matrix_2 = 192'h0000_0000_fe08_0000_f1c4_0000_cda2_0000_ab61;
    // logic   [6*32-1:0]     H_matrix_3 = 192'h0000_0000_fffe_0010_ff01_fc08_f0f1_e384_cccd_9b42_aaab_56c1;
    
    input logic    rst,clk;
    input logic    [MAX_INFO_WIDTH-1:0] data_in;
    input logic    [1:0] work_mod;
    output logic    [MAX_CODEWORD_WIDTH-1:0] data_out;

    logic     [MAX_INFO_WIDTH*MAX_PARITY_WIDTH -1:0] H1_stage1_1D_mat ;
    logic     [MAX_INFO_WIDTH*MAX_PARITY_WIDTH -1:0] H2_stage1_1D_mat ;
    logic     [MAX_INFO_WIDTH*MAX_PARITY_WIDTH -1:0] H3_stage1_1D_mat ;
    logic     [MAX_INFO_WIDTH*MAX_PARITY_WIDTH -1:0] mat_for_mult;
    logic     [MAX_PARITY_WIDTH-1:0] parity_bits;
    logic     [MAX_CODEWORD_WIDTH-1:0] final_temp;

    assign H1_stage1_1D_mat = 156'hE0_0000_3400_000B;
    assign H2_stage1_1D_mat = 156'h1FC_0000_78E0_0019_B400_055B;
    assign H3_stage1_1D_mat = 156'h3_FFF8_00FF_01FC_3C3C_78EC_CCD9_B6AA_AD5B;


    // multiply left_side matrix without the first row with data in

    MAT_MULT    #(  .A_ROWS(MAX_PARITY_WIDTH),
                    .A_COLS(MAX_INFO_WIDTH),
                    .B_COLS(1)
                    ) m3
                (.clk(clk),
                .rst(rst),
                .A_data_in(mat_for_mult), //todo test that this is the correct selection
                .B_data_in(data_in),
                .C_data_out(parity_bits));

    always_comb begin  : WhichMult_mode
        case (work_mod)
            2'b00 : mat_for_mult = H1_stage1_1D_mat;
            2'b01 : mat_for_mult = H2_stage1_1D_mat;
            2'b10 : mat_for_mult = H3_stage1_1D_mat;
            default: mat_for_mult = 0;
        endcase
    end
    

   
    
    
    always_comb begin : output_mux
        case(work_mod)
            2'b00   :   final_temp =    {{pad_zero_1{1'b0}},
                                        data_in[info_mod_1-1:0],
                                        parity_bits[parity_mod_1-1:0]};

            2'b01   :   final_temp =    {{pad_zero_2{1'b0}},
                                        data_in[info_mod_2-1:0],
                                        parity_bits[parity_mod_2-1:0]};

            2'b10   :   final_temp =    {{pad_zero_3{1'b0}},
                                        data_in[info_mod_3-1:0],
                                        parity_bits[parity_mod_3-1:0]};

            default :   final_temp =    {MAX_CODEWORD_WIDTH{1'b0}};
        endcase
    end
    
    
    always_ff @( posedge clk ) begin : Data_out_stage1
        if (rst) begin
            data_out <= 0;
        end else begin
            data_out <= final_temp;
        end
    end



endmodule

// H1_info matrix zero padded
// 00000000000000000000000000
// 00000000000000000000000000
// 00000000000000000000001110
// 00000000000000000000001101
// 00000000000000000000001011
// H2_info matrix zero padded
// 00000000000000000000000000
// 00000000000000011111110000
// 00000000000000011110001110
// 00000000000000011001101101
// 00000000000000010101011011
// H3_info matrix 
// 11111111111111100000000000
// 11111111000000011111110000
// 11110000111100011110001110
// 11001100110011011001101101
// 10101010101010110101011011