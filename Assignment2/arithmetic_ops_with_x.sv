module arithmetic_ops_with_x;
    reg [3:0] a;             // Unsigned 4-bit
    reg signed [4:0] b;      // Signed 5-bit
    reg signed [5:0] sum, diff, prod, mod; // 6 bits for operations to handle overflow

    initial begin
        // Inputs
        a = 4'b1111;         // 15 in unsigned
        b = -5'b01xz;        // -5'b01xz (contains unknowns)

        // Perform arithmetic operations
        sum = a + b;
        diff = a - b;
        prod = a * b;
        mod = a % b;

        // Display results
        $display("Inputs: a = %b (%0d), b = %b (%0d)", a, a, b, b);
        $display("Sum = %b (%0d)", sum, sum);
        $display("Diff = %b (%0d)", diff, diff);
        $display("Prod = %b (%0d)", prod, prod);
        $display("Mod = %b (%0d)", mod, mod);
    end
endmodule