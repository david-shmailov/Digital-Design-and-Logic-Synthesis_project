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


    logic    [C_ROWS*C_COLS-1:0] flat_temp;
    
    logic    [A_ROWS-1:0][A_COLS-1:0] A_2D;
    logic    [B_ROWS-1:0][B_COLS-1:0] B_2D;
    logic    [C_ROWS-1:0][C_COLS-1:0] C_2D;
    genvar row;
    generate
        //1D to 2D
        for (row = 0; row<A_ROWS ;row = row +1 ) begin
            assign A_2D[row] = A_data_in[A_COLS*row +: A_COLS -1];
        end
        for (row = 0; row<B_ROWS ;row = row +1 ) begin
            assign B_2D[row] = B_data_in[B_COLS*row +: B_COLS -1];
        end
        //2D to 1D
        for (row = 0; row<C_ROWS; row = row +1) begin
            assign flat_temp[C_COLS*row +: C_COLS-1] = C_2D[row];
        end
    endgenerate
        
        



// ask TA how to beautify this code

    genvar col_index, row_index, index;
    generate
        for (col_index = 0; col_index < C_COLS ; col_index = col_index +1 ) begin
            for (row_index = 0; row_index < C_ROWS ; row_index = row_index +1) begin
                for (index = 0; index < A_COLS ; index = index +1) begin
                    assign C_2D[row_index][col_index] = C_2D[row_index][col_index] ^ (A_2D[row_index][index] && B_2D[index][col_index]);
                end
            end
        end
    endgenerate

    
    //consider transforming this into a purely combinational module
    always_ff @( posedge clk ) begin : sequencial
        if (rst) C_data_out <= 0;
        else C_data_out <= flat_temp;
    end
endmodule

    





    