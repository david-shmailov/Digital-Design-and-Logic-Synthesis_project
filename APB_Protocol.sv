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

always @(PSEL) 

    begin

        IDLE = ~((a & b) | (c & d));

    end