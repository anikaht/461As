module DFFRCN(output reg q, input d, clk, rst);
    always @(posedge clk or negedge rst) begin
        if (!rst)
            q <= 0;  // Reset the flip-flop
        else
            q <= d;  // Update q with d on the rising clock edge
    end
endmodule

module counter_3bit(input clk, rst, output [2:0] out);
    wire q0, q1, q2;        // Outputs of the flip-flops
    wire nand_out, xor1_out, xor2_out; // Intermediate signals
    wire not_out;           // Inverted reset signal

    // NOT Gate for reset
    assign not_out = ~rst;

    // Flip-flops
    DFFRCN dff0(q0, xor1_out, clk, not_out);
    DFFRCN dff1(q1, xor2_out, clk, not_out);
    DFFRCN dff2(q2, nand_out, clk, not_out);

    // Logic gates
    assign nand_out = ~(q1 & q2);  // NAND gate
    assign xor1_out = q0 ^ q1;     // XOR gate for flip-flop 0
    assign xor2_out = q1 ^ q2;     // XOR gate for flip-flop 1

    // Outputs
    assign out = {q2, q1, q0}; // Combine the flip-flop outputs
endmodule
