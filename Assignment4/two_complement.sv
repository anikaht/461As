module two_complement(input [3:0] in, output [3:0] out);
    wire [3:0] inverted;
    wire carry;

    // Step 1: Invert all bits
    not g0(inverted[0], in[0]);
    not g1(inverted[1], in[1]);
    not g2(inverted[2], in[2]);
    not g3(inverted[3], in[3]);

    // Step 2: Add 1 to the inverted bits
    assign {carry, out} = inverted + 4'b0001;
endmodule