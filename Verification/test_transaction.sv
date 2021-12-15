class rand_trans;
   parameter       AMBA_WORD = 32;
   parameter       AMBA_ADDR_WIDTH = 20;
   parameter       DATA_WIDTH = 32;
   

   rand bit [AMBA_WORD-1:0] ctrl;
   rand bit [AMBA_WORD-1:0] data_in;
   rand bit [AMBA_WORD-1:0] codeword_width;
   rand bit [AMBA_WORD-1:0] noise;
   
   constraint c_ctrl {
      ctrl >= 0;
      ctrl <= 2; 
   }
  
  constraint c_codewidth {
    	codeword_width >= 0;
    	codeword_width <= 0; 
  }
  constraint c_data_in{
    data_in>=0;
    data_in<=16;
  }

endclass
