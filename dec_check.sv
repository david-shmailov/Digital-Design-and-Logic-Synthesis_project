module DEC_CHK #(
    parameter   MAX_CODEWORD_WIDTH = 32;
    parameter   MAX_INFO_WIDTH=26;
) (
    input   rst,
            clk,
            data_in,
            mod,
    output  data_out,
            num_of_errors
);
    localparam info_mod_1 = 4;
    localparam info_mod_2 = 11;
    localparam info_mod_3 = 26;
    localparam parity_mod_1 = 4;
    localparam parity_mod_2 = 5;
    localparam parity_mod_3 = 6;
    localparam full_length_mod_1 = info_mod_1 + parity_mod_1;
    localparam full_length_mod_2 = info_mod_2 + parity_mod_2;
    localparam full_length_mod_3 = info_mod_3 + parity_mod_3;
    
    localparam pad_zero_1 = MAX_CODEWORD_WIDTH - full_length_mod_1;
    localparam pad_zero_2 = MAX_CODEWORD_WIDTH - full_length_mod_2;
    localparam pad_zero_3 = MAX_CODEWORD_WIDTH - full_length_mod_3;

    wire    rst,clk;
    wire    [MAX_CODEWORD_WIDTH-1:0]    data_in;
    wire    [1:0]                       mod;
    reg     [MAX_CODEWORD_WIDTH-1:0]    data_out;
    reg     [1:0]                       num_of_errors;



    wire    [3:0][7:0]     H_matrix_1 = 32'hffe4_d2b1;
    wire    [4:0][15:0]    H_matrix_2 = 80'hffff_fe08_f1c4_cda2_ab61;
    wire    [5:0][31:0]    H_matrix_3 = 192'hffff_ffff_fffe_0010_ff01_fc08_f0f1_e384_cccd_9b42_aaab_56c1;

    reg     [full_length_mod_1-1:0]    correction_vector_mod_1;
    reg     [full_length_mod_2-1:0]    correction_vector_mod_2;
    reg     [full_length_mod_3-1:0]    correction_vector_mod_3;

    reg     [full_length_mod_1-1:0]    correction_vector_mod_1_sample;
    reg     [full_length_mod_2-1:0]    correction_vector_mod_2_sample;
    reg     [full_length_mod_3-1:0]    correction_vector_mod_3_sample;

    reg     [full_length_mod_1-1:0] temp1;
    reg     [full_length_mod_2-1:0] temp2; 
    reg     [full_length_mod_3-1:0] temp3;


    always_comb begin : compute_correction
        for (i=0;i<full_length_mod_1;i=i+1) begin
            correction_vector_mod_1[i] = H_matrix_1[3:0][i] ~^ data_in[full_length_mod_1-1:0]; // this checks if they are equal
        end
        for (i=0;i<full_length_mod_2;i=i+1) begin
            correction_vector_mod_2[i] = H_matrix_2[3:0][i] ~^ data_in[full_length_mod_2-1:0]; // this checks if they are equal
        end
        for (i=0;i<full_length_mod_3;i=i+1) begin
            correction_vector_mod_3[i] = H_matrix_3[3:0][i] ~^ data_in[full_length_mod_3-1:0]; // this checks if they are equal
        end
    end

    always_ff @( posedge clk ) begin : after_CV_compute
        if (rst) begin
            correction_vector_mod_1_sample <= full_length_mod_1{1'b0};
            correction_vector_mod_2_sample <= full_length_mod_2{1'b0};
            correction_vector_mod_3_sample <= full_length_mod_3{1'b0};
        end else begin
            correction_vector_mod_1_sample <= correction_vector_mod_1;
            correction_vector_mod_2_sample <= correction_vector_mod_2;
            correction_vector_mod_3_sample <= correction_vector_mod_3;
        end
    end
    always_ff @( posedge clk ) begin


        //this should OR all bits of the vector to see if there is atleast 1
        if (|data_in) begin
            num_of_errors <= 2'b00;
        end else if (|correction_vector_mod_1_sample) begin
            num_of_errors <= 2'b01;
        end else begin
            num_of_errors <= 2'b10;
        end
        data_out < data_in ^ correction_vector_mod_1_sample; //correct the data

    end
        

    





endmodule