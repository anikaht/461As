module detector_8bit(input [7:0] data_in, output reg zeroflag, oneflag);
    always @(*) begin
        zeroflag = (data_in == 8'b00000000);  // Check if all bits are 0
        oneflag  = (data_in == 8'b11111111);  // Check if all bits are 1
    end
endmodule
