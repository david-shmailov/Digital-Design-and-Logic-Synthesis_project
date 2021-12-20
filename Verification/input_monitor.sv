`ifndef apb_trans
`define apb_trans
`include "transaction.sv"
`endif 




class in_monitor;

    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;
    parameter       DATA_WIDTH = 32;


    virtual intf.MONITOR inter;
    event   stm_finished;
    bit     last_trans;
    event   finish;
    mailbox mon2chk;
    apb_trans trans;

    function new(virtual intf.MONITOR inter, mailbox mon2chk, event stm_finished); // maybe you cant tranfer events as arg
        this.mon2chk = mon2chk;
        this.inter = inter;
        this.stm_finished = stm_finished;
        this.last_trans = 0;
    endfunction //new()

    task wait_for_finish;
        @(stm_finished);
        @(finish);
        $display("input monitor finished");
    endtask

    task run;
        trans = new; // check that if something is rand can still accept a deterministic value
        forever begin
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
                    trans = new;
                    ->finish; // triggers this event every time a trans is sent
                end
            end
        end
    endtask


endclass //in_monitor