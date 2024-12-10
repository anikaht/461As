module testbench;
    reg a, b, sel; // Inputs
    wire out;      // Output

    // Instantiate UDP
    mux_2to1 uut (out, a, b, sel);

    initial begin
        $monitor("Time=%0d: a=%b, b=%b, sel=%b, out=%b", $time, a, b, sel, out);

        // Test Cases
        a = 0; b = 1; sel = 0; #5;  // Select a
        a = 1; b = 0; sel = 1; #5;  // Select b
        a = 0; b = 1; sel = 1; #5;  // Select b
        a = 1; b = 0; sel = 0; #5;  // Select a
        a = 1; b = 1; sel = 1'bx; #5; // Undefined select
        a = 0; b = 0; sel = 1'bz; #5; // Undefined select

        $finish;
    end
endmodule
 
