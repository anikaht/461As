module nor_gate (
    input A,      // Input A
    input B,      // Input B
    output Out    // Output of NOR gate
);

    // Internal wires
    wire w_pmos, w_nmos;

    // PMOS devices
    pmos p1(w_pmos, 1'b1, A);  // PMOS with source connected to Vdd
    pmos p2(Out, w_pmos, B);   // PMOS with intermediate wire

    // NMOS devices
    nmos n1(Out, 1'b0, A);     // NMOS with source connected to GND
    nmos n2(Out, 1'b0, B);     // NMOS with source connected to GND

endmodule
