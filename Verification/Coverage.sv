`ifndef apb_trans
`define apb_trans
`include "transaction.sv"
`endif 

`ifndef out_trans
`define out_trans
`include "output_transaction.sv"
`endif


class coverage;

   parameter       AMBA_WORD = 32;
   parameter       AMBA_ADDR_WIDTH = 20;
   parameter       DATA_WIDTH = 32;



    virtual intf.MONITOR inter;

    //test for inputs and outputs of the DUT
    covergroup inOutDUT @(posedge inter.clk);

        cover4ctrl : coverpoint inter.PWDATA iff(inter.PADDR == 0 && inter.PEANBLE) {

            bins encoder_mode = {0};
            bins decoder_mode = {1};
            bins full_channel = {2};
            //modeXnoise cross cover4ctrl,cover4ZEROnoise;
        }

        cover4codeword_width : coverpoint inter.PWDATA iff(inter.PADDR == 'h8 && inter.PEANBLE) {

            bins bit8 = {0};
            bins bit16 = {1};
            bins bit32 = {2};
        }

        cover4data_in : coverpoint inter.PWDATA iff(inter.PADDR == 'h4 && inter.PEANBLE) {
            bins DataIn = {[0:AMBA_WORD]};
            //sizeXdataIn : cross DataIn,cover4codeword_width;
            //modeXDataIn : cross DataIn,cover4ctrl;
        }

        cover4ZEROnoise : coverpoint inter.PWDATA iff(inter.PADDR == 'hc && inter.PWDATA == 0 && inter.PEANBLE) {
            bins ZeroNoise = {0};
        }

        cover4ONEnoise : coverpoint (^inter.PWDATA) iff(inter.PADDR == 'hc && !(inter.PWDATA == 0)) {
            bins OneNoise = {1};
        }

        cover4TWOnoise : coverpoint (^inter.PWDATA) iff(inter.PADDR == 'hc && !(inter.PWDATA == 0)) {
            bins TwoNoise = {0};
        }

        cover4data_out : coverpoint inter.operation_done {
            bins DataOut = {[0:AMBA_WORD]};
            //sizeXdataOut : cross DataOut,cover4codeword_width;
            //modeXDataIn : cross DataOut,cover4ctrl;
        }

        cover4NumberOfErrors : coverpoint inter.operation_done {
            bins NumberOfErrors = {[0:2]};
            //noiseErrros : cross NumberOfErrors,cover4ZEROnoise;
        }

    endgroup : inOutDUT
    
    

    function new(virtual intf.MONITOR inter);

        inOutDUT = new;
        this.inter = inter;

    endfunction //new() func

endclass //className