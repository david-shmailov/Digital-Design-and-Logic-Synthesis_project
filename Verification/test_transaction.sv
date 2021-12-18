class apb_trans;

  parameter       AMBA_WORD = 32;
  parameter       AMBA_ADDR_WIDTH = 20;
  parameter       DATA_WIDTH = 32; // codeword width max

  rand bit [1:0] noise_tri;
  rand bit [AMBA_WORD-1:0] ctrl;
  rand bit [AMBA_WORD-1:0] data_in;
  rand bit [AMBA_WORD-1:0] codeword_width;
  rand bit [AMBA_WORD-1:0] noise;

  constraint c_ctrl
  {
    ctrl >= 1;
    ctrl <= 1; 
  }

  constraint c_noise_tri 
  {
    noise_tri >= 0;
    noise_tri <= 2; 
  }
    
  constraint c_codewidth  //not sure to include DATA_WIDTH PARAMETER
  {
    codeword_width >= 0;
    codeword_width <= 2; 
  }
    
    
  constraint c_data_in
 {
    solve ctrl,codeword_width before data_in;
    data_in >= 0;
    if(ctrl == 1)
      if(codeword_width == 0)
        data_in < 2^8;
      else if(codeword_width == 1)
        data_in < 2^16;
      else 
        data_in < 2^32;
    else
      if(codeword_width == 0)
        data_in < 2^4;
      else if(codeword_width == 1)
        data_in < 2^11;
      else 
        data_in < 2^26;
 }

    constraint c_noise
    {
      solve noise_tri before noise;
      if(noise_tri == 0)
        $countones(noise) == 0;
      else if(noise_tri == 1)
		    $countones(noise) == 1;
	    else
        $countones(noise) == 2;
    }
    
endclass