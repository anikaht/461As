module frequencyDividerBy7(
    input clk,       // Input clock
    input rst,       // Reset signal
    output reg clk_out  // Divided clock output
);

    reg [2:0] counter;  // 3-bit counter to count up to 7

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 3'b0;
            clk_out <= 0;
        end else begin
            if (counter == 3'b110) begin  // Counter reaches 6 (7 cycles)
                counter <= 3'b0;         // Reset counter
                clk_out <= ~clk_out;     // Toggle output clock
            end else begin
                counter <= counter + 1;  // Increment counter
            end
        end
    end
endmodule
