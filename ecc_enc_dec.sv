module ECC_ENC_DEC 
                (
                parameter       AMBA_WORD = 32;
                parameter       AMBA_ADDR_WIDTH = 20;
                parameter       DATA_WIDTH = 32; 
                )
                (
                input   rst,
                        clk, 
                output  data_out,
                        operation_done,
                        num_of_errors,
                //APB protocol
                input   PWDATA,
                        PADDR,
                        PENABLE,
                        PSEL,
                        PWRITE,
                output  PRDATA);
                
             
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
         



        APB_BUS  #(

                 //defparam       
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH),
        )register_bank
        (
                //inputs
                .rst(rst),
                .clk(clk),
                .PSEL(PSEL),
                .PADDR(PADDR),
                .PENABLE(PENABLE),
                .PWDATA(PWDATA),
                .PWRITE(PWRITE),
                .direct_write(direct_write),

                //outputs
                .PRDATA(PRDATA),
                .direct_read(direct_read));

        
        always_ff @( posedge clk ) begin : CTRL_REG   
                if (rst) opcode <= 2'b0;
                else opcode <= [1:0]PADDR;
        end

        always @ (*) begin
                case (opcode)
                        0 : begin //encoder mode
                                ENC encoder (
                                //input                       
                                .rst(rst),
                                .clk(clk),
                                .data_in(data_in),
                                .mod(mod),
                                //output
                                .data_out(data_out));

                        end
                        1 : begin //decoder mode
                                DEC decoder(
                                //defparam
                                .MAX_CODEWORD_WIDTH(MAX_CODEWORD_WIDTH),
                                .MAX_INFO_WIDTH(MAX_INFO_WIDTH),
                                //input   
                                .rst(rst),
                                .clk(clk),
                                .data_in(data_in),
                                .mod(mod),
                                //output  
                                .data_out(data_out),
                                .num_of_errors(num_of_errors));
                        end
                        2 : begin //full channel mode
                        
                        end

                        default: opcode = 0;
                endcase
        end

endmodule
