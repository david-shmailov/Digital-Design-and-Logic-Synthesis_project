module ENC_STAGE_1_ver2 (
    input       clk,rst,
                data_in,
                mod,
    output      data_out
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
    
    logic [3:0][7:0]     H_matrix_1 = 32'hffe4_d2b1;
    logic [4:0][15:0]    H_matrix_2 = 80'hffff_fe08_f1c4_cda2_ab61;
    logic [5:0][31:0]    H_matrix_3 = 192'hffff_ffff_fffe_0010_ff01_fc08_f0f1_e384_cccd_9b42_aaab_56c1;

    logic [4*8-1:0]      H1_MAT_D1 = 32'hffe4_d2b1;
    logic [5*16-1:0]     H2_MAT_D1 = 80'hffff_fe08_f1c4_cda2_ab61;
    logic [6*32-1:0]     H3_MAT_D1 = 192'hffff_ffff_fffe_0010_ff01_fc08_f0f1_e384_cccd_9b42_aaab_56c1;

    logic    rst,clk;
    logic    [MAX_INFO_WIDTH-1:0] data_in;
    logic    [1:0] mod;
    logic    [MAX_CODEWORD_WIDTH-1:0] data_out;

    logic     [MAX_INFO_WIDTH*MAX_PARITY_WIDTH -1:0] H1_stage1_1D_mat;
    logic     [MAX_INFO_WIDTH*MAX_PARITY_WIDTH -1:0] H2_stage1_1D_mat;
    logic     [MAX_INFO_WIDTH*MAX_PARITY_WIDTH -1:0] H3_stage1_1D_mat;

    logic     [MAX_INFO_WIDTH*MAX_PARITY_WIDTH -1:0] mat_for_mult;
    logic     [parity_mod_1-2:0] temp1; //notice its -2, since we will put 0 where the last parity bit is to be,
    logic     [parity_mod_2-2:0] temp2; // it will be calculated in stage 2.
    logic     [parity_mod_3-2:0] temp3;

    logic     [MAX_PARITY_WIDTH-1:0] parity_bits;
    
    logic     [MAX_CODEWORD_WIDTH-1:0] final_temp;

    // multiply left_side matrix without the first row with data in

    for (row = 0; row < MAX_PARITY_WIDTH ; row = row+1 ) begin
        if (row <= MAX_PARITY_WIDTH - parity_mod_1) // it is less than or equal to not include the first row of the matrix
            assign H1_stage1_1D_mat = {MAX_INFO_WIDTH{1'b0}};
        else
            assign H1_stage1_1D_mat = {{MAX_INFO_WIDTH-info_mod_1{1'b0}},H_matrix_1[row-MAX_PARITY_WIDTH-parity_mod_1][info_mod_1-1:0]};
    end

    for (row = 0; row < MAX_PARITY_WIDTH ; row = row+1 ) begin
        if (row <= MAX_PARITY_WIDTH - parity_mod_2) 
            assign H2_stage1_1D_mat = {MAX_INFO_WIDTH{1'b0}};
        else
            assign H2_stage1_1D_mat = {{MAX_INFO_WIDTH-info_mod_2{1'b0}},H_matrix_2[row-MAX_PARITY_WIDTH-parity_mod_2][info_mod_2-1:0]};
    end

     for (row = 0; row < MAX_PARITY_WIDTH ; row = row+1 ) begin
        if (row <= MAX_PARITY_WIDTH - parity_mod_3) 
            assign H3_stage1_1D_mat = {MAX_INFO_WIDTH{1'b0}};
        else
            assign H3_stage1_1D_mat = {{MAX_INFO_WIDTH-info_mod_3{1'b0}},H_matrix_3[row-MAX_PARITY_WIDTH-parity_mod_3][info_mod_3-1:0]};
    end



    case (mod)
        2'b00: mat_for_mult = H1_stage1_1D_mat;
        2'b01: mat_for_mult = H2_stage1_1D_mat;
        2'b10: mat_for_mult = H3_stage1_1D_mat;
        default: 'b0;
    endcase

    MAT_MULT    #(  .A_ROWS(MAX_PARITY_WIDTH),
                    .A_COLS(MAX_INFO_WIDTH),
                    .B_COLS(1)
                    ) m3
                (.clk(clk),
                .rst(rst),
                .A_data_in(mat_for_mult), //todo test that this is the correct selection
                .B_data_in(data_in),
                .C_data_out(parity_bits));
    
    
    always_comb begin : output_mux
        case(mod)
            2'b00   :   final_temp =    {pad_zero_1{1'b0},
                                        data_in[info_mod_1-1:0],
                                        parity_bits[parity_mod_1-1:0]};

            2'b01   :   final_temp =    {pad_zero_2{1'b0},
                                        data_in[info_mod_2-1:0],
                                        parity_bits[parity_mod_2-1:0]};

            2'b10   :   final_temp =    {pad_zero_3{1'b0},
                                        data_in[info_mod_3-1:0],
                                        parity_bits[parity_mod_3-1:0]};

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

