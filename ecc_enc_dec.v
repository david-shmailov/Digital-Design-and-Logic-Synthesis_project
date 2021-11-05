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
                output  PRDATA
                );
        parameter       AMBA_WORD = 32,
                        AMBA_ADDR_WIDTH = 20,
                        DATA_WIDTH = 32;


        parameter       [7:0][3:0]    H_MATRIX_1 = 32'hffe4_d2b1;
        parameter       [15:0][4:0]   H_MATRIX_2 = 80'hffff_fe08_f1c4_cda2_ab61;
        parameter       [31:0][5:0]   H_MATRIX_3 = 192'hffff_ffff_fffe_0010_ff01_fc08_f0f1_e384_cccd_9b42_aaab_56c1;




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

        wire    [7:0][3:0]    H_matrix_1 = H_MATRIX_1;  //TBD this may not work
        wire    [15:0][4:0]   H_matrix_2 = H_MATRIX_2;
        wire    [31:0][5:0]   H_matrix_3 = H_MATRIX_3;



endmodule