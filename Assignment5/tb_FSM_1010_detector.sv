module tb_FSM_1010_detector;
    reg clk, rst, data_in;
    wire flag;

    // Instantiate the FSM
    FSM_1010_detector uut (.clk(clk), .rst(rst), .data_in(data_in), .flag(flag));

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        rst = 1; data_in = 0;
        #10 rst = 0;

        // Input sequence: 10101011010
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 0; // Detects "1010", flag should go high
        #10 data_in = 1;
        #10 data_in = 0;
        #10 data_in = 1;
        #10 data_in = 0;

        #50 $finish;
    end

    initial $monitor("Time: %0d, Input: %b, Flag: %b", $time, data_in, flag);
endmodule
