module MAT_MULT (
    input       rst,
                clk,
                A_data_in,
                B_data_in,
    output      C_data_out
);
    parameter   A_ROWS = 4;
    parameter   A_COLS = 8;
    parameter   B_COLS = 1;
    localparam B_ROWS = A_COLS;
    localparam C_ROWS = A_ROWS;
    localparam C_COLS = B_COLS;

    logic    rst,clk;
    logic    [A_ROWS-1:0][A_COLS-1:0] A_data_in;
    logic    [B_ROWS-1:0][B_COLS-1:0] B_data_in;
    logic    [C_ROWS-1:0][C_COLS-1:0] C_data_out;
    logic    [C_ROWS-1:0][C_COLS-1:0] temp;

// ask TA how to beautify this code
    always_comb begin : multiplication
        for (col_index = 0; col_index < C_COLS ; col_index = col_index +1 ) begin
            for (row_index = 0; row_index < C_ROWS ; row_index = row_index +1) begin
                for (index = 0; index < A_COLS ; index = index +1) begin
                    temp[row_index][col_index] = temp[row_index][col_index] ^ (A_data_in[row_index][index] && B_data_in[index][col_index]);
                end
            end
        end
    end
    //consider transforming this into a purely combinational module
    always_ff @( posedge clk ) begin : sequencial
        if (rst) C_data_out <= 'b0;
        else C_data_out <= temp;
    end
endmodule

    

    