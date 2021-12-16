class apb_trans;

  parameter       AMBA_WORD = 32;
  parameter       AMBA_ADDR_WIDTH = 20;
  parameter       DATA_WIDTH = 32; // codeword width max
    

  rand bit [AMBA_WORD-1:0] ctrl;
  rand bit [AMBA_WORD-1:0] data_in;
  rand bit [AMBA_WORD-1:0] codeword_width;
  rand bit [AMBA_WORD-1:0] noise;
  rand bit [AMBA_WORD-1:0] noise_tri;
    
  constraint c_ctrl
  {
    ctrl >= 0;
    ctrl <= 2; 
  }
    
  constraint c_codewidth  //not sure to include DATA_WIDTH PARAMETER
  {
    codeword_width >= 0;
    codeword_width <= 2; 
  }
  constraint c_data_in
  {
    data_in >= 0;
    if(ctrl == 1) begin
      case (codeword_width):

        0: data_in <= 256;
              
        1: data_in <= 65,536;

        2: data_in <= 4,294,967,296;
          
        default: data_in <= 256;
      endcase
    end 
    else begin
      case (codeword_width):

        0: data_in <= 16;
              
        1: data_in <= 2,048;

        2: data_in <= 67,108,864;
          
        default: data_in <= 16;
      endcase
    end
  }

 constraint c_noise_tri 
 {
    noise_tri >= 0;
    noise_tri <= 2; 
 }


  constraint c_noise
  {
    case (noise_tri): 
      0: noise = 0;

      1: $countones(noise) == 1;

      2: $countones(noise) == 2;

      default: noise = 0
    endcase
  }

endclass
