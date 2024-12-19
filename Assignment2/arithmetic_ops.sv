module arithmetic_ops;
    reg [3:0] a;             // Unsigned 4-bit
    reg signed [4:0] b;      // Signed 5-bit
    reg signed [6:0] sum, diff, prod, mod;  // Wider bit-width for results

    initial begin
        // Input values
        a = 4'b1111;                  // 15 (unsigned)
        b = -5'sb00010;               // -2 (signed)

        // Perform arithmetic with explicit casting
        sum = $signed({1'b0, a}) + b;  // Cast a as signed by zero-extending
        diff = $signed({1'b0, a}) - b;
        prod = $signed({1'b0, a}) * b;
        mod = $signed({1'b0, a}) % b;

        // Display results in decimal and binary
        $display("Inputs:");
        $display("a = %0d (binary: %b), b = %0d (binary: %b)", $signed({1'b0, a}), {1'b0, a}, b, b);
        $display("\nOutputs:");
        $display("Sum  = %0d (binary: %b)", sum, sum);
        $display("Diff = %0d (binary: %b)", diff, diff);
        $display("Prod = %0d (binary: %b)", prod, prod);
        $display("Mod  = %0d (binary: %b)", mod, mod);
    end
endmodule
