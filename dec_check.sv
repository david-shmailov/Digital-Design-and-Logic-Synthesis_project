module DEC_CHK (
            rst,
            clk,
            data_in,
            s_vector,
            work_mod,
            data_out,
            num_of_errors
);  
    parameter   MAX_CODEWORD_WIDTH = 32;
    parameter   MAX_INFO_WIDTH=26;
    localparam  MAX_PARITY_WIDTH = MAX_CODEWORD_WIDTH - MAX_INFO_WIDTH ;
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

    input logic    rst,clk;
    input logic    [MAX_CODEWORD_WIDTH-1:0]     data_in;
    input logic    [MAX_PARITY_WIDTH-1:0]        s_vector;
    input logic    [1:0]                         work_mod;
    output logic    [MAX_CODEWORD_WIDTH-1:0]    data_out;
    output logic    [1:0]                       num_of_errors;



    // logic    [3:0][7:0]     H_matrix_1 = 32'hffe4_d2b1;
    // logic    [4:0][15:0]    H_matrix_2 = 80'hffff_fe08_f1c4_cda2_ab61;
    // logic    [5:0][31:0]    H_matrix_3 = 192'hffff_ffff_fffe_0010_ff01_fc08_f0f1_e384_cccd_9b42_aaab_56c1;

    logic   [MAX_PARITY_WIDTH-1:0][MAX_CODEWORD_WIDTH-1:0]     H_matrix_1 = 192'hFF_0000_00E4_0000_00D2_0000_00B1; // i assume MSB bits will be zero padded
    logic   [MAX_PARITY_WIDTH-1:0][MAX_CODEWORD_WIDTH-1:0]     H_matrix_2 = 192'hFFFF_0000_FE08_0000_F1C4_0000_CDA2_0000_AB61;
    logic   [MAX_PARITY_WIDTH-1:0][MAX_CODEWORD_WIDTH-1:0]     H_matrix_3 = 192'hFFFF_FFFF_FFFE_0010_FF01_FC08_F0F1_E384_CCCD_9B42_AAAB_56C1;

    // logic   [MAX_PARITY_WIDTH * MAX_CODEWORD_WIDTH-1:0]     H_matrix_1_T = 192'h3CE3_4B20_C289; // i assume MSB bits will be zero padded
    // logic   [MAX_PARITY_WIDTH * MAX_CODEWORD_WIDTH-1:0]     H_matrix_2_T = 192'h17_5954_D061_4491;
    // logic   [MAX_PARITY_WIDTH * MAX_CODEWORD_WIDTH-1:0]     H_matrix_3_T = 192'hFFEF_7CEF_AE78_DF6D_74CF_2C6F_BADB_2BAA_99E6_9638_30A2_48A1;
    
    logic     [MAX_CODEWORD_WIDTH-1:0]    correction_vector_mod_1, correction_vector_mod_2, correction_vector_mod_3;

    logic     [MAX_CODEWORD_WIDTH-1:0]    correction_vector_mod_1_sample, correction_vector_mod_2_sample, correction_vector_mod_3_sample;


    logic     reduced_data;
    logic     eq_to_col;
    logic     [MAX_CODEWORD_WIDTH-1:0]    temp_out;


    // assumption: unspecified bits are zero for correction_vector_mod_#
    always_comb begin : compute_correction
        for (int i=0;i<full_length_mod_1;i=i+1) begin // need to full work_mod 1 so it doesnt check equality with zero padding
            correction_vector_mod_1[i] = H_matrix_1[MAX_PARITY_WIDTH-1:0] ~^ s_vector; // this checks if they are equal (NXOR)
        end
        for (int i=0;i<full_length_mod_2;i=i+1) begin
            correction_vector_mod_2[i] = H_matrix_2[MAX_PARITY_WIDTH-1:0] ~^ s_vector; // this checks if they are equal
        end
        for (int i=0;i<full_length_mod_3;i=i+1) begin
            correction_vector_mod_3[i] = H_matrix_3[MAX_PARITY_WIDTH-1:0] ~^ s_vector; // this checks if they are equal
        end
    end

    always_ff @( posedge clk ) begin : after_CV_compute
        if (rst) begin
            correction_vector_mod_1_sample <= {MAX_CODEWORD_WIDTH{1'b0}};
            correction_vector_mod_2_sample <= {MAX_CODEWORD_WIDTH{1'b0}};
            correction_vector_mod_3_sample <= {MAX_CODEWORD_WIDTH{1'b0}};
        end else begin
            correction_vector_mod_1_sample <= correction_vector_mod_1;
            correction_vector_mod_2_sample <= correction_vector_mod_2;
            correction_vector_mod_3_sample <= correction_vector_mod_3;
        end
    end



    always_comb begin : reduce
        case(work_mod)
            2'b00   :   begin
                        eq_to_col = |correction_vector_mod_1_sample;
                        temp_out   = data_in ^ correction_vector_mod_1_sample; //correct the data (XOR)
            end
            2'b01   :   begin
                        eq_to_col = |correction_vector_mod_2_sample;
                        temp_out   = data_in ^ correction_vector_mod_2_sample; //correct the data
            end
            2'b10   :   begin
                        eq_to_col = |correction_vector_mod_3_sample;
                        temp_out   = data_in ^ correction_vector_mod_3_sample; //correct the data
            end
            default :   begin
                        eq_to_col = 1'b0;
                        temp_out   = data_in; 
            end
        endcase
    end

    
    always_ff @( posedge clk ) begin : DEC_outputs
        if (rst) begin
            num_of_errors <= 2'b00;
            data_out <= {MAX_CODEWORD_WIDTH{1'b0}};
        end 
        else begin //priority if is required here. do not change to case
            if (s_vector == {MAX_PARITY_WIDTH{1'b0}}) 
                num_of_errors <= 2'b00;
            else if (eq_to_col) 
                num_of_errors <= 2'b01;
            else if (!eq_to_col) 
                num_of_errors <= 2'b10;
            else
                num_of_errors <= 2'b11; //this is not a correct state of the machine.
            data_out <= temp_out;
        end

    end
        
endmodule