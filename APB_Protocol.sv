module APB_Bus #(rst,clk,PSEL,PADDR,PENABLE,PWDATA,PWRITE,PRDATA);

  parameter       AMBA_WORD = 32;
  parameter       AMBA_ADDR_WIDTH = 20;
  parameter       DATA_WIDTH = 32;) 
  //input configration 
  input   wire  clk,rst;
  input   wire  [AMBA_ADDR_WIDTH - 1:0]   PADDR;
  input   wire  PENABLE;
  input   wire  PSEL;
  input   wire  [AMBA_WORD - 1:0]         PWDATA;
  input   wire  PWRITE;

  //output configration
  output  reg   [AMBA_WORD - 1:0]         PRDATA;

  //state declaration
  localparam  [1:0]     IDLE    = 2'b00;
  localparam  [1:0]     SETUP   = 2'b01;
  localparam  [1:0]     ACCESS  = 2'b10;

  //state declaration of present and next 
  reg [1:0] present_state,next_state;

  //memory decleration
  reg [15:0]mem[15:0];

  always @(posedge clk) begin
    if(rst) present_state <= IDLE;
    else
      present_state <= next_state;
  end

  always @ (*) begin
    case (present_state)
      IDLE: begin 
        if (PSEL & !PENABLE)
          next_state  <= SETUP;          
      SETUP: begin
        if (!PENABLE & !PSEL) 
          next_state = IDLE; 
        else begin
          next_state = ACCESS;    
          if(PWRITE == 1)
            mem[PADDR] = PWDATA;
          else
            PRDATA = mem[PADDR];
        end  
      ACCESS:
        if(!PSEL | !PENABLE) 
          next_state = IDLE;
      default: 
        next_state <= IDLE;
    endcase
  end
 
endmodule