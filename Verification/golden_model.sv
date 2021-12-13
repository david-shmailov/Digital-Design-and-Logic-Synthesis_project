class golden_model;
    parameter       AMBA_WORD = 32;
    parameter       AMBA_ADDR_WIDTH = 20;
    parameter       DATA_WIDTH = 32;

    bit [3:0][7:0]  H1 = 32'b11111111111001001101001010110001;
    bit [4:0][15:0] H2 = 80'b11111111111111111111111000001000111100011100010011001101101000101010101101100001;
    bit [5:0][31:0] H3 = 192'b111111111111111111111111111111111111111111111110000000000001000011111111000000011111110000001000111100001111000111100011100001001100110011001101100110110100001010101010101010110101011011000001;


    function new;
        
        
    endfunction

    task create_expected(in_trans trans);
        //out_trans expected = new;
        if (encoder_only) begin
            // add encode function
        end else if (decoder_only) begin
            // add decode function
        end else if (full_channel) begin
            if (noise is 2 mistakes) begin
                //num of errors is 2
                //output the same data
            end else if (noise < 2) begin
                //return the same output as input,
                //num of errors determined by noise.
            end
        end
    endtask


    task encode(in_trans trans);
        case (trans.codeword_width):
            0: encode_0(trans);
            1: encode_1
            2: encode_2
    endtask


    task encode_1(in_trans trans)
        out_trans expected = new;
        bit [7:0] data_out = {trans.data_in[3:0],4'b0};
        for (int row = 1; row <4 ; row++) begin
            data_out[3-row] = vector_mult(H1[row],data_out[7:4]);
        end
        data_out[3] = 
    




   