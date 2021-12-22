`ifndef golden_model
`define golden_model
`include "GoldModel.sv"
`endif



class checker_chk #(
  int       AMBA_WORD = 32,
  int       AMBA_ADDR_WIDTH = 20,
  int       DATA_WIDTH = 32);

    mailbox inputs;
    mailbox outputs;

    golden_model  gm;
    event out_mon_finished;
    event finished_test;
    apb_trans #(     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
        ) sampled_in;
    out_trans #(     
                .AMBA_WORD(AMBA_WORD),
                .AMBA_ADDR_WIDTH(AMBA_ADDR_WIDTH),
                .DATA_WIDTH(DATA_WIDTH)
    ) expected, sampled_out;

    int num_of_fails;

    function new(mailbox inputs, mailbox outputs, event out_mon_finished);
        this.inputs = inputs;
        this.outputs = outputs;
        this.gm = new;
        this.out_mon_finished = out_mon_finished;
    endfunction 

    task run;
        num_of_fails =0;
        forever begin
            expected = new;
            inputs.get(sampled_in);
            outputs.get(sampled_out);
            gm.create_expected(sampled_in,expected);
            compare;
            //debug;
            ->finished_test;
        end
    endtask

    task wait_for_finish;
        @(out_mon_finished);
        @(finished_test);
    endtask

    task debug(string fail);
        num_of_fails = num_of_fails +1;
        assert(sampled_in.test_number == sampled_out.test_number); //tests for proper sync between monitors
        $display("[CHECKER]\tTEST FAILED reason: ",fail);
        $display("[CHECKER]\ttest number            : %d",sampled_in.test_number);
        $display("[CHECKER]\tSAMPLED INPUT:");
        $display("[CHECKER]\tcontrol                : %d",sampled_in.ctrl);
        $display("[CHECKER]\tcodeword_width         : %d",sampled_in.codeword_width);
        $display("[CHECKER]\tdata_in                : %b",sampled_in.data_in);
        $display("[CHECKER]\tnoise                  : %b",sampled_in.noise);
        $display("[CHECKER]\tSAMPLED OUTPUT:");
        $display("[CHECKER]\tdata_out               : %b",sampled_out.data_out);
        $display("[CHECKER]\tnum_of_errors          : %d",sampled_out.num_of_errors);
        $display("[CHECKER]\tEXPECTED:");
        $display("[CHECKER]\tdata_out               : %b",expected.data_out);
        $display("[CHECKER]\tnum_of_errors          : %d",expected.num_of_errors);
        $display("[CHECKER]\tnumber of failed tests until now: %d", num_of_fails);
        $display("-------------------------------------------------------");
    
    endtask

    // task compare(out_trans sampled_out, expected, apb_trans sampled_in);
    //     if (sampled_in.ctrl != 0) begin // if we are in full channel or decode only
    //         assert (expected.num_of_errors == sampled_out.num_of_errors);
    //         if (expected.num_of_errors != 2) begin
    //             assert (expected.data_out == sampled_out.data_out); // we only care about data_out value if num of errors is <2
    //         end 
    //     end else begin // we are in encode mode, we dont care about num_of_errors
    //         assert (expected.data_out == sampled_out.data_out);
    //     end
    // endtask

    task compare;
        if (sampled_in.ctrl != 0) begin // if we are in full channel or decode only
            if (expected.num_of_errors != sampled_out.num_of_errors) debug("num_of_errors");

            if (expected.num_of_errors < 2) begin // we only care about data_out value if num_of_errors is <2
                if (expected.data_out != sampled_out.data_out) debug("data_out");
            end 
        end else begin // we are in encode mode, we dont care about num_of_errors
            if(expected.data_out != sampled_out.data_out) debug("data_out");
        end
    endtask



endclass //checker