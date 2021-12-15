class in_trans;

   parameter       AMBA_WORD = 32;
   parameter       AMBA_ADDR_WIDTH = 20;
   parameter       DATA_WIDTH = 32;
   
   bit logic      [AMBA_ADDR_WIDTH-1:0]  PADDR;
   bit logic                             PENABLE;
   bit logic                             PSEL;
   bit logic      [AMBA_WORD-1:0]        PWDATA;
   bit logic                             PWRITE;
   bit logic      [AMBA_WORD-1:0]        PRDATA;


   function new();

   endfunction
      
endclass