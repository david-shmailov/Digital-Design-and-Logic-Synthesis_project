`ifndef apb_trans
`define apb_trans
`include "transaction.sv"
`endif

class in_mon #(
    int       AMBA_WORD = 32,
    int       AMBA_ADDR_WIDTH = 20,
    int       DATA_WIDTH = 32);

    localparam  encode = 0;
    localparam  decode = 1;
    localparam  full_channel = 2;

    localparam  mod0 = 0;
    localparam  mod1 = 1;
    localparam  mod2 = 2;

    typedef virtual intf.MONITOR #(     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
    ) param_intf;
    localparam      data_width_by4 = DATA_WIDTH/4;
    param_intf inter;
    event   apb_test_done;
    event   packet_ready;

    mailbox mon2chk;
    apb_trans #(.AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
    ) trans;
    int     counter;


    int cover_data_in;
    bit [AMBA_WORD-1:0] cover_noise;
    int cover_ctrl;
    int cover_width;


    function new(param_intf inter, mailbox mon2chk, event apb_test_done, event packet_ready); 
        this.mon2chk = mon2chk;
        this.apb_test_done = apb_test_done;
        this.inter = inter;
        this.packet_ready = packet_ready;
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
                    //change the cover signals for the coverage
                    cover_ctrl     = trans.ctrl;
                    cover_data_in  = trans.data_in;
                    cover_noise    = trans.noise;
                    cover_width    = trans.codeword_width;

                    trans.test_number = counter;
                    ->packet_ready; // notifies input covergroup to sample
                    mon2chk.put(trans); //send the sampled transaction to the checker
                    trans = new; 
                    counter = counter +1;
                end
            end
        end
    endtask


endclass //in_monitor