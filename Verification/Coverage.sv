class Functional_Coverage;

   parameter       AMBA_WORD = 32;
   parameter       AMBA_ADDR_WIDTH = 20;
   parameter       DATA_WIDTH = 32;

    virtual intf.MONITOR inter;

    //test for inputs and outputs of the DUT
    covergroup inDUT () @(posedge inter.clk && inter.PEANBLE);

        cover4ctrl : coverpoint inter.PWDATA iff(!inter.rst && (inter.PADDR == 0)) ;{

            bins encoder_mode = {0};
            bins decoder_mode = {1};
            bins full_channel = {2};
        }

        cover4data_in : coverpoint inter.PWDATA iff(!inter.rst && (inter.PADDR == 'h4)) ;{

        }

        cover4codeword_width : coverpoint inter.PWDATA iff(!inter.rst && (inter.PADDR == 'h8)) ;{

            bins 8bit = {0};
            bins 16bit = {1};
            bins 32bit = {2};
        }

        cover4noise : coverpoint inter.PWDATA iff(!inter.rst && (inter.PADDR == 'hc)) ;{

        }        
        
    endgroup

    
    covergroup outDUT () @(posedge inter.operation_done);


    endgroup
    
    
    
    
    function new(virtual intf.MONITOR inter);

        inDUT = new;
        outDUT = new;
        this.inter = inter;


    endfunction //new() func

endclass //className