module tb;
  //input configration 
  logic clk;
  logic rst;
  logic [31:0]PADDR;
 
  logic PSEL;
  logic PENABLE;
  logic PWRITE;
  logic [31:0]PWDATA;

   //output configration
  wire [31:0]PRDATA;
  
  //intantiation of all port
  AMBA_BUS  dut1(clk,rst,PADDR,PSEL,PENABLE,PWRITE,PWDATA,PRDATA);
  
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