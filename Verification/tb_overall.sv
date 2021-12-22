`ifndef apb_trans
`define apb_trans
`include "transaction.sv"
`endif 

`ifndef out_trans
`define out_trans
`include "output_transaction.sv"
`endif

`ifndef golden_model
`define golden_model
`include "GoldModel.sv"
`endif

`ifndef in_monitor
`define in_monitor
`include "input_monitor.sv"
`endif

`ifndef out_monitor
`define out_monitor
`include "output_monitor.sv"
`endif

`ifndef stimulus
`define stimulus
`include "Stimulus.sv"
`endif

// `ifndef coverage
// `define coverage
// `include "Coverage.sv"
// `endif

`ifndef checker_chk
`define checker_chk
`include "Checker.sv"
`endif

`resetall
`timescale 1ns/1ns

module tb;

    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;
    parameter       DATA_WIDTH = 32; // codeword width max

    int number_of_tests = 100000;

    bit clk, rst;
    mailbox in2chk, out2chk;
    checker_chk #(     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
        ) chk;
    stimulus #(     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
        ) stm;
    in_monitor #(     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
        ) in_mon;
    out_monitor #(     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
        ) out_mon;
    // cover_wrap #(     
    //             .AMBA_WORD(AMBA_WORD),
    //             .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
    //             .DATA_WIDTH(DATA_WIDTH)
    //     ) cg_wrap;
    

    event stm_finished;
    event out_mon_finished;

    typedef virtual intf.MONITOR # (     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
    ) param_intf;
    
    covergroup cg (param_intf inter) @(posedge inter.clk);

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

        cover4data_in : coverpoint inter.PWDATA iff(inter.PADDR == 'h4 && inter.PENABLE)
        {
            bins DataIn[] = {[0:DATA_WIDTH-1]};
        }

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

        cover4data_out : coverpoint inter.data_out iff(inter.operation_done)
        {
            bins DataIn[] = {[0:DATA_WIDTH-1]};
        }

        ctrlXwidth : cross cover4ctrl,cover4codeword_width;
        ctrlXdata_in: cross cover4ctrl,cover4data_in;
        widthXdata_in: cross cover4codeword_width,cover4data_in;
    endgroup 

    cg cg_inst;

    intf # (     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
        ) inter (
        .clk(clk),
        .rst(rst)
    );


    ECC_ENC_DEC #(     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
        ) DUT(
        .rst(inter.rst),
        .clk(inter.clk), 
        .data_out(inter.data_out),
        .operation_done(inter.operation_done),
        .num_of_errors(inter.num_of_errors),
    //APB protocol
        .PWDATA(inter.PWDATA),
        .PADDR(inter.PADDR),
        .PENABLE(inter.PENABLE),
        .PSEL(inter.PSEL),
        .PWRITE(inter.PWRITE),
        .PRDATA(inter.PRDATA)
    );


    task build;
        in2chk = new;
        out2chk = new;
        chk = new(in2chk, out2chk, out_mon_finished);
        stm = new(tb.inter.MASTER, stm_finished, number_of_tests);
        in_mon = new(tb.inter.MONITOR, in2chk, stm_finished);
        out_mon = new(tb.inter.MONITOR, out2chk, stm_finished, out_mon_finished);
        cg_inst = new(tb.inter.MONITOR);
        //cov = new(tb.inter.MONITOR);
    endtask 

    task run;
        rst = 0;
        #10 rst =1;
        fork
            stm.run();
            in_mon.run();
            out_mon.run();
            chk.run();
        join_any
    endtask

    task wait_for_finish;
        fork
            stm.wait_for_finish();
            //in_mon.wait_for_finish(); // no need. they finish together
            //out_mon.wait_for_finish();
            chk.wait_for_finish();
        join
    endtask

    initial begin
        $display("Starting testing\n");
        build();
        $display("Running\n");
        run(); // this shouldnt be a deadlock because stm should run a finite amount of time.
        //wait_for_finish();
        $display("Coverage = %0.2f %%",cg_inst.get_inst_coverage());
        $finish;
    end
    
    always #5 clk = ~clk;


    
endmodule
