`ifndef out_trans
`define out_trans
`include "output_transaction.sv"
`endif 


class out_monitor;

    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;
    parameter       DATA_WIDTH = 32;


    virtual intf.MONITOR inter;
    event stm_finished , out_mon_finished;
    mailbox mon2chk;
    out_trans trans;
    int counter;

    function new(virtual intf.MONITOR inter, mailbox mon2chk, event stm_finished, event out_mon_finished);
        this.mon2chk = mon2chk;
        this.inter = inter;
        this.stm_finished = stm_finished;
        this.out_mon_finished = out_mon_finished;
    endfunction //new()

    task wait_for_finish;
        @(stm_finished);
        //@(posedge inter.operation_done);
        ->out_mon_finished;
        $display("output monitor finished");
    endtask


    task run;
        counter = 1;
        forever begin
            trans = new;
            @(posedge inter.clk);
            if (inter.operation_done == 1) begin
                trans.data_out = inter.data_out;
                trans.operation_done = inter.operation_done;
                trans.num_of_errors = inter.num_of_errors;
                trans.test_number = counter;

                mon2chk.put(trans);
                counter = counter +1;
            end
        end
    endtask 


endclass //Out_monitor