//
// Verilog Module my_project4_lib.TB
//
// Created:
//          by - ameen.UNKNOWN (DESKTOP-FHOE60L)
//          at - 15:32:20 11/30/2021
//
// using Mentor Graphics HDL Designer(TM) 2018.2 (Build 19)
//

`resetall
`timescale 1ns/100ps
module tb_encoder ;


// Local declarations
parameter AMBA_WORD = 32;
parameter AMBA_ADDR_WIDTH = 20;
parameter DATA_WIDTH = 32;

// Internal signal declarations
logic                            clk;
logic                            rst;
logic   [26-1:0]          data_in_32;
logic   [32-1:0]          data_out_32;
logic   [32-1 :0]         work_mod_32;


logic   [11-1:0]           data_in_16;
logic   [16-1:0]           data_out_16;
logic   [24-1 :0]          work_mod_16;

logic   [4-1:0]            data_in_8;
logic   [8-1:0]            data_out_8;
logic   [16-1 :0]          work_mod_8;




ENC #(//defparam
                .MAX_CODEWORD_WIDTH(32),
                .MAX_INFO_WIDTH(26),
                .AMBA_WORD(32)
) encoder_32 (
                //input                       
                .rst(rst),
                .clk(clk),
                .data_in(data_in_32),
                .work_mod(work_mod_32), 
                //output
                .data_out(data_out_32)
);

ENC #(//defparam
                .MAX_CODEWORD_WIDTH(16),
                .MAX_INFO_WIDTH(11),
                .AMBA_WORD(24)
        ) encoder_16 (
                //input                       
                .rst(rst),
                .clk(clk),
                .data_in(data_in_16),
                .work_mod(work_mod_16), 
                //output
                .data_out(data_out_16)
);

ENC #(//defparam
                .MAX_CODEWORD_WIDTH(8),
                .MAX_INFO_WIDTH(4),
                .AMBA_WORD(16)
        ) encoder_8 (
                //input                       
                .rst(rst),
                .clk(clk),
                .data_in(data_in_8),
                .work_mod(work_mod_8), 
                //output
                .data_out(data_out_8)
);
//=====================================================================
//clock always block:
always #1 clk = ~clk;
//======================================================================
initial begin
   clk <= 1'b0;

   rst <= 1'b0;
   #2
   rst <= 1'b1;
   #2
   work_mod_8 <= 2'b00;
   work_mod_16 <= 2'b00;
   work_mod_32 <= 2'b00;

   data_in_8 <= 4'b1010;
   data_in_16 <= 11'b1010;
   data_in_32 <= 26'b1010;

   #100
   $finish(0);
end

endmodule // ecc_enc_dec_tb
