//`ifndef apb_trans

class apb_trans #(
  int       AMBA_WORD = 32,
  int       AMBA_ADDR_WIDTH = 20,
  int       DATA_WIDTH = 32); // codeword width max

  // parameter       AMBA_WORD = 32;
  // parameter       AMBA_ADDR_WIDTH = 20;
  // parameter       DATA_WIDTH = 32; // codeword width max

  localparam      MAX_CODEWORD_WIDTH = DATA_WIDTH; 
  localparam      MAX_PARITY_WIDTH = $clog2(MAX_CODEWORD_WIDTH)+1; 
  localparam      MAX_INFO_WIDTH = MAX_CODEWORD_WIDTH - MAX_PARITY_WIDTH;






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
    //ctrl == 0; //debug encode only
  }

  constraint c_noise_tri 
  {
    noise_tri >= 0;
    noise_tri <= 2; 
  }
    
  constraint c_codewidth  //not sure to include DATA_WIDTH PARAMETER
  {
    solve ctrl before codeword_width;
    if (DATA_WIDTH == 8) codeword_width == 0;
    if (DATA_WIDTH == 16) codeword_width inside{[0:1]};
    if (DATA_WIDTH == 32) codeword_width inside{[0:2]};
 
  }
    
  constraint c_paramteres
  {
    data_in inside{[0:2^MAX_INFO_WIDTH-1]}; //should allways be smaller then max info width
    noise   inside{[0:2^MAX_CODEWORD_WIDTH-1]};
  }

  constraint c_data_in
 {
    solve codeword_width before data_in;
    if(ctrl == 1 && codeword_width == 0)
        data_in inside{[0:2^8-1]};
    if(ctrl == 1 && codeword_width == 1)
        data_in inside{[0:2^16-1]};
    if(ctrl != 1 && codeword_width == 0)
        data_in inside{[0:2^4-1]};
    if(ctrl != 1 && codeword_width == 1)
        data_in inside{[0:2^11-1]};
    if(ctrl != 1 && codeword_width == 2)    
        data_in inside{[0:2^26-1]};

 }

    constraint c_noise_1
    {
      solve noise_tri,codeword_width before noise;
      if(codeword_width == 0)
        noise inside{[0:2^8-1]};

      if(codeword_width == 1)
        noise inside{[0:2^16-1]};
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
