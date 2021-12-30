module ENC_STAGE_1 (
                clk,rst,enable,
                data_in,
                work_mod,
                data_out
);
    parameter   AMBA_WORD = 32;
    parameter   MAX_CODEWORD_WIDTH = 32;
    parameter   MAX_INFO_WIDTH=26;

    localparam mod_1 = {{AMBA_WORD-2{1'b0}}, 2'b00};
    localparam mod_2 = {{AMBA_WORD-2{1'b0}}, 2'b01};
    localparam mod_3 = {{AMBA_WORD-2{1'b0}}, 2'b10};

    // parameters for various widths:
    localparam MAX_PARITY_WIDTH = MAX_CODEWORD_WIDTH - MAX_INFO_WIDTH;
    localparam info_mod_1 = 4;
    localparam info_mod_2 = 11;
    localparam info_mod_3 = 26;
    localparam parity_mod_1 = 4;
    localparam parity_mod_2 = 5;
    localparam parity_mod_3 = 6;

    localparam pad_zero_1 = MAX_CODEWORD_WIDTH - info_mod_1 - parity_mod_1;
    localparam pad_zero_2 = MAX_CODEWORD_WIDTH - info_mod_2 - parity_mod_2;
    
    // I/O
    input logic     rst,clk,enable;
    input logic     [MAX_INFO_WIDTH-1:0]        data_in;
    input logic     [AMBA_WORD -1:0]            work_mod;
    output logic    [MAX_CODEWORD_WIDTH-1:0]    data_out;

    // signals
    logic     [MAX_INFO_WIDTH*MAX_PARITY_WIDTH -1:0]    H1_stage1_1D_mat ;
    logic     [MAX_INFO_WIDTH*MAX_PARITY_WIDTH -1:0]    H2_stage1_1D_mat ;
    logic     [MAX_INFO_WIDTH*MAX_PARITY_WIDTH -1:0]    H3_stage1_1D_mat ;
    logic     [MAX_INFO_WIDTH*MAX_PARITY_WIDTH -1:0]    mat_for_mult;
    logic     [MAX_PARITY_WIDTH-1:0]                    parity_bits;
    logic     [MAX_CODEWORD_WIDTH-1:0]                  final_temp;



    // multiply part of the H_matrix with data in 
    //(only info part of the matrix, with first row of 1's being replaced by a row of zeros) 

    MAT_MULT    #(  .A_ROWS(MAX_PARITY_WIDTH),
                    .A_COLS(MAX_INFO_WIDTH),
                    .B_COLS(1)
    ) matrix_multiplier (
                .A_data_in(mat_for_mult), 
                .B_data_in(data_in),
                .C_data_out(parity_bits)
    );



    generate
        always_comb begin : output_mux
            if (MAX_CODEWORD_WIDTH == 8) begin

                H1_stage1_1D_mat = 16'hEDB;// we want the first rows to be padded zeros.
                H2_stage1_1D_mat = 16'h0;
                H3_stage1_1D_mat = 16'h0;
                case(work_mod)
                    mod_1   :   final_temp =    {data_in,
                                                parity_bits};
                    mod_2   :   final_temp =    {MAX_CODEWORD_WIDTH{1'b0}};
                    mod_3   :   final_temp =    {MAX_CODEWORD_WIDTH{1'b0}};

                    default :   final_temp =    {MAX_CODEWORD_WIDTH{1'b0}};
                endcase
            end else if (MAX_CODEWORD_WIDTH == 16) begin

                H1_stage1_1D_mat = 55'h380_680B;// we want the first rows to be padded zeros.
                H2_stage1_1D_mat = 55'hFE1_E3B3_6D5B;
                H3_stage1_1D_mat = 55'h0;
                case(work_mod)
                    mod_1   :   final_temp =    {{pad_zero_1{1'b0}},
                                                data_in[info_mod_1-1:0],
                                                parity_bits[parity_mod_1-1:0]};

                    mod_2   :   final_temp =    {data_in,
                                                parity_bits};
                    
                    mod_3   :   final_temp =    {MAX_CODEWORD_WIDTH{1'b0}};

                    default :   final_temp =    {MAX_CODEWORD_WIDTH{1'b0}};
                endcase

            end else if (MAX_CODEWORD_WIDTH == 32) begin

                H1_stage1_1D_mat = 156'hE0_0000_3400_000B; // we want the first rows to be padded zeros.
                H2_stage1_1D_mat = 156'h1FC_0000_78E0_0019_B400_055B;
                H3_stage1_1D_mat = 156'h3_FFF8_00FF_01FC_3C3C_78EC_CCD9_B6AA_AD5B;
                case(work_mod)
                    mod_1   :   final_temp =    {{pad_zero_1{1'b0}},
                                                data_in[info_mod_1-1:0],
                                                parity_bits[parity_mod_1-1:0]};

                    mod_2   :   final_temp =    {{pad_zero_2{1'b0}},
                                                data_in[info_mod_2-1:0],
                                                parity_bits[parity_mod_2-1:0]};

                    mod_3   :   final_temp =    {
                                                data_in[info_mod_3-1:0],
                                                parity_bits[parity_mod_3-1:0]};

                    default :   final_temp =    {MAX_CODEWORD_WIDTH{1'b0}};
                endcase
            end
        end
    endgenerate



    always_comb begin  : matrix_selector
        case (work_mod)
            mod_1 : mat_for_mult = H1_stage1_1D_mat;
            mod_2 : mat_for_mult = H2_stage1_1D_mat;
            mod_3 : mat_for_mult = H3_stage1_1D_mat;
            default: mat_for_mult = 0;
        endcase
    end
    
    
    
    
    
    
    always_ff @( posedge clk or negedge rst) begin : output_reg
        if (!rst) begin
            data_out <= 0;
        end else if (enable) begin
            data_out <= final_temp;
        end
    end



endmodule

// this is an example of how the matrices are represented with DATA_WIDTH = 32 instantiation.
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