module APB_BUS #(
  parameter       AMBA_WORD = 32;
  parameter       AMBA_ADDR_WIDTH = 20;
  parameter       DATA_WIDTH = 32; 
)(
  input         rst,
                clk,
                PSEL,
                PADDR,
                PENABLE,
                PWDATA,
                PWRITE,
                direct_write,
  output        PRDATA,
                direct_read
  );

  
  //input configration 
  wire  clk,rst;
  wire  [AMBA_ADDR_WIDTH - 1:0]   PADDR;
  wire  PENABLE;
  wire  PSEL;
  wire  [AMBA_WORD - 1:0]         PWDATA;
  wire  PWRITE;

  wire  [AMBA_WORD - 1:0]         direct_write;
  //output configration
  reg   [AMBA_WORD - 1:0]         PRDATA;
  reg   [AMBA_WORD - 1:0]         direct_read;

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
        if (PSEL && !PENABLE)
          next_state  = SETUP;          
      SETUP: begin
        if (!PENABLE && !PSEL)
          next_state = IDLE; 
        else if (PEANBLE && PSEL)
          next_state = ACCESS; 
      ACCESS:
        if(!PSEL | !PENABLE) 
          next_state = IDLE;
      default: 
        next_state = IDLE;
    endcase
  end

  always_ff @( posedge clk ) begin : direct_access_check
      if (present_state == ACCESS)
        if(PWRITE == 1)
            mem[PADDR] <= PWDATA;
        else
            PRDATA <= mem[PADDR];
      end
  end

  always_ff @( posedge clk ) begin : direct_access // not sure about it
    if (rst) begin
      CTRL <= {AMBA_WORD{1'b0}};
      DATA_IN <= {AMBA_WORD{1'b0}};
      CODEWORD_WIDTH <= {AMBA_WORD{1'b0}};
      NOISE <= {AMBA_WORD{1'b0}};
    end 
    else if begin
      CTRL <= mem[0x00];
      DATA_IN <= mem[0x04];
      CODEWORD_WIDTH <= mem[0x08];
      NOISE <= mem[0x0c];;
    end
  end


endmodule