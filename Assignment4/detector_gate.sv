module detector_gate(input [7:0] data_in, output zeroflag, oneflag);
    wire [7:0] not_data;  // Inverted input
    
    // Invert the input for zeroflag detection
    not u1 (not_data[0], data_in[0]);
    not u2 (not_data[1], data_in[1]);
    not u3 (not_data[2], data_in[2]);
    not u4 (not_data[3], data_in[3]);
    not u5 (not_data[4], data_in[4]);
    not u6 (not_data[5], data_in[5]);
    not u7 (not_data[6], data_in[6]);
    not u8 (not_data[7], data_in[7]);
    
    // AND all bits for zeroflag
    and g1 (zeroflag, not_data[0], not_data[1], not_data[2], not_data[3], 
                    not_data[4], not_data[5], not_data[6], not_data[7]);
    
    // AND all bits for oneflag
    and g2 (oneflag, data_in[0], data_in[1], data_in[2], data_in[3], 
                    data_in[4], data_in[5], data_in[6], data_in[7]);
endmodule

module detector_8bit(input [7:0] data_in, output reg zeroflag, oneflag);
    always @(*) begin
        zeroflag = (data_in == 8'b00000000);  // Check if all bits are 0
        oneflag  = (data_in == 8'b11111111);  // Check if all bits are 1
    end
endmodule