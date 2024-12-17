module testInteger;
    wire pwrGood, pwrOn, pwrStable; // Wire declarations for signals

    // Explicit declarations
    integer i;       // 32-bit signed integer
    time t;          // 64-bit unsigned, behaves like a 64-bit reg
    real r;          // Real data type for floating-point numbers

    // Assign statements for wire signals
    assign pwrStable = 1'b1; // Constant 1 assigned to pwrStable
    assign pwrOn = 1;        // Equivalent to 1'b1
    assign pwrGood = pwrOn & pwrStable; // Logical AND operation

    initial begin
        // Assign values to integer, time, and real types
        i = 123;            // Integer value (fractional part ignored)
        r = 123456e3;       // Real value: Scientific notation (123456 * 10^3)
        t = 123456e3;       // Time value, rounded to the nearest integer (time is in simulation ticks)

        // Display values of i, t, and r
        $display("i=%0d, t=%0d, r=%f", i, t, r);

        // Display additional signal values and simulation time
        #2 $display("TIME=%0d, ON=%b, STABLE=%b, GOOD=%b", $time, pwrOn, pwrStable, pwrGood);

        $finish; // End the simulation
    end
endmodule
