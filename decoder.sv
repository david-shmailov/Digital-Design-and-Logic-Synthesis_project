module DEC #(
    parameter   MAX_CODEWORD_WIDTH = 32;
    parameter   MAX_INFO_WIDTH=26;
) (
    input   rst,
            clk,
            data_in,
            mod,
    output  data_out,
            num_of_errors
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
    wire    [MAX_CODEWORD_WIDTH-1:0]    data_in;
    wire    [1:0]                       mod;
    reg     [MAX_INFO_WIDTH-1 :0]       data_out;
    reg     [1:0]                       num_of_errors;
    

    reg     [3:0]   tmp_data_out;
    wire    [1:0]   tmp_num_of_errors;
    wire    [7:0]   column_equality_array;

    reg     [7:0]   mult_result;
    
    



    
    

    always_ff @( posedge clk ) begin 
        if (rst) begin
            data_out <= 4'h0;
            num_of_errors <= 2'h0;
        end else begin
            data_out <= tmp_data_out;
            num_of_errors <= tmp_num_of_errors;
        end
    end

    assign tmp_data_out = data_in[7:4]; //strip the parity bits and output the input data.


    

    always_comb begin : check_correctness
        for (i = 0; i<8; i=i+1) begin
            //column_equality_array[i] = mult_result == H_matrix_1[i]; // each bit indicates whether mult_result equals to that column in H
            if (mult_result == 8'b0) begin //if no errors found
                tmp_num_of_errors = 2'b0;
            end
            else if (mult_result == H_matrix_1[i]) begin //if only one error then this is the condition
                tmp_num_of_errors = 2'b01;
                tmp_data_out[i] = !tmp_data_out[i]; //TBD maybe this needs a sequencial logic
            end else begin
                tmp_num_of_errors = 2'b10;
            end
        end
    end

endmodule