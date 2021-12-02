module DEC_MULT (
            rst,
            clk,
            data_in,
            work_mod,
            data_out
);
    parameter   MAX_CODEWORD_WIDTH = 32;
    parameter   MAX_INFO_WIDTH=26;
    parameter   AMBA_WORD = 32;
    localparam  MAX_PARITY_WIDTH = MAX_CODEWORD_WIDTH - MAX_INFO_WIDTH ;
    localparam  mod_1 = {{AMBA_WORD-2{1'b0}}, 2'b00};
    localparam  mod_2 = {{AMBA_WORD-2{1'b0}}, 2'b01};
    localparam  mod_3 = {{AMBA_WORD-2{1'b0}}, 2'b10};

    input logic     rst,clk;
    input logic     [MAX_CODEWORD_WIDTH-1:0]    data_in;
    input logic     [AMBA_WORD-1:0]             work_mod;
    output logic    [MAX_PARITY_WIDTH-1:0]      data_out;


    logic   [MAX_PARITY_WIDTH * MAX_CODEWORD_WIDTH-1:0]     H_matrix_1;
    logic   [MAX_PARITY_WIDTH * MAX_CODEWORD_WIDTH-1:0]     H_matrix_2;
    logic   [MAX_PARITY_WIDTH * MAX_CODEWORD_WIDTH-1:0]     H_matrix_3;
    logic   [MAX_PARITY_WIDTH * MAX_CODEWORD_WIDTH-1:0]     mat_for_mult;
    

    logic     [MAX_PARITY_WIDTH-1 :0] mult_result;

    MAT_MULT    #(  .A_ROWS(MAX_PARITY_WIDTH),
                    .A_COLS(MAX_CODEWORD_WIDTH),
                    .B_COLS(1)) m1
                (.A_data_in(mat_for_mult), 
                .B_data_in(data_in),
                .C_data_out(mult_result));

    generate
        if (MAX_CODEWORD_WIDTH == 8) begin
            assign  H_matrix_1 = 32'hFFE4_D2B1;
            assign  H_matrix_2 = 32'h0;
            assign  H_matrix_3 = 32'h0;
        end else if (MAX_CODEWORD_WIDTH == 16) begin
            assign  H_matrix_1 = 80'hFF00_E400_D200_B1;
            assign  H_matrix_2 = 80'hFFFF_FE08_F1C4_CDA2_AB61;
            assign  H_matrix_3 = 80'h0;
        end else if (MAX_CODEWORD_WIDTH == 32) begin
            assign  H_matrix_1 = 192'hFF_0000_00E4_0000_00D2_0000_00B1; 
            assign  H_matrix_2 = 192'hFFFF_0000_FE08_0000_F1C4_0000_CDA2_0000_AB61;
            assign  H_matrix_3 = 192'hFFFF_FFFF_FFFE_0010_FF01_FC08_F0F1_E384_CCCD_9B42_AAAB_56C1;
        end
    endgenerate

    

    always_comb begin : WhichMatrixToMult
        case (work_mod)
            mod_1 : mat_for_mult = H_matrix_1;
            mod_2 : mat_for_mult = H_matrix_2;
            mod_3 : mat_for_mult = H_matrix_3;
            default: mat_for_mult = 0;
        endcase
    end


    always_ff @( posedge clk or negedge rst) begin : output_reg
        if (!rst) begin
            data_out <= {MAX_PARITY_WIDTH{1'b0}};
        end else begin
            data_out <= mult_result;
        end
    end



endmodule


