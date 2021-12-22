

// class coverage;

   parameter       AMBA_WORD = 32;
   parameter       AMBA_ADDR_WIDTH = 20;
   parameter       DATA_WIDTH = 32;




//     virtual intf.MONITOR inter;
     
    


    //test for inputs and outputs of the DUT
    covergroup cg (virtual intf.MONITOR inter) @(posedge inter.clk);

        cover4ctrl : coverpoint inter.PWDATA iff(inter.PADDR == 0 && inter.PENABLE) {

            bins encoder_mode = {0};
            bins decoder_mode = {1};
            bins full_channel = {2};
            //modeXnoise cross cover4ctrl,cover4ZEROnoise;
        }

        cover4codeword_width : coverpoint inter.PWDATA iff(inter.PADDR == 'h8 && inter.PENABLE) {

            bins bit8 = {0};
            bins bit16 = {1};
            bins bit32 = {2};
        }

        cover4data_in : coverpoint inter.PWDATA iff(inter.PADDR == 'h4 && inter.PENABLE) {
            bins DataIn = {[AMBA_WORD - 1:0]};
            //sizeXdataIn : cross DataIn,cover4codeword_width;
            //modeXDataIn : cross DataIn,cover4ctrl;
        }

        cover4ZEROnoise : coverpoint inter.PWDATA iff(inter.PADDR == 'hc && inter.PWDATA == 0 && inter.PENABLE) {
            bins ZeroNoise = {0};
        }

        cover4ONEnoise : coverpoint (^inter.PWDATA) iff(inter.PADDR == 'hc && !(inter.PWDATA == 0)) {
            bins OneNoise = {1};
        }

        cover4TWOnoise : coverpoint (^inter.PWDATA) iff(inter.PADDR == 'hc && !(inter.PWDATA == 0)) {
            bins TwoNoise = {0};
        }

        cover4data_out : coverpoint inter.data_out {
            bins DataOut = {[AMBA_WORD - 1:0]};
            //sizeXdataOut : cross DataOut,cover4codeword_width;
            //modeXDataIn : cross DataOut,cover4ctrl;
        }

        cover4NumberOfErrors : coverpoint inter.operation_done {
            bins NumberOfErrors = {[1:0]};
            //noiseErrros : cross NumberOfErrors,cover4ZEROnoise;
        }

    endgroup : cg
   
//     cg cg_inst; 

//     function new(virtual intf.MONITOR inter);

//         this.cg_inst = new;
//         this.inter = inter;

//     endfunction //new() func

//     task print;
//         $display("Coverage = %0.2f %%",cg_inst.get_inst_coverage());

//     endtask

// endclass //className

