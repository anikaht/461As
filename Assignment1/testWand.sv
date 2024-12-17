module testWand();
    wand X;        // Declare a wire AND (wand)
    reg A, B;      // Two drivers

    assign X = A;  // A drives the wire
    assign X = B;  // B drives the wire

    initial begin
        $monitor("%g X = %b A = %b B = %b", $time, X, A, B);
        #1 A = 0;   // Time 1: A = 0, B = undefined
        #1 B = 0;   // Time 2: A = 0, B = 0
        #1 A = 1;   // Time 3: A = 1, B = 0
        #1 A = 0;   // Time 4: A = 0, B = 0
        #1 B = 1;   // Time 5: A = 0, B = 1
        #1 A = 1;   // Time 6: A = 1, B = 1
        #1 A = 0;   // Time 7: A = 0, B = 1
        #1 $finish; // End simulation at time 8
    end
endmodule
