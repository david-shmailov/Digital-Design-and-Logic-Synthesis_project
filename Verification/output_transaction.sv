class out_trans;
   parameter       AMBA_WORD = 32;
   parameter       AMBA_ADDR_WIDTH = 20;
   parameter       DATA_WIDTH = 32;
   

   bit     [DATA_WIDTH-1:0]       data_out;      
   bit                            operation_done;
   bit     [1:0]                  num_of_errors;


   function new();

   endfunction

endclass
