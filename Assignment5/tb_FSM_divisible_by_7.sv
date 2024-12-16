module tb_FSM_divisible_by_7;
    reg clk, rst, data_in;
    wire flag;

    // Instantiate the FSM
    FSM_divisible_by_7 uut (
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .flag(flag)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 10ns clock period

    // Test sequence
    initial begin
        rst = 1; data_in = 0;
        #10 rst = 0;

        // Input sequence: bits representing numbers
        #10 data_in = 1;  // Input 1
        #10 data_in = 0;  // Input 10
        #10 data_in = 1;  // Input 101
        #10 data_in = 0;  // Input 1010
        #10 data_in = 1;  // Input 10101

        #50 $finish;
    end

    initial $monitor("Time: %0d, Input: %b, Remainder: %d, Flag: %b", $time, data_in, uut.remainder, flag);
endmodule
