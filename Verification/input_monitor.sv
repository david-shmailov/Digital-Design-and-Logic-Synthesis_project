class in_monitor;

    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;
    parameter       DATA_WIDTH = 32;


    virtual intf.MONITOR inter;
    event   stm_finished;
    bit     last_trans;
    event   finish;
    mailbox mon2gm;

    function new(virtual intf.MONITOR inter, mailbox mon2gm,event stm_finished); // maybe you cant tranfer events as arg
        this.mon2gm = mon2gm;
        this.inter = inter;
        this.stm_finished = stm_finished;
        this.last_trans = 0;
    endfunction //new()

    task wait_for_finish;
        @(stm_finished);
        @(finish);
    endtask

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
                if(inter.PADDR == 0) begin // if we wrote to ctrl , then the transaction is complete
                    mon2chk.put(trans);
                    ->finish; // triggers this event every time a trans is sent
                end
            end
        end
    endtask


endclass //in_monitor