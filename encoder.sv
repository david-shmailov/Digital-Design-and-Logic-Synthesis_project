module ENC #(
    parameter   MAX_CODEWORD_WIDTH = 32;
    parameter   MAX_INFO_WIDTH=26;
) (
    input   rst,
            clk,
            data_in,
            mod,
    output  data_out)
);

    localparam MAX_PARITY_WIDTH = MAX_CODEWORD_WIDTH - MAX_INFO_WIDTH;
    // check with TA if this is ok or we somehow need to generlize it further
    localparam info_mod_1 = 4;
    localparam info_mod_2 = 11;
    localparam info_mod_3 = 26;
    localparam parity_mod_1 = 4;
    localparam parity_mod_2 = 5;
    localparam parity_mod_3 = 6;

    localparam pad_zero_1 = MAX_CODEWORD_WIDTH - info_mod_1 - parity_mod_1;
    localparam pad_zero_2 = MAX_CODEWORD_WIDTH - info_mod_2 - parity_mod_2;
    localparam pad_zero_3 = MAX_CODEWORD_WIDTH - info_mod_3 - parity_mod_3;


    wire    rst,clk;
    wire [MAX_INFO_WIDTH-1:0]       data_in;
    reg  [MAX_CODEWORD_WIDTH-1:0]   data_out;
    wire [1:0] mod;

    wire  [MAX_CODEWORD_WIDTH-1:0] c_vector_stage1;
    wire  [MAX_CODEWORD_WIDTH-1:0] c_vector_stage2;
 
    
    // Stage 1: computing all values of C except c[middle] (C5 in the pdf)
    
    ENC_STAGE_1 stage1  (
                    .clk(clk),
                    .rst(rst),
                    .data_in(data_in),
                    .mod(mod),
                    .data_out(c_vector_stage1)
    );

    // Stage 2: computing c[middle] (C5 in the pdf) based on all other C values

    ENC_STAGE_2 stage2  (
                    .clk(clk),
                    .rst(rst),
                    .data_in(c_vector_stage1),
                    .mod(mod),
                    .data_out(data_out)
    );


endmodule
