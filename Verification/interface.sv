interface intf #(
    int       AMBA_WORD = 32,
    int       AMBA_ADDR_WIDTH = 20,
    int       DATA_WIDTH = 32) (clk,rst);
    

    input logic                       clk, rst;
    logic      [AMBA_ADDR_WIDTH-1:0]  PADDR;
    logic                             PENABLE;
    logic                             PSEL;
    logic      [AMBA_WORD-1:0]        PWDATA;
    logic                             PWRITE;
    logic      [AMBA_WORD-1:0]        PRDATA;
    logic      [DATA_WIDTH-1:0]       data_out;       
    logic                            operation_done;
    logic      [1:0]                  num_of_errors;

    modport DUT(input       clk,
                            rst,
                            PADDR,
                            PENABLE,
                            PSEL,
                            PWDATA,
                            PWRITE,
                output      PRDATA,
                            data_out,       
                            operation_done,
                            num_of_errors);

    modport MASTER(output   PADDR,
                            PENABLE,
                            PSEL,
                            PWDATA,
                            PWRITE,
                 input      clk,rst,
                   			PRDATA,
                            data_out,       
                            operation_done,
                            num_of_errors);

    modport MONITOR(input   clk,
                            rst,
                            PADDR,
                            PENABLE,
                            PSEL,
                            PWDATA,
                            PWRITE,
                            PRDATA,
                            data_out,       
                            operation_done,
                            num_of_errors);
endinterface