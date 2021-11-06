        parameter       AMBA_WORD = 32;
        parameter       AMBA_ADDR_WIDTH = 20;
        parameter       DATA_WIDTH = 32;) 

        wire    [AMBA_ADDR_WIDTH-1:0]   PADDR;
        wire                            PENABLE;
        wire                            PSEL;
        wire    [AMBA_WORD-1:0]         PWDATA;
        wire                            PWRITE;
        wire                            clk;
        wire                            rst;
        reg     [AMBA_WORD-1:0]         PRDATA;
        reg     [DATA_WIDTH-1:0]        data_out;       //TBD in the PDF it says [DATA_WIDTH:0], typo?
        reg                             operation_done;
        reg     [1:0]                   num_of_errors;      

module APB_Bus #(rst,clk,PSEL,PADDR,PENABLE,PWDATA,PWRITE,PRDATA,
data_out,operation_done,num_of_errors);

    input   clk,rst;
    input   PSEL;
    input   PWRITE;
    input   PENABLE 

    output  reg ;
    output  reg data_out;

    reg CTRL;
    reg DATA_IN;
    reg CODEWORD_WIDTH;
    reg NOISE;

    localparam  [1:0]       IDLE    = 2'b00,
                            SETUP   = 2'b01,
                            ACCESS  = 2'b10,

  always @(posedge clk)
    begin
      if (rst == 0) 
        begin 
          state    <= IDLE;
          PRDATA <= 8'b0;
          data_out <= 32'b0;
          PSEL     <= 0;
          PENABLE       <= 0;  
        end
    else
      begin
        case (state)
          IDLE: begin 
            data_out   <= 32'b0;
            PSEL   <= 2'b0;
            PENABLE         <= 0;
            PRDATA     <= 0;
            if (PSEL == 1) begin
              state  <= SETUP;
              end
              else begin
                state <= IDLE;
              end
            end
            
            SETUP: begin           
              PSEL      <= 1;
              PENABLE   <= 1;
              if (PSEL == 1) begin
                 state  <= ACCESS;
                end
                  else begin
                  state <= SETUP;
                end
              end
                
            ACCESS: begin
              if (ready == 1)
                begin
                  wr_out <= wr_in;
                  addr_out <= addr_in;
                  data_out <= data_in;
                  state <= WAIT;
                end
                  else begin
                  state <= ACCESS;
                end
              end
                
              default: begin
                state <= IDLE;
              end
            endcase
          end
        end
 
  
endmodule