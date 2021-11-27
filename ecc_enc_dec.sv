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
        logic                            start = 1'b0;
        logic     [DATA_WIDTH-1:0]       data_out_enc;
        logic     [DATA_WIDTH-1:0]       data_out_dec;    
        logic     [DATA_WIDTH-1:0]       data_in_noised;
        logic     [AMBA_WORD - 1:0]      PRDATA;
        logic     [AMBA_WORD - 1:0]      CTRL;
        logic     [AMBA_WORD - 1:0]      DATA_IN;
        logic     [AMBA_WORD - 1:0]      CODEWORD_WIDTH; 
        logic     [AMBA_WORD - 1:0]      NOISE;          
        logic     [AMBA_WORD - 1:0]      DATA_IN_DEC;



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
                .NOISE(NOISE),
                .CTRL(CTRL),
                .CODEWORD_WIDTH(CODEWORD_WIDTH),
                .DATA_IN(DATA_IN),
                .PRDATA(PRDATA));
        end

        ENC encoder (
        //input                       
        .rst(rst),
        .clk(clk),
        .data_in(DATA_IN),
        .mod(size(CODEWORD_WIDTH)), //67% it wont work :/
        //output
        .data_out(data_out_enc));


        DEC decoder(
        //defparam
        .MAX_CODEWORD_WIDTH(MAX_CODEWORD_WIDTH),
        .MAX_INFO_WIDTH(MAX_INFO_WIDTH),
        //input   
        .rst(rst),
        .clk(clk),
        .data_in(DATA_IN_DEC),
        .mod(size(CODEWORD_WIDTH)), //67% it wont work :/
        //output  
        .data_out(data_out_dec),
        .num_of_errors(num_of_errors));

        data_in_noised = data_out_enc ^ NOISE ;

        always_comb begin : OPcode
                case(CTRL)
                        2'b00 : data_out <= data_out_enc;   //  Only Encoder
                        2'b01 : data_out <= data_out_dec;   //  Full-channel/Decoder
                        2'b10 : data_out <= data_out_dec;   //  Full-channel/Decoder
                        defualt : data_out <= data_out_enc;
        end

        always_comb begin : Full-channel_or_decoder_Mode
                case(CTRL) 
                        2'b01 : DATA_IN_DEC <= DATA_IN;
                        2'b10 : DATA_IN_DEC <= data_in_noised;    
                        defualt : data_out <= data_out_enc;
        end


endmodule
