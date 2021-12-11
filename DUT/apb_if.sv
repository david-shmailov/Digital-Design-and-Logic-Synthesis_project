interface apb_if 
    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;

    logic      [AMBA_ADDR_WIDTH-1:0]  PADDR;
    logic                             PENABLE;
    logic                             PSEL;
    logic      [AMBA_WORD-1:0]        PWDATA;
    logic                             PWRITE;
    logic      [AMBA_WORD-1:0]        PRDATA;

    modport DUT(input       PADDR,
                            PENABLE,
                            PSEL,
                            PWDATA,
                            PWRITE,
                output      PRDATA);

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