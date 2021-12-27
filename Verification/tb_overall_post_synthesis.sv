`ifndef checker_chk
`define checker_chk
`include "Checker.sv"
`endif

`ifndef stimulus
`define stimulus
`include "stimulus.sv"
`endif

`ifndef in_mon
`define in_mon
`include "in_monitor.sv"
`endif

`ifndef out_monitor
`define out_monitor
`include "output_monitor.sv"
`endif



`resetall
`timescale 10ns/1ns

module tb_post;

    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;
    parameter       DATA_WIDTH = 32; // codeword width max

    localparam      data_width_by4 = DATA_WIDTH/4;
    localparam  encode = 0;
    localparam  decode = 1;
    localparam  full_channel = 2;

    localparam  mod0 = 0;
    localparam  mod1 = 1;
    localparam  mod2 = 2;

    int number_of_tests = 10000;
    int number_of_apb_tests = 10;

    bit clk, rst;
    mailbox in2chk, out2chk;


    checker_chk #(     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
        ) chk;
    stimulus #(     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
        ) stm;
    in_mon #(     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
    ) in_monitor;
    out_monitor #(     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
        ) out_mon;
 
    
    event starting_test;
    event apb_test_done;
    event out_mon_finished;
    event packet_ready;


    
    
    covergroup cg_input @(packet_ready); 
        cover_data_in_decode_0 : coverpoint in_monitor.cover_data_in iff(in_monitor.cover_ctrl == decode && in_monitor.cover_width == mod0)  {
            bins data_in_dec_0[2] = {[0:256-1]}; // divide data_in for bins of size 4 bits
        }

        cover_data_in_decode_1 : coverpoint in_monitor.cover_data_in iff(in_monitor.cover_ctrl == decode && in_monitor.cover_width == mod1)  {
            bins data_in_dec_1[4] = {[0:65536-1]}; // divide data_in for bins of size 4 bits
        }

        cover_data_in_decode_2 : coverpoint in_monitor.cover_data_in iff(in_monitor.cover_ctrl == decode && in_monitor.cover_width == mod2)  {
            bins data_in_dec_2[8] = {[0:$]}; // divide data_in for bins of size 4 bits
        }
        //for data_in , on decode mode we need to the full range and on fullchannel/encode we only need to input info range
        cover_data_in_encode_0 : coverpoint in_monitor.cover_data_in iff(in_monitor.cover_ctrl != decode && in_monitor.cover_width == mod0)  {
            bins data_in_enc_0[2] = {[0:16-1]}; // divide data_in for bins of size 4 bits
        }

        cover_data_in_encode_1 : coverpoint in_monitor.cover_data_in iff(in_monitor.cover_ctrl != decode && in_monitor.cover_width == mod1)  {
            bins data_in_enc_1[4] = {[0:2048-1]}; // divide data_in for bins of size 4 bits
        }

        cover_data_in_encode_2 : coverpoint in_monitor.cover_data_in iff(in_monitor.cover_ctrl != decode && in_monitor.cover_width == mod2)  {
            bins data_in_enc_2[8] = {[0:67108864-1]}; // divide data_in for bins of size 4 bits
        }

        
        cover_ctrl : coverpoint in_monitor.cover_ctrl{
            bins encoder_mode = {0};
            bins decoder_mode = {1};
            bins full_channel = {2};
        }
        cover_codeword_width : coverpoint in_monitor.cover_width{
            bins bit8  = {0};
            bins bit16 = {1};
            bins bit32 = {2};
        }
        cover_noise_0 : coverpoint in_monitor.cover_noise iff(in_monitor.cover_ctrl == full_channel){ //only in full channel noise has meaning
            bins ZeroNoise = {0};
        }
        cover_noise_not_0 : coverpoint ^(in_monitor.cover_noise) iff(in_monitor.cover_ctrl == full_channel && in_monitor.cover_noise != 0){ //only in full channel noise has meaning
            bins OneBit  = {1};
            bins TwoBits = {0};
        }
        ctrlXwidth   : cross cover_ctrl,cover_codeword_width;
        widthXnoise0 : cross cover_codeword_width, cover_noise_0;
        widthXnoise12: cross cover_codeword_width, cover_noise_not_0;
    endgroup   

    covergroup cg_output @(posedge inter.clk);

        //we dont care about num of errors on encode mode work.
        cover_num_of_error : coverpoint inter.num_of_errors iff(inter.operation_done && in_monitor.cover_ctrl != encode)
        {
            bins ZeroErr = {0};
            bins OneErr = {1};
            bins TwoErr = {2};
        }


        cover_data_out_encode_0 : coverpoint inter.data_out iff(inter.operation_done && in_monitor.cover_ctrl == encode && in_monitor.cover_width == mod0)  {
            bins data_out_dec_0[2] = {[0:256-1]}; // divide data_in for bins of size 4 bits
        }

        cover_data_out_encode_1 : coverpoint inter.data_out iff(inter.operation_done && in_monitor.cover_ctrl == encode && in_monitor.cover_width == mod1)  {
            bins data_out_dec_1[4] = {[0:65536-1]}; // divide data_in for bins of size 4 bits
        }

        cover_data_out_encode_2 : coverpoint inter.data_out iff(inter.operation_done && in_monitor.cover_ctrl == encode && in_monitor.cover_width == mod2)  {
            bins data_out_dec_2[8] = {[0:$]}; // divide data_in for bins of size 4 bits
        }
        // for data_out, on encode mode it gets the full range and on decode/fullchannel we only get info range
        cover_data_out_decode_0 : coverpoint inter.data_out iff(inter.operation_done && in_monitor.cover_ctrl != encode && in_monitor.cover_width == mod0)  {
            bins data_out_enc_0[2] = {[0:16-1]}; // divide data_in for bins of size 4 bits
        }

        cover_data_out_decode_1 : coverpoint inter.data_out iff(inter.operation_done && in_monitor.cover_ctrl != encode && in_monitor.cover_width == mod1)  {
            bins data_out_enc_1[4] = {[0:2048-1]}; // divide data_in for bins of size 4 bits
        }

        cover_data_out_decode_2 : coverpoint inter.data_out iff(inter.operation_done && in_monitor.cover_ctrl != encode && in_monitor.cover_width == mod2)  {
            bins data_out_enc_2[8] = {[0:67108864-1]}; // divide data_in for bins of size 4 bits
        }
        

    endgroup 

    cg_output cg_inst;
    cg_input cg_in_inst;
    intf # (     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
        ) inter (
        .clk(clk),
        .rst(rst)
    );


    ECC_ENC_DEC DUT(
        .rst(inter.rst),
        .clk(inter.clk), 
        .data_out(inter.data_out),
        .operation_done(inter.operation_done),
        .num_of_errors(inter.num_of_errors),
    //APB protocol
        .PWDATA(inter.PWDATA),
        .PADDR(inter.PADDR),
        .PENABLE(inter.PENABLE),
        .PSEL(inter.PSEL),
        .PWRITE(inter.PWRITE),
        .PRDATA(inter.PRDATA)
    );


    task build;
        in2chk = new;
        out2chk = new;
        stm = new(tb.inter.MASTER, apb_test_done, starting_test, number_of_tests, number_of_apb_tests);
        chk = new(in2chk, out2chk, apb_test_done);
        in_monitor = new(tb.inter.MONITOR, in2chk, apb_test_done, packet_ready);
        out_mon = new(tb.inter.MONITOR, out2chk, apb_test_done);
        cg_inst = new;
        cg_in_inst = new;
    endtask 

    task run;
        rst = 0;
        #10 rst =1;
        fork
            stm.run();
            in_monitor.run();
            out_mon.run();
            chk.run();
        join_any
    endtask


    initial begin
        $display("[TB] Start");
        build();
        $display("[TB] Running");
        run(); 

        $display("[TB] Input Coverage  = %0.2f %%",cg_in_inst.get_inst_coverage());
        $display("[TB] Output Coverage = %0.2f %%",cg_inst.get_inst_coverage());
        $finish;
    end
    
    always #5 clk = ~clk;


    
endmodule
