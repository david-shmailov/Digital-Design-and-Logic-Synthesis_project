class out_monitor;

    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;
    parameter       DATA_WIDTH = 32;


    virtual intf.MONITOR inter;
    
    mailbox mon2gm;

    function new(mailbox mon2gm,virtual intf.MONITOR inter);
        this.mon2gm = mon2gm;
        this.inter = inter;
        
    endfunction //new()


    task in_sampling;
        forever begin
            transaction trans = new;
            @(posedge inter.clk)
            trans.PADDR <= inter.PADDR;
            trans.PENABLE <= inter.PENABLE;
            trans.PSEL <= inter.PSEL;
            trans.PWDATA <= inter.PWDATA;
            trans.PWRITE <= inter.PWRITE;
            trans.PRDATA <= inter.PRDATA;    
            mon2chk.put(trans);
        end
    endtask 


endclass //Out_monitor