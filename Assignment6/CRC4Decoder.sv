`timescale 1ns/1ps

module CRC4Decoder(
    input clk,
    input rst,
    input [7:0] data_in,
    output reg [3:0] crc_out
);

    reg [7:0] shift_reg;           // Shift register to process data
    reg [4:0] polynomial = 5'b10011;  // CRC-4 polynomial (5 bits)
    integer i;
    reg processing;               // Flag to indicate computation is in progress

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= 8'b0;      // Reset the shift register
            crc_out <= 4'b0;       // Reset CRC output
            processing <= 0;       // Ensure processing flag is reset
        end else if (!processing) begin
            shift_reg = data_in;   // Load input data into the shift register
            processing = 1;        // Set processing flag
            // Perform polynomial division for 8 bits
            for (i = 0; i < 8; i = i + 1) begin
                if (shift_reg[7]) begin
                    // XOR the polynomial when MSB is 1
                    shift_reg = (shift_reg << 1) ^ polynomial;
                end else begin
                    // Otherwise, just shift left
                    shift_reg = shift_reg << 1;
                end
            end
            crc_out = shift_reg[7:4];  // Extract the top 4 bits as CRC
            processing = 0;        // Reset processing flag when done
        end
    end
endmodule
