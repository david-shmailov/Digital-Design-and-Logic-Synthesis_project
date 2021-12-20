`ifndef apb_trans
`define apb_trans
`include "transaction.sv"
`endif 


class stimulus;

    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;
    parameter       DATA_WIDTH = 32;


    apb_trans tests[$];
    virtual intf.MASTER inter;
    event   finished;
    apb_trans trans;
    localparam num_of_tests = 200;

    function new(virtual intf.MASTER inter, event finished);
       this.inter = inter;
       this.finished = finished;
    endfunction

    task run_gen(); 
        for (int i = 0 ; i < num_of_tests ; i++ ) begin
            trans = new;
            assert(trans.randomize());
            tests.push_back(trans);
        end
    endtask



    task run_driver();
        $display("[Stimulus] starting ...");
        @(posedge inter.clk);
        inter.PSEL <= 0;
        inter.PENABLE <= 0;
        inter.PWRITE   <=  1;
        while(tests.size() > 0) begin
            trans = tests.pop_front();
            //$display("WRITING OPERATION ...");
            inter.PSEL     <=  1;
            
            //Write to DATA_IN
            @(posedge inter.clk);
            inter.PWDATA   <=  trans.data_in;
            inter.PADDR    <=  4'h4;
            @(posedge inter.clk);
            inter.PENABLE <= 1;
            @(posedge inter.clk);
            inter.PENABLE <= 0;

            //Write to CODEWORD_WIDTH
            @(posedge inter.clk);
            inter.PWDATA   <=  trans.codeword_width;
            inter.PADDR    <=  4'h8; 
            @(posedge inter.clk);
            inter.PENABLE <= 1;
            @(posedge inter.clk);
            inter.PENABLE <= 0;

            //Write to NOISE
            @(posedge inter.clk);
            inter.PWDATA   <=  trans.noise;
            inter.PADDR    <=  4'hc; 
            @(posedge inter.clk);
            inter.PENABLE <= 1;
            @(posedge inter.clk);
            inter.PENABLE <= 0;

            //Write to CTRL
            @(posedge inter.clk);
            inter.PWDATA   <=  trans.ctrl;
            inter.PADDR    <=  4'h0; 
            @(posedge inter.clk);
            inter.PENABLE <= 1;
            @(posedge inter.clk);
            inter.PENABLE <= 0;
            
            inter.PSEL <= 0;
            //$display("WRITE FINISHED.\nWAITING FOR OPERATION DONE ...");
            @(posedge inter.operation_done);
        end
    endtask //run_driver

    task wait_for_finish;
        @(finished);
        $display("[Stimulus] finished");
    endtask

    task run();
    
        run_gen;
        run_driver;
        @(negedge inter.operation_done); // this was added to insure checker finish processing last test before $finish
        $display("[Stimulus] Number of tests: %d",num_of_tests);
        $display("[Stimulus] finished");
        ->finished;
    endtask //driver

endclass //generator & driver