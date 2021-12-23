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

    localparam      data_width_by4 = DATA_WIDTH/4;


    int number_of_tests = 100000;
    int number_of_apb_tests = 4;

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
    
    event starting_test;
    event apb_test_done;
    event out_mon_finished;

    typedef virtual intf.MONITOR # (     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
    ) param_intf;
    
    // covergroup cg_input @(starting_test);
    //     cover_data_in : coverpoint stm.cover_data_in iff(stm.cover_ctrl ==1) && {
    //         bins data_in[data_width_by4] = {[0:DATA_WIDTH]}; // divide data_in into 4 sections for bins of size 4 bits
    //     }

    //     // cover_data_in : coverpoint stm.cover_data_in{
    //     //     bins data_in[data_width_by4] = {[0:DATA_WIDTH]}; // divide data_in into 4 sections for bins of size 4 bits
    //     // }

    //     // cover_data_in : coverpoint stm.cover_data_in{
    //     //     bins data_in[data_width_by4] = {[0:DATA_WIDTH]}; // divide data_in into 4 sections for bins of size 4 bits
    //     // }

    //     // cover_data_in : coverpoint stm.cover_data_in{
    //     //     bins data_in[data_width_by4] = {[0:DATA_WIDTH]}; // divide data_in into 4 sections for bins of size 4 bits
    //     // }
        
    //     cover_ctrl : coverpoint stm.cover_ctrl{
    //         bins encoder_mode = {0};
    //         bins decoder_mode = {1};
    //         bins full_channel = {2};
    //     }
    //     cover_codeword_width : coverpoint stm.cover_width{
    //         bins bit8 = {0};
    //         bins bit16 = {1};
    //         bins bit32 = {2};
    //     }
    //     cover_noise_0 : coverpoint stm.cover_noise iff(stm.cover_ctrl == 2){ //only in full channel noise has meaning
    //         bins ZeroNoise = {0};
    //     }
    //     cover_noise_not_0 : coverpoint ^(stm.cover_noise) iff(stm.cover_ctrl == 2 && stm.cover_noise != 0){ //only in full channel noise has meaning
    //         bins OneBit  = {1};
    //         bins TwoBits = {0};
    //     }
    // endgroup    

    covergroup cg_output (param_intf inter) @(posedge inter.clk);

        cover4numOfErr : coverpoint inter.num_of_errors iff(inter.operation_done)
        {
            bins ZeroErr = {0};
            bins OneErr = {1};
            bins TwoErr = {2};
        }

        cover4data_out : coverpoint inter.data_out iff(inter.operation_done)
        {
            bins dataOut[data_width_by4] = {[0:DATA_WIDTH]};
        }
        

    endgroup 

    cg_output cg_inst;
    //cg_input cg_in_inst;
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
        stm = new(tb.inter.MASTER, apb_test_done, starting_test, number_of_tests, number_of_apb_tests);
        chk = new(in2chk, out2chk, apb_test_done);
        in_mon = new(tb.inter.MONITOR, in2chk, apb_test_done);
        out_mon = new(tb.inter.MONITOR, out2chk, apb_test_done);
        cg_inst = new(tb.inter.MONITOR);
        //cg_in_inst = new;
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
            //chk.wait_for_finish();
        join
    endtask

    initial begin
        $display("[TB] Start");
        build();
        $display("[TB] Running");
        run(); // this shouldnt be a deadlock because stm should run a finite amount of time.
        //wait_for_finish();
        //$display("[TB] Input Coverage  = %0.2f %%",cg_in_inst.get_inst_coverage());
        $display("[TB] Output Coverage = %0.2f %%",cg_inst.get_inst_coverage());
        $finish;
    end
    
    always #5 clk = ~clk;


    
endmodule
