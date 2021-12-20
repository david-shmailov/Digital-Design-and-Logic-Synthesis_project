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
            ->finished_test;
        end
    endtask

    task wait_for_finish;
        @(out_mon_finished);
        @(finished_test);
    endtask

    task compare(out_trans sampled_out, expected, apb_trans sampled_in);
        if (sampled_in.ctrl != 0) begin // if we are in full channel or decode only
            assert (expected.num_of_errors == sampled_out.num_of_errors);
            if (expected.num_of_errors != 2) begin
                assert (expected.data_out == sampled_out.data_out); // we only care about data_out value if num of errors is <2
            end 
        end else begin // we are in encode mode, we dont care about num_of_errors
            assert (expected.data_out == sampled_out.data_out);
        end
    endtask
endclass //checker