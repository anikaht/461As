`timescale 1ns/1ps

module tb_CRC4Decoder;

    // Inputs
    reg clk;
    reg rst;
    reg [7:0] data_in;

    // Outputs
    wire [3:0] crc_out;

    // Instantiate the CRC4Decoder module
    CRC4Decoder uut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .crc_out(crc_out)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 10ns clock period

    // Test sequence
    initial begin
        // Apply reset
        rst = 1;
        data_in = 8'b0;
        #10 rst = 0;  // Release reset

        // Apply test inputs with delays for stabilization
        #20 data_in = 8'b11010101;
        #40 data_in = 8'b10101010;
        #40 data_in = 8'b11110000;

        // Allow time for observation
        #50;

        $finish;  // End simulation
    end

    // Monitor signals
    initial begin
        $monitor("Time: %0d, Data In: %b, CRC Out: %b", $time, data_in, crc_out);
    end

endmodule
