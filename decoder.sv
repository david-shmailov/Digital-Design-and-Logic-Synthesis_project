module DEC #(
    parameters
) (
    input   rst,
            clk,
            data_in,
    output  data_out,
            num_of_errors
);

    wire    rst,clk;
    wire    [7:0]   data_in;
    reg     [3:0]   data_out;
    reg     [1:0]   num_of_errors;
    

    wire [7:0][3:0] H_matrix_1      = 32'hffe4_d2b1;
    wire [3:0][3:0] right_side_H_1  = 16'hd2b1;
    wire [3:0][3:0] left_side_H_1   = 16'hffe4;

    wire    [3:0]   tmp_data_out;
    wire    [1:0]   tmp_num_of_errors;
    wire    [7:0]   column_equality_array;

    reg     [7:0]   mult_result;
        
    end

    always_ff @( clk ) begin 
        if (rst) begin
            data_out <= 4'h0;
            num_of_errors <= 2'h0;
        else
            data_out <= tmp_data_out;
            num_of_errors <= tmp_num_of_errors;
        end
    end




    always_comb begin : decode
        for (i = 0;i<8 ;i=i+1 ) begin
            for (j = 0 ;j<8 ;j=j+1 ) begin
                mult_result[i] = mult_result[i] xor (H_matrix_1[i][j] and data_in[j]);
            end
        end //maybe seperate multiplication and checking to different stages?
        if (mult_result == 8'h00) begin
            tmp_num_of_errors = 0;
            tmp_data_out = data_in[7:4];
        else if (column_equality_array != 0)
        end
    end

endmodule