class out_monitor;

    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;
    parameter       DATA_WIDTH = 32;


    virtual intf.MONITOR inter;
    
    mailbox mon2chk;

    function new(mailbox mon2chk,virtual intf.MONITOR inter);

        this.mon2chk = new();
        this.inter = inter;
        
    endfunction //new()



endclass //Out_monitor