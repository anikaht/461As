module logical_ops;
    reg [1:0] a1, a2;
    reg [2:0] b1;
    reg [3:0] c1;

    initial begin
        // Test Case 1: 1'bx && 2'bxz
        a1 = 1'bx; b1 = 2'bxz;
        $display("Case 1: a1 = %b, b1 = %b, a1 && b1 = %b", a1, b1, (a1 && b1));

        // Test Case 2: 2'b0x || 1'bz
        a2 = 2'b0x; a1 = 1'bz;
        $display("Case 2: a2 = %b, a1 = %b, a2 || a1 = %b", a2, a1, (a2 || a1));

        // Test Case 3: 2'b00 && 2'b1z
        a2 = 2'b00; b1 = 2'b1z;
        $display("Case 3: a2 = %b, b1 = %b, a2 && b1 = %b", a2, b1, (a2 && b1));

        // Test Case 4: 2'b0z || 4'b01xz
        a2 = 2'b0z; c1 = 4'b01xz;
        $display("Case 4: a2 = %b, c1 = %b, a2 || c1 = %b", a2, c1, (a2 || c1));
    end
endmodule
