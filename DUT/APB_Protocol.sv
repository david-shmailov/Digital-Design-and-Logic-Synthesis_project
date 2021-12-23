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

  //Parameters configration 
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

  //localparam configration
  localparam  CTRL_ADDR           = {{AMBA_ADDR_WIDTH-4{1'b0}},4'h0};
  localparam  DATA_IN_ADDR        = {{AMBA_ADDR_WIDTH-4{1'b0}},4'h4};
  localparam  CODEWORD_WIDTH_ADDR = {{AMBA_ADDR_WIDTH-4{1'b0}},4'h8};
  localparam  NOISE_ADDR          = {{AMBA_ADDR_WIDTH-4{1'b0}},4'hC};

  //state declaration
  localparam  [1:0]     IDLE    = 1'b0;
  localparam  [1:0]     ACS   = 1'b1;

  //state declaration of present and next 
  logic current_state,next_state;

// APB-Slave FSM
  always @ (posedge clk or negedge rst) begin : state_assign
    if(!rst) current_state <= IDLE;
    else
      current_state <= next_state;
  end

  always_comb begin : APB_FSM
    case(current_state)     
      IDLE: begin
        if (PSEL)
          next_state = ACS;
        else
          next_state = IDLE;
      end
      ACS: begin
          if (PSEL)
            next_state = ACS;
          else
            next_state = IDLE;
      end
      default: 
        next_state = IDLE;
    endcase
  end

// read from memory
  // always_ff @( posedge clk or negedge rst) begin : read
  //   if(!rst) begin
  //     PRDATA <= {AMBA_WORD{1'b0}};
  //   end else if (current_state == ACS && PENABLE && !PWRITE ) begin
  //     case (PADDR)
  //       CTRL_ADDR            :   PRDATA <= CTRL;
  //       DATA_IN_ADDR         :   PRDATA <= DATA_IN;
  //       CODEWORD_WIDTH_ADDR  :   PRDATA <= CODEWORD_WIDTH;
  //       NOISE_ADDR           :   PRDATA <= NOISE;
  //       default              :   PRDATA <= 0;
  //     endcase
  //   end else begin
  //     PRDATA <= PRDATA;
  //   end
  // end
  always_comb begin : read
    if (current_state == ACS && PENABLE && !PWRITE ) begin
      case (PADDR)
        CTRL_ADDR            :   PRDATA = CTRL;
        DATA_IN_ADDR         :   PRDATA = DATA_IN;
        CODEWORD_WIDTH_ADDR  :   PRDATA = CODEWORD_WIDTH;
        NOISE_ADDR           :   PRDATA = NOISE;
        default              :   PRDATA = 0;
      endcase
    end else PRDATA = 0;
  end

// writing to memory:

  //CTRL Reg
  always_ff @( posedge clk or negedge rst) begin : ctrl_register
    if(!rst) begin
      CTRL <= {AMBA_WORD{1'b0}};
      start <= 1'b0;
    end else if(current_state == ACS && PWRITE && PENABLE  && PADDR[3:0] == 4'h0) begin
      CTRL <= PWDATA;
      start <= 1'b1;
    end else if (start) begin
      start <= 1'b0; // lower start after one clk cycle
    end else begin
      CTRL <= CTRL;
    end
  end
  


  //DATA_IN register
  always_ff @( posedge clk or negedge rst) begin : data_in_register
    if(!rst) begin
      DATA_IN <= {AMBA_WORD{1'b0}};
    end else if(current_state == ACS && PWRITE && PENABLE && PADDR[3:0] == 4'h4) begin
      DATA_IN <= PWDATA;
    end else begin
      DATA_IN <= DATA_IN;
    end
  end

  //CODEWORD_WIDTH register
  always_ff @( posedge clk or negedge rst) begin : codeword_width_register
    if(!rst) begin 
      CODEWORD_WIDTH <= {AMBA_WORD{1'b0}};
    end else if(current_state == ACS && PWRITE && PENABLE && PADDR[3:0] == 4'h8) begin
      CODEWORD_WIDTH <= PWDATA;
    end else begin
      CODEWORD_WIDTH <= CODEWORD_WIDTH;
    end
  end

  //NOISE Reg register
  always_ff @( posedge clk or negedge rst) begin : noise_register
    if(!rst) begin
      NOISE <= {AMBA_WORD{1'b0}};
    end else if(current_state == ACS && PWRITE && PENABLE && PADDR[3:0] == 4'hc) begin
      NOISE <= PWDATA;
    end else begin
      NOISE <= NOISE;
    end
  end


endmodule