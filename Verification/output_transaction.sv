class out_trans;
   parameter       AMBA_WORD = 32;
   parameter       AMBA_ADDR_WIDTH = 20;
   parameter       DATA_WIDTH = 32;
   

   bit     [DATA_WIDTH-1:0]       data_out;      
   bit                            operation_done;
   bit     [1:0]                  num_of_errors;


   function void record_output(virtual intf.MONITOR inter);
      this.data_out = inter.data_out;
      this.operation_done = inter.operation_done;
      this.num_of_errors = inter.num_of_errors;
   endfunction


endclass
