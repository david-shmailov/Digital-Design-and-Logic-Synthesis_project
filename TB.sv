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
module TB ;


// Local declarations
parameter AMBA_WORD = 32;
parameter AMBA_ADDR_WIDTH = 20;
parameter DATA_WIDTH = 32;

// Internal signal declarations
logic                         clk;
logic                         rst;
logic [AMBA_ADDR_WIDTH - 1:0] PADDR;
logic [AMBA_WORD - 1:0]       PWDATA;
logic                         PENABLE;
logic                         PSEL;
logic                         PWRITE;
logic [AMBA_WORD - 1:0]       PRDATA;
logic [DATA_WIDTH - 1:0]      data_out;
logic            operation_done;
logic [1:0] 				     num_of_errors;


ECC_ENC_DEC #(.DATA_WIDTH(DATA_WIDTH) , .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH) , .AMBA_WORD(AMBA_WORD)) ecc_enc_dec(
   .clk            (clk),
   .rst            (rst),
   .PADDR          (PADDR),
   .PENABLE        (PENABLE),
   .PSEL           (PSEL),
   .PWDATA         (PWDATA), 
   .PWRITE         (PWRITE),
   .PRDATA         (PRDATA),
   .data_out       (data_out),
   .operation_done (operation_done),
   .num_of_errors  (num_of_errors)
);
//=====================================================================
//clock always block:
always #1 clk = ~clk;
//======================================================================
initial begin
   PENABLE <= 1'b0;
   clk <= 1'b0;

   rst <= 1'b0;
   @(posedge clk);
   @(posedge clk);
   rst <= 1'b1;
   @(posedge clk);





   PSEL <= 1'b1;
   @(posedge clk);
   PENABLE <= 1'b1;
   PWRITE <= 1'b1;
   PADDR <= {{AMBA_ADDR_WIDTH-4{1'b0}},{4'b1100}}; // noise
   PWDATA <= {{AMBA_ADDR_WIDTH-8{1'b0}},{8'b00100000}};
   @(posedge clk);
   PSEL <= 1'b0;
   PENABLE <= 1'b0;
   @(posedge clk);

   PSEL <= 1'b1;
   @(posedge clk);
   PENABLE <= 1'b1;
   PWRITE <= 1'b1;
   PADDR <= {{AMBA_ADDR_WIDTH-4{1'b0}},{4'b1000}}; // code word width
   PWDATA <= {{AMBA_ADDR_WIDTH-4{1'b0}},{4'b0001}};
   @(posedge clk);
   PSEL <= 1'b0;
   PENABLE <= 1'b0;
   @(posedge clk);


   PSEL <= 1'b1;
   @(posedge clk);
   PENABLE <= 1'b1;
   PWRITE <= 1'b1;
   PADDR <= {{AMBA_ADDR_WIDTH-4{1'b0}},{4'b0100}}; // DATA
   PWDATA <= {{AMBA_ADDR_WIDTH-4{1'b0}},{4'b1110}};
   @(posedge clk);
   PSEL <= 1'b0;
   PENABLE <= 1'b0;
   @(posedge clk);

   PSEL <= 1'b1;
   @(posedge clk);
   PENABLE <= 1'b1;
   PWRITE  <= 1'b1;
   PADDR   <= {{AMBA_ADDR_WIDTH-4{1'b0}},{4'b0}}; // ctrl 
   PWDATA  <= {{AMBA_ADDR_WIDTH-4{1'b0}},{4'h2}}; // FC
   @(posedge clk);
   PSEL <= 1'b0;
   PENABLE <= 1'b0;
   @(posedge clk);



   #100
   $finish(0);
end

endmodule // ecc_enc_dec_tb
