module compareDisplayWriteMonitor;
    reg [3:0] a, b;

    initial begin
        // Demonstration of $display
        $display("=== Demonstration of $display ===");
        $display("At Time = %0t, a = %0d, b = %0d", $time, a, b);
        
        // Demonstration of $write
        $display("\n=== Demonstration of $write ===");
        $write("At Time = %0t, a = %0d", $time, a);
        $write(", b = %0d", b); // Note: No newline until explicitly added
        $display("\nAdding a newline manually after $write");

        // Demonstration of $monitor
        $display("\n=== Demonstration of $monitor ===");
        $monitor("At Time = %0t, a = %0d, b = %0d", $time, a, b);

        // Test Values: Change a and b over time
        a = 0; b = 0; #5;  // Time = 5
        a = 1; b = 2; #5;  // Time = 10
        a = 2; b = 3; #5;  // Time = 15
        a = 3; b = 4; #5;  // Time = 20
        a = 4; b = 5; #5;  // Time = 25

        #10 $finish; // End simulation
    end
endmodule
