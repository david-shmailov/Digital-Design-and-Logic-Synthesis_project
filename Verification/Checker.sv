`ifndef golden_model
`define golden_model
`include "GoldModel.sv"
`endif



class checker_chk;

    mailbox inputs;
    mailbox outputs;
    golden_model gm;
    event out_mon_finished;
    event finished_test;
    apb_trans sampled_in;
    out_trans expected;
    out_trans sampled_out;

    function new(mailbox inputs, mailbox outputs, event out_mon_finished);
        this.inputs = inputs;
        this.outputs = outputs;
        this.gm = new;
        this.out_mon_finished = out_mon_finished;
    endfunction 

    task run;
        forever begin
            expected = new;
            inputs.get(sampled_in);
            outputs.get(sampled_out);
            gm.create_expected(sampled_in,expected);
            compare(sampled_out,expected,sampled_in);
            if (sampled_out.data_out == 0)  debug(sampled_out,expected,sampled_in);
            ->finished_test;
        end
    endtask

    task wait_for_finish;
        @(out_mon_finished);
        @(finished_test);
    endtask

    task debug(out_trans sampled_out, expected, apb_trans sampled_in);
        $display("[CHECKER]\tdata_in                : %b",sampled_in.data_in);
        $display("[CHECKER]\tcontrol                : %d",sampled_in.ctrl);
        $display("[CHECKER]\tcodeword_width         : %d",sampled_in.codeword_width);
        $display("[CHECKER]\tsample data_out        : %b",sampled_out.data_out);
        $display("[CHECKER]\tsample num_of_errors   : %d",sampled_out.num_of_errors);
        $display("[CHECKER]\texpected data_out      : %b",expected.data_out);
        $display("[CHECKER]\texpected num_of_errors : %d",expected.num_of_errors);
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

    task compare(out_trans sampled_out, expected, apb_trans sampled_in);
        if (sampled_in.ctrl != 0) begin // if we are in full channel or decode only
            $display("Test num_of_errors result: %d",expected.num_of_errors == sampled_out.num_of_errors);
            if (expected.num_of_errors != 2) begin
                $display("Test data_out result: %d",expected.data_out == sampled_out.data_out); // we only care about data_out value if num of errors is <2
                //$display("test result: %b", expected.data_out == sampled_out.data_out);
            end 
        end else begin // we are in encode mode, we dont care about num_of_errors
            $display("Test data_out result: %d",expected.data_out == sampled_out.data_out);
        end
        $display("--------------------------------------------------------------");
    endtask



endclass //checker