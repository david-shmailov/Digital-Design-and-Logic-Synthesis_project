module ENC #(
    parameters //TBD
) (
    input   rst,
            clk,
            data_in,
    output  data_out)
);
    wire rst,clk;
    wire [3:0] data_in;
    reg  [7:0] data_out;

    reg  [7:0] c_vector_stage1;
    //reg  [7:0] c_vector_stage2;

    wire  [7:0] c_vector_stage1_wire;
    wire  [7:0] c_vector_stage2_wire;
 
    


    wire [7:0][3:0] H_matrix_1      = 32'hffe4_d2b1;
    wire [3:0][3:0] right_side_H_1  = 16'hd2b1;
    wire [3:0][3:0] left_side_H_1   = 16'hffe4;
    
    // Stage 1: computing all values of C except c[3] (C5 in the pdf)
    always_ff @( clk ) begin : stage_1_seq
        if (rst) begin
            c_vector_stage1 <= 8'b0;
        else
            c_vector_stage1 <= c_vector_stage1_wire;
        end
    end

    always_comb begin : stage_1_comb
        for(j=2;j>=0;j = j-1) begin
            for(k =0 k<4; k= k+1)begin
                c_vector_stage1_wire[j] = c_vector_stage1_wire[j] xor (left_side_H_1[j][k] and data_in[k]);
            end
        end
        c_vector_stage1_wire[3] = 1'b0;
        for(i=7; i>3; i=i-1) begin
            c_vector_stage1_wire[i] = data_in[i-4];
        end
    end

    // Stage 2: computing c[3] (C5 in the pdf) based on all other C values

    always_ff @( clk ) begin : stage_2_seq
        if (rst) begin
            data_out <= 8'b0;
        else
            data_out <= c_vector_stage2_wire;
        end
    end


    // in the following case all values of H_matrix_1[3] should be 1 with the given matricies.
    always_comb begin : stage_2_comb
        for(k = 0 k<7; k= k+1)begin
            //c_vector_stage2_wire[3] = c_vector_stage2_wire[3] xor (H_matrix_1[3][k] and c_vector_stage1[k]);
            c_vector_stage2_wire[3] = c_vector_stage2_wire[3] xor c_vector_stage1[k];
        end
    end


endmodule

// module vector_mult #(
//     parameter size = 4;
// ) (
//     input A,B,
//     output C
// );
//     logic [size-1:0] A;
//     logic [size-1:0] B;
//     logic  C;

//     logic sum = 0;

//     always_comb begin 
//         for (i = 0; i<size ;i= i+1 ) begin
//             sum = sum + A[i]*B[i]
//         end
//         C = sum;
//     end


// endmodule

// mod_name instance_name (.*);