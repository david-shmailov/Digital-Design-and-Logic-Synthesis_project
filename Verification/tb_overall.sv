import pkg_classes::*;

program test;

    mailbox in2chk, out2chk;
    checker chk;
    stimulus stm;
    in_monitor in_mon;
    out_monitor out_mon;
    event stm_done;
    //covereage cov;


    task build;
        in2chk = new;
        out2chk = new;
        chk = new(in2chk, out2chk);
        stm = new(tb.inter.MASTER, stm_done);
        in_mon = new(tb.inter.MONITOR, in2chk);
        out_mon = new(tb.inter.MONITOR, out2chk);
    endtask 

    task run;
        fork
            stm.run();
            in_mon.run();
            out_mon.run();
            chk.run();
        join // maybe join any
    endtask


endprogram

module tb;

bit clk, rst;

always #5 clk = ~clk;

initial begin
    rst = 0;
    #10 rst =1;
end

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
)

endmodule