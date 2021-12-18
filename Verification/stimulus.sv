class stimulus;

    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;
    parameter       DATA_WIDTH = 32;


    mailbox gen2drv;
    virtual intf.MASTER inter;
    event   finished;

    localparam num_of_tests = 50;

    function new(virtual intf.MASTER inter, event finished);
       this.gen2drv = new();
       this.inter = inter;
       this.finished = finished;
    endfunction

    task run_gen();
        for ( i = 0 ; i < num_of_tests ; i++ ) begin
            transaction trans = new;
            if(!trans.randomize()) $fatal("Gen: trans randomization failed"); 
            gen2drv.put(trans);
        end
    endtask


    task run_driver();

        $display("Driver starting ...");
        @(posedge inter.clk);
        inter.PSEL <= 0;
        inter.PENABLE <= 0;
        for (i=0; i < num_of_tests; i++) begin
            gen2drv.get(trans)
            //gen2drv.get(trans);
            $display("PSEL goes UP ...");
            inter.PSEL     <=  1;

            //Write to DATA_IN
            @(inter.posedge clk);
            inter.PWDATA   <=  trans.data_in;
            inter.PADDR    <=  4'h4;
            @(inter.posedge clk);
            inter.PENABLE <= 1;
            @(inter.posedge clk);
            inter.PENABLE <= 0;

            //Write to CODEWORD_WIDTH
            @(inter.posedge clk);
            inter.PWDATA   <=  trans.codeword_width;
            inter.PADDR    <=  4'h8; 
            @(inter.posedge clk);
            inter.PENABLE <= 1;
            @(inter.posedge clk);
            inter.PENABLE <= 0;

            //Write to DATA_IN
            @(inter.posedge clk);
            inter.PWDATA   <=  trans.data_in;
            inter.PADDR    <=  4'hc; 
            @(inter.posedge clk);
            inter.PENABLE <= 1;
            @(inter.posedge clk);
            inter.PENABLE <= 0;

            //Write to CTRL
            @(inter.posedge clk);
            inter.PWDATA   <=  trans.ctrl;
            inter.PADDR    <=  4'h0; 
            @(inter.posedge clk);
            inter.PENABLE <= 1;
            @(inter.posedge clk);
            inter.PENABLE <= 0;
            @(posedge inter.operation_done);
        end 
    endtask //run_driver

    task run();
    
        run_gen;
        run_driver;
        ->finished;
    endclass //driver

endclass //generator & driver