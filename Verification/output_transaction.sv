class out_trans #(
  int       AMBA_WORD = 32,
  int       AMBA_ADDR_WIDTH = 20,
  int       DATA_WIDTH = 32);
   

   bit     [DATA_WIDTH-1:0]       data_out;      
   bit                            operation_done;
   bit     [1:0]                  num_of_errors;
   int test_number;

endclass
