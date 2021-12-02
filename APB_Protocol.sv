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

  localparam  CTRL_reg_addr = {{AMBA_ADDR_WIDTH-4{1'b0}} , 4'h0};
  localparam  DATA_IN_reg_addr = {{AMBA_ADDR_WIDTH-4{1'b0}},4'h4};
  localparam  CODEWORD_WIDTH_reg_addr = {{AMBA_ADDR_WIDTH-4{1'b0}},4'h8};
  localparam  NOISE_reg_addr = {{AMBA_ADDR_WIDTH-4{1'b0}},4'hC};

  //state declaration
  localparam  [1:0]     IDLE    = 2'b00;
  localparam  [1:0]     SETUP   = 2'b01;
  localparam  [1:0]     ACCES   = 2'b10;

  //state declaration of present and next 
  logic [1:0] current_state,next_state;

// APB FSM
  always @ (posedge clk or negedge rst) begin : state_assign
    if(!rst) current_state <= IDLE;
    else
      current_state <= next_state;
  end

  always_comb begin : APB_FSM
    case(current_state)
      IDLE: begin 
        if (PSEL && !PENABLE)
          next_state = SETUP;
        else
          next_state = IDLE;
      end          
      SETUP: begin
        if (!PENABLE && !PSEL)
          next_state = IDLE; 
        else if (PENABLE && PSEL)
          next_state = ACCES;
        else
          next_state = SETUP;
      end
      ACCES:
        if(!PSEL | !PENABLE) 
          next_state = IDLE;
        else
          next_state = ACCES;
      default: 
        next_state = IDLE;
    endcase
  end


// read from memory

  always_ff @( posedge clk or negedge rst) begin : read
    if(!rst) begin
      PRDATA <= {AMBA_WORD{1'b0}};
    end else if (current_state == ACCES && PWRITE == 0) begin
      case (PADDR)
        CTRL_reg_addr           :   PRDATA <= CTRL;
        DATA_IN_reg_addr        :   PRDATA <= DATA_IN;
        CODEWORD_WIDTH_reg_addr :   PRDATA <= CODEWORD_WIDTH;
        NOISE_reg_addr          :   PRDATA <= NOISE;
        default                 :   PRDATA <= 0;
      endcase
    end else begin
      PRDATA <= PRDATA;
    end
  end


// writing to memory:
  always_ff @( posedge clk or negedge rst) begin : ctrl
    if(!rst) begin
      CTRL <= {AMBA_WORD{1'b0}};
      start <= 1'b0;
    end else if(current_state == ACCES && PWRITE == 1 && PADDR[3:0] == 4'h0) begin
      CTRL <= PWDATA;
      start <= 1'b1;
    end else begin
      CTRL <= CTRL;
    end
  end



  always_ff @( posedge clk or negedge rst) begin : data_in
    if(!rst) begin
      DATA_IN <= {AMBA_WORD{1'b0}};
    end else if(current_state == ACCES && PWRITE == 1 && PADDR[3:0] == 4'h4) begin
      DATA_IN <= PWDATA;
    end else begin
      DATA_IN <= DATA_IN;
    end
  end

  always_ff @( posedge clk or negedge rst) begin : codeword_width
    if(!rst) begin 
      CODEWORD_WIDTH <= {AMBA_WORD{1'b0}};
    end else if(current_state == ACCES && PWRITE == 1 && PADDR[3:0] == 4'h8) begin
      CODEWORD_WIDTH <= PWDATA;
    end else begin
      CODEWORD_WIDTH <= CODEWORD_WIDTH;
    end
  end

  always_ff @( posedge clk or negedge rst) begin : noise
    if(!rst) begin
      NOISE <= {AMBA_WORD{1'b0}};
    end else if(current_state == ACCES && PWRITE == 1 && PADDR[3:0] == 4'hc) begin
      NOISE <= PWDATA;
    end else begin
      NOISE <= NOISE;
    end
  end


endmodule