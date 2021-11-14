module ENC #(
    parameters //TBD
) (
    input   rst,
            clk,
            data_in,
            mod,
    output  data_out)
);
    wire rst,clk;
    wire [3:0] data_in;
    reg  [7:0] data_out;
    wire [1:0] mod;
    reg  [7:0] c_vector_stage1;
    //reg  [7:0] c_vector_stage2;

    wire  [7:0] c_vector_stage1_wire;
    wire  [7:0] c_vector_stage2_wire;
 
    


    wire [7:0][3:0] H_matrix_1      = 32'hffe4_d2b1;
    wire [3:0][3:0] right_side_H_1  = 16'hd2b1;
    wire [3:0][3:0] left_side_H_1   = 16'hffe4;
    
    // Stage 1: computing all values of C except c[3] (C5 in the pdf)
    
    ENC_STAGE_1 s1  (
                    .clk(clk),
                    .rst(rst),
                    .data_in(data_in),
                    .mod(mod),
                    .data_out(c_vector_stage1)
    )

    // Stage 2: computing c[3] (C5 in the pdf) based on all other C values

    ENC_STAGE_2 s2  (
                    .clk(clk),
                    .rst(rst),
                    .data_in(c_vector_stage1),
                    .mod(mod),
                    .data_out(data_out)
    )


    // in the following case all values of H_matrix_1[3] should be 1 with the given matricies.
    always_comb begin : stage_2_comb
        for(k = 0 k<7; k= k+1)begin
            //c_vector_stage2_wire[3] = c_vector_stage2_wire[3] xor (H_matrix_1[3][k] and c_vector_stage1[k]);
            c_vector_stage2_wire[3] = c_vector_stage2_wire[3] xor c_vector_stage1[k];
        end
    end


endmodule
