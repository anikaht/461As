module testbench;
    reg a_r; // Register for input a
    reg b_r; // Register for input b
    reg c_r; // Register for input c
    wire f_w; // Wire for output f

    // Instantiate the design module
    static_logic_gate u (
        .a_i(a_r),
        .b_i(b_r),
        .c_i(c_r),
        .f_o(f_w)
    );

    initial begin
        $monitor("Time=%0d: a=%b, b=%b, c=%b, f=%b", $time, a_r, b_r, c_r, f_w);

        // Test cases for all input combinations
        a_r = 1'b0; b_r = 1'b0; c_r = 1'b0; #5; // Case 1
        a_r = 1'b0; b_r = 1'b1; c_r = 1'b0; #5; // Case 2
        a_r = 1'b1; b_r = 1'b0; c_r = 1'b1; #5; // Case 3
        a_r = 1'b1; b_r = 1'b1; c_r = 1'b0; #5; // Case 4
        a_r = 1'b1; b_r = 1'b1; c_r = 1'b1; #5; // Case 5
        
        // Testing with undefined inputs
        a_r = 1'bx; b_r = 1'b1; c_r = 1'b0; #5; // Case 6
        a_r = 1'b0; b_r = 1'bz; c_r = 1'b1; #5; // Case 7
        a_r = 1'bx; b_r = 1'bz; c_r = 1'bz; #5; // Case 8

        $finish;
    end
endmodule

