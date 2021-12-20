`include "ifndef_list.sv"

`resetall
`timescale 1ns/100ps

module tb;
    

    bit clk, rst;
    mailbox in2chk, out2chk;
    checker_chk chk;
    stimulus stm;
    in_monitor in_mon;
    out_monitor out_mon;
    event stm_finished;
    event out_mon_finished;
    //covereage cov;

    intf inter(
        .clk(clk),
        .rst(rst)
    );


    ECC_ENC_DEC DUT(
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
        .PRDATA(inter.PWDATA)
    );


    task build;
        in2chk = new;
        out2chk = new;
        chk = new(in2chk, out2chk, out_mon_finished);
        stm = new(tb.inter.MASTER, stm_finished);
        in_mon = new(tb.inter.MONITOR, in2chk, stm_finished);
        out_mon = new(tb.inter.MONITOR, out2chk, stm_finished, out_mon_finished);
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
            in_mon.wait_for_finish();
            out_mon.wait_for_finish();
            chk.wait_for_finish();
        join
    endtask

    initial begin
        $display("Starting testing\n");
        build();
        $display("Running\n");
        run(); // this shouldnt be a deadlock because stm should run a finite amount of time.
        wait_for_finish();
        $finish;
    end
    
    always #5 clk = ~clk;


    
endmodule
