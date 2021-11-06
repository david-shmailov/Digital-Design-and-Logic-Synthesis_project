module  Decoder (
                input   rst,
                        clk,
                        data_in,
                        
                output  data_out,
                        valid
            );

        parameter       DATA_WIDTH = 32;

        wire                            clk;
        wire                            rst;
        reg     [(DATA_WIDTH)/2-1:0]    data_out;      
        reg                             valid;

        wire    [7:0][3:0]    H_matrix_1;
        wire    [15:0][4:0]   H_matrix_2;
        wire    [31:0][5:0]   H_matrix_3;
            
endmodule



module  Encoder (
                input   rst,
                        clk,
                        data_in,
                        
                output  data_out,
                        valid
            );

        parameter       DATA_WIDTH = 32;

        wire                            clk;
        wire                            rst;
        reg     [(DATA_WIDTH)-1:0]    data_out;      
        reg                             valid;

        wire    [7:0][3:0]    H_matrix_1;
        wire    [15:0][4:0]   H_matrix_2;
        wire    [31:0][5:0]   H_matrix_3;
            
endmodule