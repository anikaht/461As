module static_logic_gate(a_i, b_i, c_i, f_o);
    input a_i, b_i, c_i; // Inputs a, b, c
    output f_o;          // Output f
    wire or_out, and_out;

    // PMOS logic for OR gate: a + b
    assign or_out = a_i | b_i;

    // NMOS logic for AND gate: (a + b) · c
    assign and_out = or_out & c_i;

    // NOT gate: Final output is inverted
    assign f_o = ~and_out;
endmodule

