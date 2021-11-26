module ECC_ENC_DEC //top
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
                
             
        logic    [AMBA_ADDR_WIDTH-1:0]   PADDR;
        logic                            PENABLE;
        logic                            PSEL;
        logic    [AMBA_WORD-1:0]         PWDATA;
        logic                            PWRITE;
        logic                            clk;
        logic                            rst;
        logic     [AMBA_WORD-1:0]        PRDATA;
        logic     [DATA_WIDTH-1:0]       data_out;       //TBD in the PDF it says [DATA_WIDTH:0], typo?
        logic                            operation_done;
        logic     [1:0]                  num_of_errors;
        logic     [1:0]                  CTRL_op;
        logic                            start = 1'b0;
         



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

                //outputs
                .start(start),
                .CTRL_op(CTRL_op),
                .PRDATA(PRDATA));

        
        always_ff @( posedge clk ) begin : CTRL_REG   
                if (rst) CTRL_op <= 2'b0;
                else CTRL_op <= PADDR[0x00];
        end

        ENC encoder (
        //input                       
        .rst(rst),
        .clk(clk),
        .data_in(data_in),
        .mod(mod),
        //output
        .data_out(data_out));


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

        always @ (*) begin
                case (CTRL_op)
                        0: begin //Encode
                                 
                        end
                        1: begin //Decode
                                  
                        end                        
                        2: begin //Full channel
                                 
                        end                        

                        default: //Encode on defalut
                endcase
        end

endmodule
