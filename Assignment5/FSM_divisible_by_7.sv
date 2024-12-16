module FSM_divisible_by_7 (
    input clk,
    input rst,
    input data_in,
    output reg flag
);
    reg [2:0] remainder;        // Current remainder
    wire [2:0] next_remainder;  // Next remainder (combinational logic)

    // Combinational logic for next remainder
    assign next_remainder = (remainder * 2 + data_in) % 7;

    // Sequential logic for remainder and flag update
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            remainder <= 3'b000;  // Reset remainder
            flag <= 0;            // Reset flag
        end else begin
            remainder <= next_remainder;     // Update remainder
            flag <= (next_remainder == 3'b0); // Flag = 1 if next remainder is 0
        end
    end
endmodule
