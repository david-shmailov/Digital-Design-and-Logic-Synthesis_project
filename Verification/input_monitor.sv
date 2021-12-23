`ifndef apb_trans
`define apb_trans
`include "transaction.sv"
`endif 




class in_monitor #(
  int       AMBA_WORD = 32,
  int       AMBA_ADDR_WIDTH = 20,
  int       DATA_WIDTH = 32);

    typedef virtual intf.MONITOR # (     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
    ) param_intf;

    param_intf inter;
    event   apb_test_done;
    bit     last_trans;

    mailbox mon2chk;
    apb_trans # (     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
    ) trans;
    int     counter;

    function new(param_intf inter, mailbox mon2chk, event apb_test_done); // maybe you cant tranfer events as arg
        this.mon2chk = mon2chk;
        this.apb_test_done = apb_test_done;
        this.inter = inter;
        this.last_trans = 0;
    endfunction //new()


    task run;
        @(apb_test_done);
        trans = new; // check that if something is rand can still accept a deterministic value
        counter = 1;
        forever begin
            @(posedge inter.clk)
            if (inter.PENABLE) begin
                case(inter.PADDR)
                    'h0: trans.ctrl = inter.PWDATA;
                    'h4: trans.data_in = inter.PWDATA;
                    'h8: trans.codeword_width = inter.PWDATA;
                    'hc: trans.noise = inter.PWDATA;
                endcase
                if(inter.PADDR == 0) begin // if we wrote to ctrl , then the transaction is complete
                    trans.test_number = counter;
                    mon2chk.put(trans);
                    trans = new;
                    counter = counter +1;
                end
            end
        end
    endtask


endclass //in_monitor