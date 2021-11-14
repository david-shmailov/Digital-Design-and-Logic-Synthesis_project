module ECC_ENC_DEC 
        #(
        parameter       AMBA_WORD = 32;
        parameter       AMBA_ADDR_WIDTH = 20;
        parameter       DATA_WIDTH = 32;) 
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

        parameter       [3:0][7:0]    H_MATRIX_1 = 32'hffe4_d2b1;
        parameter       [4:0][15:0]   H_MATRIX_2 = 80'hffff_fe08_f1c4_cda2_ab61;
        parameter       [5:0][31:0]   H_MATRIX_3 = 192'hffff_ffff_fffe_0010_ff01_fc08_f0f1_e384_cccd_9b42_aaab_56c1;




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

        wire    [3:0][7:0]    H_matrix_1 = H_MATRIX_1;  //TBD this may not work
        wire    [4:0][15:0]   H_matrix_2 = H_MATRIX_2;
        wire    [5:0][31:0]   H_matrix_3 = H_MATRIX_3;

endmodule
