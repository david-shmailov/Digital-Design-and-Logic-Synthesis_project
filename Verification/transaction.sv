class apb_trans;

  parameter       AMBA_WORD = 32;
  parameter       AMBA_ADDR_WIDTH = 20;
  parameter       DATA_WIDTH = 32; // codeword width max

  rand bit [1:0] noise_tri;
  rand bit [AMBA_WORD-1:0] ctrl;
  rand bit [AMBA_WORD-1:0] data_in;
  rand bit [AMBA_WORD-1:0] codeword_width;
  rand bit [AMBA_WORD-1:0] noise;
  int test_number;

  constraint c_ctrl
  {
    ctrl >= 0;
    ctrl <= 2; 
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
    if(ctrl == 1)
      if(codeword_width == 0)
        data_in inside{[0:256]};
    if(ctrl == 1)
      if(codeword_width == 1)
        data_in inside{[0:65536]};
    if(ctrl != 1)
      if(codeword_width == 0)
        data_in inside{[0:16]};
    if(ctrl != 1)
      if(codeword_width == 1)
        data_in inside{[0:2048]};
    if(ctrl != 1)    
      if(codeword_width == 2)
        data_in inside{[0:67108864]};
 }

    constraint c_noise_1
    {
      solve noise_tri,codeword_width before noise;
      if(codeword_width == 0)
        noise inside{[0:256]};

      if(codeword_width == 1)
        noise inside{[0:65536]};
    }
    constraint c_noise
    {
      solve noise_tri,codeword_width before noise;
      if(noise_tri == 0)
        $countones(noise) == 0;
      else if(noise_tri == 1)
		    $countones(noise) == 1;
	    else
        $countones(noise) == 2;
    }
    
endclass