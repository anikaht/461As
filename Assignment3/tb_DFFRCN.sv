module testbench;
    reg clk, rst;      // Clock and reset inputs
    wire [2:0] out;    // 3-bit output of the counter

    // Instantiate the counter module
    counter_3bit uut (
        .clk(clk),
        .rst(rst),
        .out(out)
    );

    // Clock generation
    always #5 clk = ~clk;  // Toggle clock every 5 time units

    initial begin
        // Monitor the output
        $monitor("Time=%0d | clk=%b | rst=%b | out=%b", $time, clk, rst, out);

        // Initialize inputs
        clk = 0; rst = 1;

        // Test sequence
        #10 rst = 0;  // Release reset
        #50 rst = 1;  // Assert reset
        #10 rst = 0;  // Release reset again
        #100 $finish; // End simulation
    end
endmodule
