class coverage;

   parameter       AMBA_WORD = 32;
   parameter       AMBA_ADDR_WIDTH = 20;
   parameter       DATA_WIDTH = 32;



    virtual intf.MONITOR inter;

    //test for inputs and outputs of the DUT
    covergroup inDUT () @(posedge inter.clk && inter.PEANBLE && negedge inter.rst);

        cover4ctrl : coverpoint inter.PWDATA iff(inter.PADDR == 0) ;{

            bins encoder_mode = {0};
            bins decoder_mode = {1};
            bins full_channel = {2};
        }

        cover4data_in : coverpoint inter.PWDATA iff(inter.PADDR == 'h4) ;

        cover4codeword_width : coverpoint inter.PWDATA iff(inter.PADDR == 'h8) ;{

            bins bit8 = {0};
            bins bit16 = {1};
            bins bit32 = {2};
        }

        cover4ZEROnoise : coverpoint inter.PWDATA iff(inter.PADDR == 'hc && inter.PWDATA == 0) ;{
            bins ZeroNoise = {0};
        }
        cover4ONEnoise : coverpoint (^inter.PWDATA) iff(inter.PADDR == 'hc !(inter.PWDATA == 0)) ;{
            bins OneNoise = {1};
        }
        cover4TWOnoise : coverpoint (^inter.PWDATA) iff(inter.PADDR == 'hc !(inter.PWDATA == 0)) ;{
            bins TwoNoise = {2};
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