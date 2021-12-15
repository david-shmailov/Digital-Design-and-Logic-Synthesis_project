class generator;

    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;
    parameter       DATA_WIDTH = 32;

    mailbox gen2drv;

    function new();
        
    endfunction //new()

    task run();
        for ( i = 0 ; i < 50 ; i++ ) begin
            transaction trans = new;
            if(!trans.randomize()) $fatal("Gen:: trans randomization failed"); 
            gen2drv.put(trans);
        end
    endtask

endclass //generator


class driver;
    function new();
        
    endfunction //new()

    gen2drv.get(trans);
    @(posedge clk);
    
endclass //driver