class apb_trans;

  parameter       AMBA_WORD = 32;
  parameter       AMBA_ADDR_WIDTH = 20;
  parameter       DATA_WIDTH = 32; // codeword width max
    

  rand bit [AMBA_WORD-1:0] ctrl;
  rand bit [AMBA_WORD-1:0] data_in;
  rand bit [AMBA_WORD-1:0] codeword_width;
  rand bit [AMBA_WORD-1:0] noise;
    
  constraint c_ctrl
  {
    ctrl >= 0;
    ctrl <= 2; 
  }
    
  constraint c_codewidth
  {
    
  }
  constraint c_data_in
  {
      
  }

  constraint c_noise
  {
    
  }

endclass
