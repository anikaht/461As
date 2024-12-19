// Multiplexer Module (fourOneMux)
module fourOneMux(
    input i0_i,    // Input 0
    input i1_i,    // Input 1
    input i2_i,    // Input 2
    input i3_i,    // Input 3
    input s0_i,    // Select line 0
    input s1_i,    // Select line 1
    output out_o   // Output
);

    // Internal wires
    wire not_s0, not_s1;
    wire y0, y1, y2, y3;

    // Generate inverted select lines
    not u1(not_s0, s0_i);
    not u2(not_s1, s1_i);

    // AND gates for each input
    and g0(y0, i0_i, not_s1, not_s0);  // y0 = i0 & ~s1 & ~s0
    and g1(y1, i1_i, not_s1, s0_i);   // y1 = i1 & ~s1 & s0
    and g2(y2, i2_i, s1_i, not_s0);   // y2 = i2 & s1 & ~s0
    and g3(y3, i3_i, s1_i, s0_i);     // y3 = i3 & s1 & s0

    // OR gate to combine outputs
    or g4(out_o, y0, y1, y2, y3);     // out_o = y0 | y1 | y2 | y3

endmodule
