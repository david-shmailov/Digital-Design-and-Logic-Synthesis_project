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
parameter AMBA_WORD = 16;
parameter AMBA_ADDR_WIDTH = 20;
parameter DATA_WIDTH = 16;

localparam  ENCODER_ONLY = {{AMBA_WORD-2{1'b0}}, 2'b00}; //Encoder Only
localparam  DECODER_ONLY = {{AMBA_WORD-2{1'b0}}, 2'b01}; //Decoder Only
localparam  FULL_CHANNEL = {{AMBA_WORD-2{1'b0}}, 2'b10}; //Full Channel

        
localparam  CTRL_ADDR           = {{AMBA_ADDR_WIDTH-4{1'b0}},4'h0};
localparam  DATA_IN_ADDR        = {{AMBA_ADDR_WIDTH-4{1'b0}},4'h4};
localparam  CODEWORD_WIDTH_ADDR = {{AMBA_ADDR_WIDTH-4{1'b0}},4'h8};
localparam  NOISE_ADDR          = {{AMBA_ADDR_WIDTH-4{1'b0}},4'hC};

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
   PADDR <= NOISE_ADDR;
   PWDATA <= {{AMBA_ADDR_WIDTH-8{1'b0}},{8'b00100010}};
   @(posedge clk);
   PSEL <= 1'b0;
   PENABLE <= 1'b0;
   @(posedge clk);

   PSEL <= 1'b1;
   @(posedge clk);
   PENABLE <= 1'b1;
   PWRITE <= 1'b1;
   PADDR <= CODEWORD_WIDTH_ADDR;
   PWDATA <= {{AMBA_ADDR_WIDTH-4{1'b0}},{4'b0000}};
   @(posedge clk);
   PSEL <= 1'b0;
   PENABLE <= 1'b0;
   @(posedge clk);


   PSEL <= 1'b1;
   @(posedge clk);
   PENABLE <= 1'b1;
   PWRITE <= 1'b1;
   PADDR <= DATA_IN_ADDR;
   PWDATA <= {{AMBA_ADDR_WIDTH-8{1'b0}},{8'b10101110}};
   @(posedge clk);
   PSEL <= 1'b0;
   PENABLE <= 1'b0;
   @(posedge clk);

   PSEL <= 1'b1;
   @(posedge clk);
   PENABLE <= 1'b1;
   PWRITE  <= 1'b1;
   PADDR   <= CTRL_ADDR;
   PWDATA  <= FULL_CHANNEL;
   @(posedge clk);
   PSEL <= 1'b0;
   PENABLE <= 1'b0;
   @(posedge clk);



   #50
   $finish(0);
end

endmodule // ecc_enc_dec_tb
