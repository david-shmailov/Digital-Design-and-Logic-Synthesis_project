`ifndef apb_trans
`define apb_trans
`include "transaction.sv"
`endif 

`ifndef out_trans
`define out_trans
`include "output_transaction.sv"
`endif

`ifndef golden_model
`define golden_model
`include "GoldModel.sv"
`endif

`ifndef in_monitor
`define in_monitor
`include "input_monitor.sv"
`endif

`ifndef out_monitor
`define out_monitor
`include "output_monitor.sv"
`endif

`ifndef stimulus
`define stimulus
`include "Stimulus.sv"
`endif

// `ifndef coverage
// `define coverage
// `include "Coverage.sv"
// `endif

`ifndef checker_chk
`define checker_chk
`include "Checker.sv"
`endif
