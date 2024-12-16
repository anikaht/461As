`timescale 1ns/1ps

module tb_frequencyDividerBy7;

    // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire clk_out;

    // Instantiate the Frequency Divider module
    frequencyDividerBy7 uut (
        .clk(clk),
        .rst(rst),
        .clk_out(clk_out)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 10ns clock period for the input clock

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;  // Apply reset
        #10 rst = 0;  // Release reset after 10ns

        // Observe the output for multiple cycles
        #500;  // Allow simulation to run for 500ns

        $finish;  // End simulation
    end

    // Monitor signals
    initial begin
        $monitor("Time: %0d, Input Clock: %b, Output Clock: %b", $time, clk, clk_out);
    end

endmodule
