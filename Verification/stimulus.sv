`ifndef apb_trans
`define apb_trans
`include "transaction.sv"
`endif 


class stimulus #(
  int       AMBA_WORD = 32,
  int       AMBA_ADDR_WIDTH = 20,
  int       DATA_WIDTH = 32);

    typedef virtual intf.MASTER # (     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
    ) param_intf;


    apb_trans # (     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
    ) tests[$]; // a queue of apb_trans
    param_intf inter;
    event   apb_test_done;
    event   finished;
    apb_trans # (     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
    ) trans;
    int number_of_tests;
    int number_of_apb_tests;

    int cover_data_in;
    int cover_noise;
    int cover_ctrl;
    int cover_width;

    function new(param_intf inter, event apb_test_done, int number_of_tests);
       this.inter = inter;
       this.apb_test_done = apb_test_done;
       this.number_of_tests = number_of_tests;
    endfunction

    task run_gen(); 
        for (int i = 0 ; i < number_of_tests ; i++ ) begin
            trans = new;
            assert(trans.randomize());
            trans.test_number = i + 1;
            tests.push_back(trans);
        end
    endtask



    task run_driver();
        $display("[STIMULUS] starting regression");
        @(posedge inter.clk);
        inter.PSEL <= 0;
        inter.PENABLE <= 0;
        inter.PWRITE   <=  1;
        while(tests.size() > 0) begin
            trans = tests.pop_front();
            //$display("[STIMULUS] writing to DUT");
            inter.PSEL     <=  1;
            //if(trans.test_number >0) begin // this is a tool to run only a specific test, change to == <test_number>
                // this.cover_ctrl     <= trans.ctrl;
                // this.cover_data_in  <= trans.data_in;
                // this.cover_noise    <= trans.noise;
                // this.cover_width    <= trans.cover_width;

                
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
            //end
        end
    endtask //run_driver



    task run_apb_test;
        $display("[STIMULUS] testing APB protocol");
        while(tests.size() > 0 && number_of_apb_tests > 0) begin
            number_of_apb_tests --;
            trans = tests.pop_front();
            inter.PSEL     <= 0;
            inter.PENABLE  <= 0;

            @(posedge inter.clk);
            inter.PWRITE   <= 1;
            inter.PSEL     <= 1;

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
            
            //move to read mode
            inter.PWRITE <= 0;

            //Read from DATA_IN
            @(posedge inter.clk);
            inter.PADDR    <=  4'h4;
            @(posedge inter.clk);
            inter.PENABLE <= 1;
            assert(inter.PRDATA == trans.data_in);
            @(posedge inter.clk);
            inter.PENABLE <= 0;

            //Read from CODEWORD_WIDTH
            @(posedge inter.clk);
            inter.PADDR    <=  4'h8; 
            @(posedge inter.clk);
            inter.PENABLE <= 1;
            assert(inter.PRDATA == trans.codeword_width);
            @(posedge inter.clk);
            inter.PENABLE <= 0;

            //Read from NOISE
            @(posedge inter.clk);
            inter.PADDR    <=  4'hc; 
            @(posedge inter.clk);
            inter.PENABLE <= 1;
            assert(inter.PRDATA == trans.noise);
            @(posedge inter.clk);
            inter.PENABLE <= 0;

            //Read from CTRL
            @(posedge inter.clk);
            inter.PADDR    <=  4'h0; 
            @(posedge inter.clk);
            inter.PENABLE <= 1;
            assert(inter.PRDATA == trans.ctrl);
            @(posedge inter.clk);

            inter.PENABLE <= 0;
            inter.PSEL <= 0;
            @(posedge inter.clk);

        end
        ->apb_test_done;

    endtask

    task wait_for_finish;
        @(finished);
        $display("[STIMULUS] finished");
    endtask

    task run();
    
        run_gen;
        run_apb_test;
        run_driver;
        @(negedge inter.operation_done); // this was added to insure checker finish processing last test before $finish
        $display("[STIMULUS] Number of tests: %d",number_of_tests);
        $display("[STIMULUS] finished");
        ->finished;
    endtask //driver

 

endclass //generator & driver