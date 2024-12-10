module testbench;
    reg A, B, C, D; // Inputs
    wire out;       // Output

    // Instantiate Top Module
    top_module uut (.A(A), .B(B), .C(C), .D(D), .out(out));

    initial begin
        $monitor("Time=%0d: A=%b, B=%b, C=%b, D=%b, out=%b", $time, A, B, C, D, out);

        // Test Cases
        A = 0; B = 0; C = 0; D = 0; #10;
        A = 1; B = 0; C = 1; D = 1; #10;
        A = 0; B = 1; C = 1; D = 0; #10;
        A = 1; B = 1; C = 0; D = 1; #10;
        $finish;
    end
endmodule
