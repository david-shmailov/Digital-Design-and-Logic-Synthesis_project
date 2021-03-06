`ifndef out_trans
`define out_trans
`include "output_transaction.sv"
`endif 


class out_monitor #(
  int       AMBA_WORD = 32,
  int       AMBA_ADDR_WIDTH = 20,
  int       DATA_WIDTH = 32);

    typedef virtual intf.MONITOR # (     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
    ) param_intf;

    param_intf inter;
    event  apb_test_done;
    mailbox mon2chk;
    out_trans # (     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
    ) trans;
    int counter;

    function new(param_intf inter, mailbox mon2chk,  event apb_test_done);
        this.mon2chk = mon2chk;
        this.inter = inter;
        this.apb_test_done = apb_test_done;
    endfunction //new()

 


    task run;
        @(apb_test_done);
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