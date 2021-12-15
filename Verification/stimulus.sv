class generator_driver;

    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;
    parameter       DATA_WIDTH = 32;


    mailbox gen2drv;
    virtual intf.MASTER inter;

    function new(virtual intf.MASTER inter);
       this.gen2drv = new();
       this.inter = inter;
    endfunction

    task run_gen();
        for ( i = 0 ; i < 50 ; i++ ) begin
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
        forever begin
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

    task stimulus();
    
        run_gen;
        run_driver;

    endclass //driver

endclass //generator & driver