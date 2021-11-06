module moduleName #(
    parameters
) (
    input   rst,
            clk,
            data_in,
    output  data_out)
);
    wire rst,clk;
    wire [31:0] data_in;
    reg  [31:0] data_out;

    always @(posedge clk ) begin
        
    end



endmodule