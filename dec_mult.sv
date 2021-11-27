module DEC_MULT (
    input   rst,
            clk,
            data_in,
            mod,
    output  data_out
);
    parameter   MAX_CODEWORD_WIDTH = 32;
    parameter   MAX_INFO_WIDTH=26;
    localparam MAX_PARITY_WIDTH = MAX_CODEWORD_WIDTH - MAX_INFO_WIDTH ;
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

    logic    rst,clk;
    logic    [MAX_CODEWORD_WIDTH-1:0]    data_in;
    logic    [1:0]                       mod;
    logic     [MAX_PARITY_WIDTH-1:0]      data_out;


    logic   [MAX_PARITY_WIDTH * MAX_CODEWORD_WIDTH-1:0]     H_matrix_1 = 192'hFF_0000_00E4_0000_00D2_0000_00B1; // i assume MSB bits will be zero padded
    logic   [MAX_PARITY_WIDTH * MAX_CODEWORD_WIDTH-1:0]     H_matrix_2 = 192'hFFFF_0000_FE08_0000_F1C4_0000_CDA2_0000_AB61;
    logic   [MAX_PARITY_WIDTH * MAX_CODEWORD_WIDTH-1:0]     H_matrix_3 = 192'hFFFF_FFFF_FFFE_0010_FF01_FC08_F0F1_E384_CCCD_9B42_AAAB_56C1;
    logic   [MAX_PARITY_WIDTH * MAX_CODEWORD_WIDTH-1:0]     mat_for_mult;
    
    logic     [MAX_PARITY_WIDTH-1 :0] mult_result;

    MAT_MULT    #(  .A_ROWS(MAX_PARITY_WIDTH),
                    .A_COLS(MAX_CODEWORD_WIDTH),
                    .B_COLS(1)) m1
                (.clk(clk),
                .rst(rst),
                .A_data_in(mat_for_mult), 
                .B_data_in(data_in),
                .C_data_out(mult_result));

    always_comb begin 
        case (mod)
            2'b00 : mat_for_mult = H_matrix_1;
            2'b01 : mat_for_mult = H_matrix_2;
            2'b10 : mat_for_mult = H_matrix_3;
            default: mat_for_mult = 0;
        endcase
    end


    always_ff @( posedge clk ) begin : output_reg
        if (rst) begin
            data_out <= {MAX_PARITY_WIDTH{1'b0}};
        end else begin
            data_out <= mult_result;
        end
    end



endmodule


