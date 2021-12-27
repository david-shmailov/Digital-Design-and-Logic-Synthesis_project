

// this is a input transaction packet. it wraps all the APB inputs to the DUT into one object
class apb_trans #(
  int       AMBA_WORD = 32,
  int       AMBA_ADDR_WIDTH = 20,
  int       DATA_WIDTH = 32); // codeword width max

  localparam      MAX_CODEWORD_WIDTH = DATA_WIDTH; 
  localparam      MAX_PARITY_WIDTH = $clog2(MAX_CODEWORD_WIDTH)+1; 
  localparam      MAX_INFO_WIDTH = MAX_CODEWORD_WIDTH - MAX_PARITY_WIDTH;

  localparam  encode = 0;
  localparam  decode = 1;
  localparam  full_channel = 2;

  localparam  mod0 = 0;
  localparam  mod1 = 1;
  localparam  mod2 = 2;




  rand bit [1:0] noise_tri;
  rand bit [AMBA_WORD-1:0] ctrl;

  rand int unsigned data_in; // data_in was changed to int unsigned to overcome casting issues to bit array
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
    
  constraint c_codewidth  
  {
    solve ctrl before codeword_width;
    if (DATA_WIDTH == 8) codeword_width == 0;
    if (DATA_WIDTH == 16) codeword_width inside{[0:1]};
    if (DATA_WIDTH == 32) codeword_width inside{[0:2]};

 
  }
    



  constraint c_data_in
 {
    solve codeword_width before data_in;
    if(ctrl == decode && codeword_width == mod0)
        data_in < 256; //2^8;

    if(ctrl == decode && codeword_width == mod1)
        data_in < 65536; //2^16;

    if(ctrl != decode && codeword_width == mod0)
        data_in < 16; //2^4;

    if(ctrl != decode && codeword_width == mod1)
        data_in < 2048; //2^11;

    if(ctrl != decode && codeword_width == mod2)    
        data_in < 67108864; //2^26;
 }

    constraint c_noise_1
    {
      solve noise_tri,codeword_width before noise;
      if(codeword_width == mod0)
        noise inside{[0:2^8-1]};

      if(codeword_width == mod1)
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
