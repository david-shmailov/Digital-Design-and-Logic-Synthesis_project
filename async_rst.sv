module ASYNC_RST (
                    rst_n,
                    clk,
                    rst_in);

    input logic clk, rst_in;
    output logic rst_n;
    logic rff1;

    
    always_ff @(posedge clk or negedge rst_in) begin
        if (!rst_in) {rst_n,rff1} <= 2'b0;
        else {rst_n,rff1} <= {rff1,1'b1};   
    end
endmodule