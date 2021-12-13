interface apb_if;
    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;

    logic      [AMBA_ADDR_WIDTH-1:0]  PADDR;
    logic                             PENABLE;
    logic                             PSEL;
    logic      [AMBA_WORD-1:0]        PWDATA;
    logic                             PWRITE;
    logic      [AMBA_WORD-1:0]        PRDATA;
     parameter   DATA_WIDTH = 32;
    logic                            clk;
    logic                            rst;
    logic     [DATA_WIDTH-1:0]       data_out;       
    logic                            operation_done;
    logic     [1:0]                  num_of_errors;

    modport DUT(input       PADDR,
                            PENABLE,
                            PSEL,
                            PWDATA,
                            PWRITE,
                output      PRDATA,
                input         clk,
                      rst,
        output      data_out,       
                    operation_done,
                    num_of_errors);

    modport MASTER(output   PADDR,
                            PENABLE,
                            PSEL,
                            PWDATA,
                            PWRITE,
                    input   PRDATA);

    modport MONITOR(input   PADDR,
                            PENABLE,
                            PSEL,
                            PWDATA,
                            PWRITE,
                            PRDATA);
endinterface