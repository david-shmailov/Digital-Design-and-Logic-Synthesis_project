`resetall
`timescale 1ns/100ps

module APB_TB;

  //parameter configration 
  parameter       AMBA_WORD = 32;
  parameter       AMBA_ADDR_WIDTH = 20;
  parameter       tbDATA_WIDTH = 32; 

  //input configration 
  logic  clk,rst;
  logic  [AMBA_ADDR_WIDTH - 1:0]   PADDR;
  logic  PENABLE;
  logic  PSEL;
  logic  [AMBA_WORD - 1:0]         PWDATA;
  logic  PWRITE;

  //output configration
  logic   [AMBA_WORD - 1:0]         PRDATA;
  logic   [AMBA_WORD - 1:0]         CTRL;
  logic   [AMBA_WORD - 1:0]         DATA_IN;
  logic   [AMBA_WORD - 1:0]         CODEWORD_WIDTH; 
  logic   [AMBA_WORD - 1:0]         NOISE;
  logic                             start;
  
  //intantiation of all port
  APB_BUS  dut1(.clk(clk),.rst,.PADDR(PADDR),.PSEL(PSEL),.PENABLE(PENABLE),.PWRITE(PWRITE),.PWDATA(PWDATA),   //inputs
  .PRDATA(PRDATA),.CTRL(CTRL),.DATA_IN(DATA_IN),.CODEWORD_WIDTH(CODEWORD_WIDTH),.NOISE(NOISE),.start(start)); //outputs
  
  always #1 clk =~ clk;

  // task initialization.
  task initialization;
    begin
      clk = 0;
      rst = 0;
      PADDR = 0;
      PSEL = 0;
      PENABLE = 0;
      PWRITE = 0;
    end
  endtask

   // task reset.
  task reset;
    begin 
      rst=0;
      #10 rst=1;
    end
  endtask
  
   // task write.  
  task write_stimulus;
    begin
      @(posedge clk);
      PSEL = 1;
      PWRITE = 1;
      PWDATA = {$random}%10;
      PADDR = {{AMBA_ADDR_WIDTH-4{1'b0}}, 4'h0};
     
      @(posedge clk);
      PENABLE = 1;

      @(posedge clk);
      PENABLE = 0;
      PSEL = 0;
      
    end
  endtask

  // task read.  
  task read_stimulus;
    begin
      @(posedge clk);
       PWRITE = 0;
       PSEL = 1;
       PENABLE = 0;

      @(posedge clk); 
      PENABLE = 1;
      PSEL = 1;
      PADDR <= PADDR + 1;
      @(posedge clk); 
      PENABLE = 0;
      {PSEL} = 0;
      
    end
  endtask
  
   // task read & write. 
  task read_write;
  begin
    repeat(2) begin 
      write_stimulus;
    end
    #1
    PADDR = 0;
    repeat(2) begin 
      read_stimulus;
    end
  end
  endtask
  
    initial begin
    initialization;//initialize input values
    reset;// generate signal
    read_write;
     #80; $finish;
  end 
endmodule