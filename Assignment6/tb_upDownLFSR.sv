`timescale 1ns/1ps

module tb_upDownLFSR;

    // Inputs
    reg clk;
    reg rst;
    reg en_i;
    reg upDown_i;

    // Outputs
    wire [5:0] cnt_o;
    wire bitStr_o;

    // Instantiate the LFSR module
    upDownLFSR uut (
        .clk(clk),
        .rst(rst),
        .en_i(en_i),
        .upDown_i(upDown_i),
        .cnt_o(cnt_o),
        .bitStr_o(bitStr_o)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // Adjusted to 10ns clock period

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1; en_i = 0; upDown_i = 1;
        #10 rst = 0;  // Deassert reset

        // Enable counting and count up
        en_i = 1; upDown_i = 1;
        #50;

        // Change direction to count down
        upDown_i = 0;
        #50;

        // Disable counting
        en_i = 0;
        #50;

        $finish;  // End simulation cleanly
    end

    // Monitor signals
    initial begin
        $monitor("Time: %0d, Count: %b, Overflow: %b", $time, cnt_o, bitStr_o);
    end

endmodule
