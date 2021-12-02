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
        input  logic                             clk;
        input  logic                             rst;
        output logic     [DATA_WIDTH-1:0]       data_out;       //TBD in the PDF it says [DATA_WIDTH:0], typo?
        output logic                            operation_done;
        output logic     [1:0]                  num_of_errors;



        // signals
        logic                            online;
        logic                            start; 
        logic     [DATA_WIDTH-1:0]       data_out_enc;
        logic     [DATA_WIDTH-1:0]       data_out_dec;    
        logic     [DATA_WIDTH-1:0]       data_in_noised;
        logic     [3:0]                  counter;

        // register bank
        logic     [AMBA_WORD - 1:0]      CTRL;
        logic     [AMBA_WORD - 1:0]      DATA_IN;
        logic     [AMBA_WORD - 1:0]      CODEWORD_WIDTH; 
        logic     [AMBA_WORD - 1:0]      NOISE;          
        logic     [DATA_WIDTH - 1:0]     DATA_IN_DEC;

        logic     [DATA_WIDTH-1:0]       DATA_IN_CUT;  


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
        .work_mod(CODEWORD_WIDTH[1:0]), 
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
                .work_mod(CODEWORD_WIDTH[1:0]), 
                //output  
                .data_out(data_out_dec),
                .num_of_errors(num_of_errors) // what happens when in encoding only mode?
        );
        

        assign  DATA_IN_CUT = DATA_IN[DATA_WIDTH-1 :0];
        assign  data_in_noised = data_out_enc ^ NOISE ;

        always_comb begin : top_output
                case (CTRL)
                        {{AMBA_WORD-2{1'b0}},2'b0} : data_out = data_out_enc;   //  Only Encoder
                        {{AMBA_WORD-2{1'b0}},2'b1} : data_out = data_out_dec;   //  Full-channel/Decoder
                        {{AMBA_WORD-2{1'b0}},2'b10} : data_out = data_out_dec;   //  Full-channel/Decoder
                        default : data_out = data_out_enc;
                endcase
        end

        always_comb begin : decoder_input
                case(CTRL[1:0]) 
                        2'b01 :   DATA_IN_DEC = DATA_IN_CUT;
                        2'b10 :   DATA_IN_DEC = data_in_noised;    
                        default : DATA_IN_DEC = 0;
                endcase
        end

        always_ff @(posedge clk or negedge rst) begin : Start_FSM
                if(!rst)
                        online <= 1'b0;
                else if(start)
                        online <= 1'b1;
                else if (operation_done == 1)
                        online <= 1'b0;
                else
                        online <= online;

        end
        always_ff @( posedge clk or negedge rst ) begin : CLk_incremnet 
                if(!rst) begin
                        operation_done <= 1'b0;
                        counter <= 4'b1;
                end
                else if(operation_done == 1'b1 && !(counter == 4'b1111)) begin
                        operation_done <= 1'b0;
                        counter <= 4'b1;
                end
                else if (counter == 4'b1 || counter == 4'b10) begin
                        counter <= counter << 1;
                        operation_done <= 1'b0;
                end
                else if (counter == 4'b100 && (CTRL[1:0] == 2'b0 || CTRL[1:0] == 2'b1)) begin
                        operation_done <= 1'b1;
                        counter <= 4'b1;
                end
                else if (counter == 4'b100 || counter == 4'b1000) begin
                        counter <= counter << 1;
                        operation_done <= 1'b0;
                end
                else if (counter == 4'b0 && CTRL[1:0] == 2'b10) begin
                        operation_done <= 1'b1;
                        counter <= 4'b1;
                end
                else begin
                        counter <= 4'b1;
                        operation_done <= 1'b0;
                end
        end

endmodule
