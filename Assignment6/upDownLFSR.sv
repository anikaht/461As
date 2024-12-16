`timescale 1ns/1ps

`define kBitW 6
`define kBitS `kBitW-1:0

module upDownLFSR(
    input clk,
    input rst,
    input en_i,       // Enable signal
    input upDown_i,   // Direction: 1 for up, 0 for down
    output reg [`kBitS] cnt_o,  // Current count value
    output reg bitStr_o         // Overflow bit
);

    reg [`kBitS] lfsr;  // LFSR register
    wire feedback;

    assign feedback = lfsr[5] ^ lfsr[3];  // Feedback taps for pseudo-randomness

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            lfsr <= 6'b1;    // Initialize LFSR to non-zero value
            cnt_o <= 6'b0;
            bitStr_o <= 1'b0;
        end else if (en_i) begin
            if (upDown_i) begin
                // Count up
                lfsr <= {lfsr[4:0], feedback};
            end else begin
                // Count down
                lfsr <= {feedback, lfsr[5:1]};
            end
            cnt_o <= lfsr;  // Output the current LFSR value
            bitStr_o <= lfsr[5];  // Overflow bit is the MSB
        end
    end
endmodule
