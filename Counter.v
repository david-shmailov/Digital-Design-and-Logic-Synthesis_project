//
// Verilog Module Lab1_lib.Counter
//
// Created:
//          by - benmaorr.UNKNOWN (L330W522_NEW)
//          at - 09:31:28 11/ 4/2021
//
// using Mentor Graphics HDL Designer(TM) 2019.2 (Build 5)
//

`resetall
`timescale 1ns/10ps
module Counter 
#(
parameter WIDTH = 10
)
(
input wire clk,
input wire artsn,
input wire up,
input wire down,
output reg [WIDTH-1:0] count_value
);

always @(posedge clk or negedge arstn)
begin : counter_logic 
  if(~artsn)
    count_value <= {WIDTH{1'b0}};
  else begin
    if(up& ~down)
      count_value <= count_value+1;
    else if(up& ~down)
      count_value <= count_value-1;
    end
  end
endmodule


