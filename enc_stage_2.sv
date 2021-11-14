module ENC_STAGE_2 #(
    parameter   A_ROWS = 4;
    parameter   A_COLS = 4;
) (
    input       clk,rst,
                data_in,
                mod,
    output      data_out
);
    wire    rst,clk;
    wire    [A_ROWS-1:0][A_COLS-1:0] parity_mat;
    reg     [C_ROWS-1:0]             data_out;
    reg     [C_ROWS-1:0][C_COLS-1:0] temp;

endmodule

