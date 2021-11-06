module moduleName #(
    parameters
) (
    input   rst,
            clk,
            data_in,
    output  data_out)
);
    wire rst,clk;
    wire [3:0] data_in;
    reg  [7:0] data_out;

    reg  [7:0] d1_data_out;

    wire [7:0][3:0]    H_matrix_1  = 32'hffe4_d2b1;
    wire [3:0][3:0] right_side_H_1 = 16'hd2b1;
    wire [3:0][3:0] left_side_H_1  = 16'hffe4;

    always @(*) begin
        for(col = 0; col < 8; col = col +1)
            for(row = 0; row < 8; row = row +1)
    end
    d1_data_out [7:4] = data_in [3:0];




    always @(posedge clk or posedge rst) begin
        if  (rst) begin
            d1_data_out <= 32'h0;
        else
            d1_data_out [7:4] <= data_in [3:0];
            d1_data_out [0] <= data_in[7]  xor data_in[5] xor data_in[4];
            d1_data_out [1] <= data_in[7]  xor data_in[6] xor data_in[4];
            d1_data_out [2] <= data_in[7]  xor data_in[6] xor data_in[5];
        end
    end




endmodule