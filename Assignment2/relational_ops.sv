module relational_ops;
    reg [1:0] a; // 2-bit input
    reg [2:0] b; // 3-bit input

    initial begin
        // Case 1: a = 2'b1z, b = 3'b11z
        a = 2'b1z;
        b = 3'b11z;
        $display("Case 1: a=%b, b=%b", a, b);
        $display("a > b: %b, a >= b: %b, a < b: %b, a <= b: %b", (a > b), (a >= b), (a < b), (a <= b));

        // Case 2: a = 4'b01xz
        a = 4'b01xz;
        $display("Case 2: a=%b", a);
        $display("a > b: %b, a >= b: %b, a < b: %b, a <= b: %b", (a > b), (a >= b), (a < b), (a <= b));
    end
endmodule
