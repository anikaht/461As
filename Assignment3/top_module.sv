module top_module(input A, B, C, D, output out);
    wire or_out1, not_out1, mux1_out, or_out2, not_out2, not_out3;

    // First Layer Gates
    assign or_out1 = A | B;        // OR Gate 1 (Td = 5)
    assign not_out1 = ~C;          // NOT Gate 1 (Td = 3)

    // First MUX
    mux_2to1 mux1 (mux1_out, or_out1, not_out1, D); // Td = 8

    // Second Layer Gates
    assign or_out2 = mux1_out | mux1_out; // OR Gate 2 (Td = 5)
    assign not_out2 = ~mux1_out;          // NOT Gate 2 (Td = 3)

    // Third Layer NOT Gate
    assign not_out3 = ~D; // NOT Gate 3 for D inversion (Td = 3)

    // Second MUX
    mux_2to1 mux2 (out, or_out2, not_out2, not_out3); // Td = 8
endmodule

// Include the UDP definition 
primitive mux_2to1(out, a, b, sel);
    output out;
    input a, b, sel;

    table
        0  ?   0   : 0;  
        1  ?   0   : 1;  
        ?  0   1   : 0;  
        ?  1   1   : 1;  
        0  ?   x   : x;  
        1  ?   x   : x;  

    endtable
endprimitive

