class out_monitor;

    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;
    parameter       DATA_WIDTH = 32;


    virtual intf.MONITOR inter;
    
    mailbox mon2chk;

    function new(mailbox mon2chk,virtual intf.MONITOR inter);
        this.mon2chk = mon2chk;
        this.inter = inter;
        
    endfunction //new()



    task out_sampling;
        forever begin
            transaction trans = new;
            @(posedge inter.clk)
            trans.data_out <= inter.data_out;
            trans.operation_done <=inter.operation_done;
            trans.num_of_errors <= inter.num_of_errors;
            mon2chk.put(trans);
        end
    endtask 


endclass //Out_monitor