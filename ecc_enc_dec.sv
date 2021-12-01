module ECC_ENC_DEC //top
                (
                        rst,
                        clk, 
                        data_out,
                        operation_done,
                        num_of_errors,
                //APB protocol
                        PWDATA,
                        PADDR,
                        PENABLE,
                        PSEL,
                        PWRITE,
                        PRDATA);

        parameter       AMBA_WORD = 32;
        parameter       AMBA_ADDR_WIDTH = 20;
        parameter       DATA_WIDTH = 32; 


        localparam      MAX_CODEWORD_WIDTH = DATA_WIDTH;
        localparam      MAX_PARITY_WIDTH = $clog2(MAX_CODEWORD_WIDTH)+1;
        localparam      MAX_INFO_WIDTH = MAX_CODEWORD_WIDTH - MAX_PARITY_WIDTH;
        // APB protocol
        input logic      [AMBA_ADDR_WIDTH-1:0]  PADDR;
        input logic                             PENABLE;
        input logic                             PSEL;
        input logic      [AMBA_WORD-1:0]        PWDATA;
        input logic                             PWRITE;
        output logic     [AMBA_WORD-1:0]        PRDATA;

        // IO 
        input logic                            clk;
        input logic                            rst;
        output logic     [DATA_WIDTH-1:0]       data_out;       //TBD in the PDF it says [DATA_WIDTH:0], typo?
        output logic                            operation_done;
        output logic     [1:0]                  num_of_errors;


        // signals

        logic                            start; 
        logic     [DATA_WIDTH-1:0]       data_out_enc;
        logic     [DATA_WIDTH-1:0]       data_out_dec;    
        logic     [DATA_WIDTH-1:0]       data_in_noised;


        // register bank
        logic     [AMBA_WORD - 1:0]      CTRL;
        logic     [AMBA_WORD - 1:0]      DATA_IN;
        logic     [AMBA_WORD - 1:0]      CODEWORD_WIDTH; 
        logic     [AMBA_WORD - 1:0]      NOISE;          
        logic     [DATA_WIDTH - 1:0]     DATA_IN_DEC;

        logic     [DATA_WIDTH-1:0]       DATA_IN_CUT;

        assign    DATA_IN_CUT = DATA_IN[DATA_WIDTH-1 :0];

        APB_BUS  #(

                 //defparam       
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
        ) register_bank
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
      

        ENC #(//defparam
                .MAX_CODEWORD_WIDTH(MAX_CODEWORD_WIDTH),
                .MAX_INFO_WIDTH(MAX_INFO_WIDTH)
        ) encoder (
        //input                       
        .rst(rst),
        .clk(clk),
        .data_in(DATA_IN_CUT),
        .mod(CODEWORD_WIDTH[1:0]), 
        //output
        .data_out(data_out_enc));




        DEC #(//defparam
                .MAX_CODEWORD_WIDTH(MAX_CODEWORD_WIDTH),
                .MAX_INFO_WIDTH(MAX_INFO_WIDTH)
        ) decoder(
                //input   
                .rst(rst),
                .clk(clk),
                .data_in(DATA_IN_DEC),
                .mod(CODEWORD_WIDTH[1:0]), 
                //output  
                .data_out(data_out_dec),
                .num_of_errors(num_of_errors) // what happens when in encoding only mode?
        );

        assign data_in_noised = data_out_enc ^ NOISE ;

        always_comb begin : top_output
                case (CTRL[1:0])
                        2'b00 : data_out <= data_out_enc;   //  Only Encoder
                        2'b01 : data_out <= data_out_dec;   //  Full-channel/Decoder
                        2'b10 : data_out <= data_out_dec;   //  Full-channel/Decoder
                        default : data_out <= data_out_enc;
                endcase
        end

        always_comb begin : decoder_input
                case(CTRL[1:0]) 
                        2'b01 : DATA_IN_DEC <= DATA_IN_CUT;
                        2'b10 : DATA_IN_DEC <= data_in_noised;    
                        default : DATA_IN_DEC <= 0;
                endcase
        end


endmodule
