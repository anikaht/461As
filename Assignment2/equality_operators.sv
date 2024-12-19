module equality_operators;
    reg [3:0] a, b;

    initial begin
        // Example 1: a = 4'b01xz, b = 4'bzx10
        a = 4'b01xz; b = 4'bzx10;
        $display("Example 1: a = %b, b = %b", a, b);
        $display("(a === b) = %b", (a === b));  // Case equality
        $display("(a !== b) = %b", (a !== b));  // Case inequality
        $display("(a == b)  = %b", (a == b));   // Logical equality
        $display("(a != b)  = %b", (a != b));   // Logical inequality
        // Example 2: a = 4'b01zz, b = 4'b0100
        a = 4'b01zz; b = 4'b0100;
        $display("\nExample 2: a = %b, b = %b", a, b);
        $display("(a === b) = %b", (a === b));
        $display("(a !== b) = %b", (a !== b));
        $display("(a == b)  = %b", (a == b));
        $display("(a != b)  = %b", (a != b));
        // Example 3: a = 4'b01xz, b = 4'b01xz
        a = 4'b01xz; b = 4'b01xz;
        $display("\nExample 3: a = %b, b = %b", a, b);
        $display("(a === b) = %b", (a === b));
        $display("(a !== b) = %b", (a !== b));
        $display("(a == b)  = %b", (a == b));
        $display("(a != b)  = %b", (a != b));
        // Example 4: a = 4'b01zz, b = 4'b01zz
        a = 4'b01zz; b = 4'b01zz;
        $display("\nExample 4: a = %b, b = %b", a, b);
        $display("(a === b) = %b", (a === b));
        $display("(a !== b) = %b", (a !== b));
        $display("(a == b)  = %b", (a == b));
        $display("(a != b)  = %b", (a != b));
    end
endmodule
