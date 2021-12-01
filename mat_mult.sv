module MAT_MULT (
                rst,
                clk,
                A_data_in,
                B_data_in,
                C_data_out
);
    parameter   A_ROWS = 4;
    parameter   A_COLS = 8;
    parameter   B_COLS = 1;
    localparam B_ROWS = A_COLS;
    localparam C_ROWS = A_ROWS;
    localparam C_COLS = B_COLS;

    input logic    rst,clk;
    input logic    [A_ROWS*A_COLS-1:0] A_data_in;
    input logic    [B_ROWS*B_COLS-1:0] B_data_in;
    output logic   [C_ROWS*C_COLS-1:0] C_data_out;


    logic    [C_ROWS*C_COLS-1:0] temp;
    logic    [A_ROWS-1:0][A_COLS-1:0] A_2D;
    logic    [B_ROWS-1:0][B_COLS-1:0] B_2D;
    logic    [C_ROWS-1:0][C_COLS-1:0] C_2D;
    integer row;

    always_comb begin : OneDto2D
        for (row = 0; row<A_ROWS ;row = row +1 ) begin
            //A_2D[row] = A_data_in[A_COLS*row + A_COLS -1: A_COLS*row];
            //A_2D[row] = A_data_in[A_COLS*row +: A_COLS -1];
        end
        for (row = 0; row<B_ROWS ;row = row +1 ) begin
            //B_2D[row] = B_data_in[B_COLS*row + B_COLS -1: B_COLS*row];
            //B_2D[row] = B_data_in[B_COLS*row +: B_COLS -1];
        end
    end


// ask TA how to beautify this code
    always_comb begin : multiplication
        for (int col_index = 0; col_index < C_COLS ; col_index = col_index +1 ) begin
            for (int row_index = 0; row_index < C_ROWS ; row_index = row_index +1) begin
                for (int index = 0; index < A_COLS ; index = index +1) begin
                    //temp[row_index*C_COLS + col_index] = temp[row_index*C_COLS + col_index] ^ (A_2D[row_index][index] && B_2D[index][col_index]);
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

    





    