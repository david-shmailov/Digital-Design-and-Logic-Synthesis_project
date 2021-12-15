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

        localparam  ENCODER_ONLY = {{AMBA_WORD-2{1'b0}}, 2'b00}; //Encoder Only
        localparam  DECODER_ONLY = {{AMBA_WORD-2{1'b0}}, 2'b01}; //Decoder Only
        localparam  FULL_CHANNEL = {{AMBA_WORD-2{1'b0}}, 2'b10}; //Full Channel

        localparam  ENC_DEC_DELAY = 0;
        localparam  FULL_CHAN_DELAY = 1;
        
        // for given parameters, those are the MAX various widths in all operating codeword widths modes.
        localparam      MAX_CODEWORD_WIDTH = DATA_WIDTH; 
        localparam      MAX_PARITY_WIDTH = $clog2(MAX_CODEWORD_WIDTH)+1; 
        localparam      MAX_INFO_WIDTH = MAX_CODEWORD_WIDTH - MAX_PARITY_WIDTH;

        // APB protocol I/O
        input logic      [AMBA_ADDR_WIDTH-1:0]  PADDR;
        input logic                             PENABLE;
        input logic                             PSEL;
        input logic      [AMBA_WORD-1:0]        PWDATA;
        input logic                             PWRITE;
        output logic     [AMBA_WORD-1:0]        PRDATA;

        // I/O 
        input  logic                             clk;
        input  logic                             rst;
        output logic     [DATA_WIDTH-1:0]       data_out;
        output logic                            operation_done;
        output logic     [1:0]                  num_of_errors;



        // signals
        logic                            online;
        logic                            start; 
        logic                            counter;

        logic     [DATA_WIDTH-1:0]       data_out_enc;
        logic     [DATA_WIDTH-1:0]       data_out_dec;    
        logic     [DATA_WIDTH-1:0]       data_with_noise;

        // register bank connections
        logic     [AMBA_WORD - 1:0]      CTRL;
        logic     [AMBA_WORD - 1:0]      DATA_IN;
        logic     [AMBA_WORD - 1:0]      CODEWORD_WIDTH; 
        logic     [AMBA_WORD - 1:0]      NOISE;          
        logic     [DATA_WIDTH - 1:0]     DATA_IN_DEC;
  


        APB_BUS  #(
                 //defparam       
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
        ) register_bank(          
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
                .PRDATA(PRDATA)
        );
      

        ENC #(//defparam
                .MAX_CODEWORD_WIDTH(MAX_CODEWORD_WIDTH),
                .MAX_INFO_WIDTH(MAX_INFO_WIDTH),
                .AMBA_WORD(AMBA_WORD)
        ) encoder (
                //input                       
                .rst(rst),
                .clk(clk),
                .data_in(DATA_IN[MAX_INFO_WIDTH-1:0]),
                .work_mod(CODEWORD_WIDTH), 
                //output
                .data_out(data_out_enc)
        );




        DEC #(//defparam
                .MAX_CODEWORD_WIDTH(MAX_CODEWORD_WIDTH),
                .MAX_INFO_WIDTH(MAX_INFO_WIDTH),
                .AMBA_WORD(AMBA_WORD)
        ) decoder(
                //input   
                .rst(rst),
                .clk(clk),
                .data_in(DATA_IN_DEC),
                .work_mod(CODEWORD_WIDTH), 
                //output  
                .data_out(data_out_dec),
                .num_of_errors(num_of_errors) 
        );
        
        // adding noise to the data in Full channel mode.
        assign  data_with_noise = data_out_enc ^ NOISE ;


        // a mux that determines the output of the design according to the mode.
        always_comb begin : output_mux
                case (CTRL)
                        ENCODER_ONLY : data_out = data_out_enc;   //  Only Encoder
                        DECODER_ONLY : data_out = data_out_dec;   //  Full-channel/Decoder
                        FULL_CHANNEL : data_out = data_out_dec;   //  Full-channel/Decoder
                        default : data_out = data_out_enc;
                endcase
        end
        // a mux that determines the input of a decoder according to the mode.
        always_comb begin : decoder_input_mux
                case(CTRL) 
                        DECODER_ONLY  :   DATA_IN_DEC = DATA_IN[DATA_WIDTH-1:0];
                        FULL_CHANNEL  :   DATA_IN_DEC = data_with_noise;    
                        default : DATA_IN_DEC = 0;
                endcase
        end
        // this register purpose is to switch to working status, because the start signal from APB is lowered after 1 cycle.
        always_ff @(posedge clk or negedge rst) begin : status_reg
                if (!rst)
                        online <= 1'b0;
                else if (start)
                        online <= 1'b1;
                else if (operation_done == 1)
                        online <= 1'b0;
                else
                        online <= online;

        end
        //this is a delay counter that raises operation_done signal according to the operating mode.
        always_ff @( posedge clk or negedge rst ) begin : delay_counter 
                if(!rst) begin
                        operation_done <= 1'b0;
                        counter <= 0;
                end
                else if(online && operation_done ) begin // online is here only to prevent checker warning this is reset
                        operation_done <= 1'b0;         // lowers operation done after 1 cycle
                        counter <= 0;                   // counter resets to 0.
                end
                else if (online && counter == ENC_DEC_DELAY && (CTRL == ENCODER_ONLY || CTRL == DECODER_ONLY) ) begin
                        operation_done <= 1'b1;
                end
                else if (online && counter == FULL_CHAN_DELAY && CTRL == FULL_CHANNEL ) begin
                        operation_done <= 1'b1;
                end
                else if (online) begin
                        counter <= counter + 1;
                end else begin
                        counter <= 0;
                        operation_done <= 1'b0;
                end
        end

endmodule
