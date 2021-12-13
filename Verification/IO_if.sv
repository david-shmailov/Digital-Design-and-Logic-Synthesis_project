interface io_if;

    parameter   DATA_WIDTH = 32;
    logic     [DATA_WIDTH-1:0]       data_out;       
    logic                            operation_done;
    logic     [1:0]                  num_of_errors;

    modport DUT(
        output      data_out,       
                    operation_done,
                    num_of_errors
    );

    modport MONITOR(
        input       data_out,       
                    operation_done,
                    num_of_errors
    );


endinterface //io_if