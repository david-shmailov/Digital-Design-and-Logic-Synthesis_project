parameter       AMBA_WORD = 32;
parameter       AMBA_ADDR_WIDTH = 20;
parameter       DATA_WIDTH = 32;


covergroup cg (virtual intf.MONITOR inter) @(posedge inter.clk);

    //test for inputs and outputs of the DUT
    cover4ctrl : coverpoint inter.PWDATA iff(inter.PADDR == 0 && inter.PENABLE) 
    {

        bins encoder_mode = {0};
        bins decoder_mode = {1};
        bins full_channel = {2};
    }

    cover4codeword_width : coverpoint inter.PWDATA iff(inter.PADDR == 'h8 && inter.PENABLE) 
    {

        bins bit8 = {0};
        bins bit16 = {1};
        bins bit32 = {2};
    }

    cover4data_in : coverpoint inter.PWDATA iff(inter.PADDR == 'h4 && inter.PENABLE);

    cover4ZEROnoise : coverpoint inter.PWDATA iff(inter.PADDR == 'hc && inter.PWDATA == 0 && inter.PENABLE) 
    {
        bins ZeroNoise = {0};
    }

    cover4ONEnoise : coverpoint (^inter.PWDATA) iff(inter.PADDR == 'hc && !(inter.PWDATA == 0) && inter.PENABLE) 
    {
        bins OneNoise = {1};
    }

    cover4TWOnoise : coverpoint (^inter.PWDATA) iff(inter.PADDR == 'hc && !(inter.PWDATA == 0) && inter.PENABLE) 
    {
        bins TwoNoise = {0};
    }

    cover4numOfErr : coverpoint inter.num_of_errors 
    {
        bins ZeroErr = {0};
        bins OneErr = {1};
        bins TwoErr = {2};
    }

    data8bit : cross inter.data_out,cover4codeword_width;


endgroup : cg