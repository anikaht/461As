module testStrength1();
    reg a, b;     // Declare inputs as registers
    wire y;       // Output is a wire to be driven by the buffers

    // Buffers with strength modifiers
    buf (strong1, weak0) g1 (y, a);
    buf (weak1, strong0) g2 (y, b);

    initial begin
        a = 1;  // Strong 1 from a
        b = 1;  // Weak 1 from b
        #1;     // Allow signals to resolve
        $display("y = %b, a = %b, b = %b", y, a, b);
    end
endmodule