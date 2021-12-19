class out_monitor;

    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;
    parameter       DATA_WIDTH = 32;


    virtual intf.MONITOR inter;
    event stm_finished;
    mailbox mon2chk;

    function new(virtual intf.MONITOR inter, mailbox mon2chk, event stm_finished, event out_mon_finished);
        this.mon2chk = mon2chk;
        this.inter = inter;
        this.stm_finished = stm_finished;
        this.out_mon_finished = out_mon_finished;
    endfunction //new()

    task wait_for_finish;
        @(stm_finished);
        @(posedge inter.operation_done);
        ->out_mon_finished
    endtask


    task run;
        forever begin
            transaction trans = new;
            @(posedge inter.operation_done);

            trans.data_out <= inter.data_out;
            trans.operation_done <= inter.operation_done;
            trans.num_of_errors <= inter.num_of_errors;
            mon2chk.put(trans);
            
        end
    endtask 


endclass //Out_monitor