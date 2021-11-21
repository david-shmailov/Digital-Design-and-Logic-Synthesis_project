module ECC_ENC_DEC (
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
                
        parameter       AMBA_WORD = 32;
        parameter       AMBA_ADDR_WIDTH = 20;
        parameter       DATA_WIDTH = 32;
        
        APB_Bus register_bank (

        );
      

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
         

endmodule
