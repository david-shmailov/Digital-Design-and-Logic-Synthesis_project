module DEC (
    input   rst,
            clk,
            data_in,
            mod,
    output  data_out,
            num_of_errors
);
    parameter   MAX_CODEWORD_WIDTH = 32;
    parameter   MAX_INFO_WIDTH=26;
    localparam MAX_PARITY_WIDTH = MAX_CODEWORD_WIDTH - MAX_INFO_WIDTH;
    // check with TA if this is ok or we somehow need to generlize it further
    localparam info_mod_1 = 4;
    localparam info_mod_2 = 11;
    localparam info_mod_3 = 26;
    localparam parity_mod_1 = 4;
    localparam parity_mod_2 = 5;
    localparam parity_mod_3 = 6;
    localparam full_length_mod_1 = info_mod_1 + parity_mod_1;
    localparam full_length_mod_2 = info_mod_2 + parity_mod_2;
    localparam full_lenvth_mod_3 = info_mod_3 + parity_mod_3;
    localparam pad_zero_1 = MAX_INFO_WIDTH - info_mod_1;
    localparam pad_zero_2 = MAX_INFO_WIDTH - info_mod_2;
    localparam pad_zero_3 = MAX_INFO_WIDTH - info_mod_3;


    wire    rst,clk;
    wire    [MAX_CODEWORD_WIDTH-1:0]    data_in;
    wire    [1:0]                       mod;
    reg     [MAX_INFO_WIDTH-1 :0]       data_out;
    reg     [1:0]                       num_of_errors;
    

    reg     [MAX_CODEWORD_WIDTH-1:0]   mult_result;
    
    reg     [MAX_CODEWORD_WIDTH-1:0]   data_out_with_parity;
    reg     [MAX_INFO_WIDTH-1:0]   data_out_without_parity;
    DEC_MULT mult (
        .rst(rst),
        .clk(clk),
        .data_in(data_in),
        .mod(mod),
        .data_out(mult_result)
    );

    DEC_CHK check (
        .rst(rst),
        .clk(clk),
        .data_in(data_in),
        .s_vector(mult_result),
        .mod(mod),
        .data_out(data_out_with_parity),
        .num_of_errors(num_of_errors)
    );
    // TBD understand how top expects the output of decoder to be in terms of bit length
    always_comb begin 
        case (mod)
            2'b00   :   data_out_without_parity = {{pad_zero_1{1'b0}},data_out_with_parity[full_length_mod_1-1 : parity_mod_1]};
            2'b01   :   data_out_without_parity = {{pad_zero_2{1'b0}},data_out_with_parity[full_length_mod_2-1 : parity_mod_2]};
            2'b10   :   data_out_without_parity = {{pad_zero_3{1'b0}},data_out_with_parity[full_length_mod_3-1 : parity_mod_3]};
            default :   data_out_without_parity = {MAX_INFO_WIDTH{1'b0}};
        endcase
    end

    always_ff @( posedge clk ) begin
        if (rst) begin
            data_out <= {MAX_INFO_WIDTH{1'b0}};
        end else begin
            data_out <= data_out_without_parity;
        end
    end


    
    


endmodule