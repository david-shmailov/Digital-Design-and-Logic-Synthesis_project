module APB_TB;

  //parameter configration 
  parameter       AMBA_WORD = 32;
  parameter       AMBA_ADDR_WIDTH = 20;
  parameter       DATA_WIDTH = 32; 

  //input configration 
  input logic  clk,rst;
  input logic  [AMBA_ADDR_WIDTH - 1:0]   PADDR;
  input logic  PENABLE;
  input logic  PSEL;
  input logic  [AMBA_WORD - 1:0]         PWDATA;
  input logic  PWRITE;

  //output configration
  output logic   [AMBA_WORD - 1:0]         PRDATA;
  output logic   [AMBA_WORD - 1:0]         CTRL;
  output logic   [AMBA_WORD - 1:0]         DATA_IN;
  output logic   [AMBA_WORD - 1:0]         CODEWORD_WIDTH; 
  output logic   [AMBA_WORD - 1:0]         NOISE;
  output logic                             start;
  
  //intantiation of all port
  APB_BUS  dut1(.clk(clk),.rst,.PADDR(PADDR),.PSEL(PSEL),.PENABLE(PENABLE),.PWRITE(PWRITE),.PWDATA(PWDATA),   //inputs
  .PRDATA(PRDATA),.CTRL(CTRL),.DATA_IN(DATA_IN),.CODEWORD_WIDTH(CODEWORD_WIDTH),.NOISE(NOISE),.start(start)); //outputs
  
  always #5 clk =~ clk;
  
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
      rst=1;
      #10 rst=0;
    end
  endtask
  
  
  task write_stimulus;
    begin
      @(posedge clk);
      PSEL = 1;
      PWRITE = 1;
      PWDATA = {$random}%10;
      PADDR = PADDR + 1;
     
      @(posedge clk);
      PENABLE = 1;
      PSEL = 1;
      @(posedge clk);
      PENABLE = 0;
      PSEL = 0;
      
      @(posedge clk);
      $strobe ("writing data into memory data_in=%0d adress_in=%0d" , PWDATA, PRDATA);
    end
  endtask
      
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
      
      @(posedge clk);
      $strobe("reading data from memory data_out=%0d   address_out=%0d",PRDATA,PADDR);
    end
  endtask
  
   task read_write;
  begin 
    repeat(2) begin 
      write_stimulus;
    end
    #1
    PADDR = 0;
    repeat(3) begin 
      read_stimulus;
    end
  end
  endtask
  
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    initialization;//initialize input values
    reset;// generate signal
    read_write;
     #80; $finish;
  end 
endmodule