module testStrength2();
    reg ctrl, i1, i2;  // Inputs and control signal
    wire y;            // Output is a wire

    // Tristate buffers with strength modifiers
    bufif0 (strong1, weak0) g1 (y, i1, ctrl);
    bufif0 (strong1, weak0) g2 (y, i2, ctrl);

    initial begin
        ctrl = 1'bx;  // Control is unknown
        i1 = 0;       // First input is 0
        i2 = 1;       // Second input is 1
        #1;           // Allow signals to resolve
        $display("y = %b, ctrl = %b, i1 = %b, i2 = %b", y, ctrl, i1, i2);
    end
endmodule
