class in_monitor;

    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;
    parameter       DATA_WIDTH = 32;


    virtual intf.MONITOR inter;
    
    mailbox mon2gm;

    function new(virtual intf.MONITOR inter, mailbox mon2gm);
        this.mon2gm = mon2gm;
        this.inter = inter;
        
    endfunction //new()


    task run;
        forever begin
            abp_trans trans = new; // check that if something is rand can still accept a deterministic value
            @(posedge inter.clk)
            if (inter.PENABLE) begin
                case(inter.PADDR)
                    'h0: trans.ctrl <= inter.PWDATA;
                    'h4: trans.data_in <= inter.PWDATA;
                    'h8: trans.codeword_width <= inter.PWDATA;
                    'hc: trans.noise <= inter.PWDATA;
                endcase
                if(inter.PADDR == 0) // if we wrote to ctrl , then the transaction is complete
                    mon2chk.put(trans);
            end
        end
    endtask


endclass //in_monitor