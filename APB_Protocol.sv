module APB_Bus #(rst,clk,PSEL,PADDR,PENABLE,PWDATA,PWRITE,PRDATA,
data_out,operation_done,num_of_errors);

  input   wire  clk,rst;
  input   wire  PADDR;
  input   wire  PENABLE;
  input   wire  PSEL;
  input   wire  PWDATA;
  input   wire  PWRITE;

  output  reg   PRDATA;


  localparam  [1:0]     IDLE    = 2'b00;
  localparam  [1:0]     SETUP   = 2'b01;
  localparam  [1:0]     ACCESS  = 2'b10;
  
  state   <= IDLE;

  always @ (posedge clk)
    begin
      if (rst == 1)  
          state   <= IDLE;
      else
        begin
          case (state)
            IDLE: 
              begin 
                if (PSEL == 1)
                  state  <= SETUP;
                else 
                  state  <= IDLE;
              end
            
            SETUP: 
              begin 
                if (PSEL == 1)
                  state  <= ACCESS;
              end
                
            ACCESS: 
              begin
                if(PWRITE && PENABLE)
                  PWDATA = PADDR;
                else if (PENABLE)
                  PRDATA = PADDR;
                else

              end
                
            default: 
              state <= IDLE;

        endcase
      end
    end
 
endmodule