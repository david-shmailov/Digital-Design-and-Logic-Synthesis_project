module TB_MAT_MULT;

    localparam    vector_length = 4;
    logic clk,rst;
    logic [vector_length-1:0]   mat_for_mult;
    logic [vector_length-1:0]   data_in;
    logic mult_result;
    MAT_MULT    #(  .A_ROWS(1),
                    .A_COLS(vector_length),
                    .B_COLS(1)) m1
                (.clk(clk),
                .rst(rst),
                .A_data_in(mat_for_mult), 
                .B_data_in(data_in),
                .C_data_out(mult_result));



    always #5 clk = ~clk;

    initial begin
        clk <= 0;
        rst <= 1;
        mat_for_mult    <= 'b0;
        data_in         <= 'b1;
        #20     rst <= 0;
        $display("mat_for_mult = %0b",mat_for_mult);
        $display("data_in = %0b",data_in);
        $display("mult_result = %0b",mult_result);
    end
    
endmodule