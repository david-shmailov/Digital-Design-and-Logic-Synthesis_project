module DEC (
            rst,
            clk,
            enable,
            data_in,
            work_mod,
            data_out,
            num_of_errors
);
    parameter   MAX_CODEWORD_WIDTH = 32;
    parameter   MAX_INFO_WIDTH=26;
    parameter   AMBA_WORD = 32;
    localparam mod_1 = 2'b00;
    localparam mod_2 = 2'b01;
    localparam mod_3 = 2'b10;


    localparam  MAX_PARITY_WIDTH = MAX_CODEWORD_WIDTH - MAX_INFO_WIDTH;
    // check with TA if this is ok or we somehow need to generlize it further
    localparam info_mod_1 = 4;
    localparam info_mod_2 = 11;
    localparam info_mod_3 = 26;
    localparam parity_mod_1 = 4;
    localparam parity_mod_2 = 5;
    localparam parity_mod_3 = 6;
    localparam full_length_mod_1 = info_mod_1 + parity_mod_1;
    localparam full_length_mod_2 = info_mod_2 + parity_mod_2;
    localparam full_length_mod_3 = info_mod_3 + parity_mod_3;
    localparam pad_zero_1 = MAX_CODEWORD_WIDTH - info_mod_1;
    localparam pad_zero_2 = MAX_CODEWORD_WIDTH - info_mod_2;
    localparam pad_zero_3 = MAX_CODEWORD_WIDTH - info_mod_3;


    input logic    rst,clk,enable;
    input logic    [MAX_CODEWORD_WIDTH-1:0]    data_in;
    input logic    [1:0]             work_mod;
    output logic   [MAX_CODEWORD_WIDTH-1 :0]   data_out;
    output logic   [1:0]                       num_of_errors;
    

    logic     [MAX_PARITY_WIDTH-1:0]   mult_result;
    
    logic     [MAX_CODEWORD_WIDTH-1:0]   data_out_with_parity;
    //logic     [MAX_CODEWORD_WIDTH-1:0]   data_out_without_parity; // more zero padding is added

    DEC_MULT #(
        .MAX_CODEWORD_WIDTH(MAX_CODEWORD_WIDTH),
        .MAX_INFO_WIDTH(MAX_INFO_WIDTH),
        .AMBA_WORD(AMBA_WORD)
    )mult (
        .rst(rst),
        .clk(clk),
        .enable(enable),
        .data_in(data_in),
        .work_mod(work_mod),
        .data_out(mult_result)
    );

    DEC_CHK #(
        .MAX_CODEWORD_WIDTH(MAX_CODEWORD_WIDTH),
        .MAX_INFO_WIDTH(MAX_INFO_WIDTH),
        .AMBA_WORD(AMBA_WORD)
    ) check (
        .rst(rst),
        .clk(clk),
        .enable(enable),
        .data_in(data_in),
        .s_vector(mult_result),
        .work_mod(work_mod),
        .data_out(data_out_with_parity), 
        .num_of_errors(num_of_errors)
    );
    // dec_check has registered output , so no need to add a register output here as well.

    generate
    always_comb begin  : DataOut_mode
        if (MAX_CODEWORD_WIDTH == 8) begin
            case (work_mod)
                mod_1   :   data_out = {{pad_zero_1{1'b0}},data_out_with_parity[full_length_mod_1-1 : parity_mod_1]};
                default :   data_out = {{MAX_CODEWORD_WIDTH - 4{1'b0}},data_out_with_parity[3:0]}; // clean when sythsizer
            endcase
        end else if (MAX_CODEWORD_WIDTH == 16) begin
            case (work_mod)
                mod_1   :   data_out = {{pad_zero_1{1'b0}},data_out_with_parity[full_length_mod_1-1 : parity_mod_1]};
                mod_2   :   data_out = {{pad_zero_2{1'b0}},data_out_with_parity[full_length_mod_2-1 : parity_mod_2]};
                default :   data_out = {{MAX_CODEWORD_WIDTH - 4{1'b0}},data_out_with_parity[3:0]}; // clean when sythsizer
            endcase
        end else if (MAX_CODEWORD_WIDTH == 32) begin
            case (work_mod)
                mod_1   :   data_out = {{pad_zero_1{1'b0}},data_out_with_parity[full_length_mod_1-1 : parity_mod_1]};
                mod_2   :   data_out = {{pad_zero_2{1'b0}},data_out_with_parity[full_length_mod_2-1 : parity_mod_2]};
                mod_3   :   data_out = {{pad_zero_3{1'b0}},data_out_with_parity[full_length_mod_3-1 : parity_mod_3]};
                default :   data_out = {{MAX_CODEWORD_WIDTH - 4{1'b0}},data_out_with_parity[3:0]}; // clean when sythsizer
            endcase
        end
    end
    endgenerate


endmodule