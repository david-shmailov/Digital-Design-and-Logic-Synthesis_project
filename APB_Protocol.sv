module APB_BUS (
  //inputs
                rst,
                clk,
                PSEL,
                PADDR,
                PENABLE,
                PWDATA,
                PWRITE,
  //outputs        
                start,
                CTRL,
                DATA_IN,
                CODEWORD_WIDTH,
                NOISE,
                PRDATA
  );

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

  localparam  [3:0] CTRL_reg_addr = 4'h0;
  localparam  [3:0] DATA_IN_reg_addr = 4'h1;
  localparam  [3:0] CODEWORD_WIDTH_reg_addr = 4'h2;
  localparam  [3:0] NOISE_reg_addr = 4'h3;

  //state declaration
  localparam  [1:0]     IDLE    = 2'b00;
  localparam  [1:0]     SETUP   = 2'b01;
  localparam  [1:0]     ACCESS  = 2'b10;

  logic       [3:0]     address;
  //state declaration of present and next 
  reg [1:0] current_state,next_state;

  //memory decleration
  reg [AMBA_WORD - 1:0]mem;


  always_comb begin : address_dictionary
      case (PADDR[3:0])
        4'h0 : address = CTRL_reg_addr;
        4'h4 : address = DATA_IN_reg_addr;
        4'h8 : address = CODEWORD_WIDTH_reg_addr;
        4'hC : address = CODEWORD_WIDTH_reg_addr;
        default: address = 0;
      endcase
  end



  always @ (posedge clk) begin
    if(rst) current_state <= IDLE;
    else
      current_state <= next_state;
  end

  always @ ( * ) begin
    case(current_state)
      IDLE: begin 
        if (PSEL && !PENABLE)
          next_state  <= SETUP;
      end          
      SETUP: begin
        if (!PENABLE && !PSEL)
          next_state <= IDLE; 
        else if (PENABLE && PSEL)
          next_state <= ACCESS; 
      end
      ACCESS:
        if(!PSEL | !PENABLE) 
          next_state <= IDLE;
      default: 
        next_state <= IDLE;
    endcase
  end

  always_ff @( posedge clk ) begin
      if(current_state == ACCESS) begin
        if(PWRITE == 1) begin
            mem[address] <= PWDATA;
            if(!start)
              start <= 1'b1;
        end
        else
            PRDATA <= mem[address];
      end
  end

  always_ff @( posedge clk ) begin : direct_access
    if (rst) begin
      CTRL <= {AMBA_WORD{1'b0}};
      DATA_IN <= {AMBA_WORD{1'b0}};
      CODEWORD_WIDTH <= {AMBA_WORD{1'b0}};
      NOISE <= {AMBA_WORD{1'b0}};
    end 
    else begin
      CTRL <= mem[CTRL_reg_addr];
      DATA_IN <= mem[DATA_IN_reg_addr];
      CODEWORD_WIDTH <= mem[CODEWORD_WIDTH_reg_addr];
      NOISE <= mem[NOISE_reg_addr];
    end
  end

endmodule