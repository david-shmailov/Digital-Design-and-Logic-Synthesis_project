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

    transaction trans;
    task CTRL;
      forever begin
            gen2drv.get(trans);
            @(posedge clk);
            PADDR <= trans;
        end
   endtask


   task DATA_IN;
      forever begin
            gen2drv.get(trans);
            @(posedge clk);
            PADDR <= trans;
        end
   endtask

   task NOISE;
        forever begin
            gen2drv.get(trans);
            @(posedge clk);
            PADDR <= trans;
        end
   endtask

   task CODEWARD_WIDTH;
      forever begin
            gen2drv.get(trans);
            @(posedge clk);
            PADDR <= trans;
        end
   endtask
    
endclass //driver