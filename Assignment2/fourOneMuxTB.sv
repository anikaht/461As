`include "fourOneMux.sv"
// Testbench Module (fourOneMuxTB)
module fourOneMuxTB;

    // Declare inputs as regs and output as wire
    reg i0, i1, i2, i3;     // MUX inputs
    reg s0, s1;             // Select lines
    wire out;               // MUX output

    // Instantiate the multiplexer
    fourOneMux uut (
        .i0_i(i0),
        .i1_i(i1),
        .i2_i(i2),
        .i3_i(i3),
        .s0_i(s0),
        .s1_i(s1),
        .out_o(out)
    );

    // Testbench logic
    initial begin
        // Display header
        $display("s1 s0 | i3 i2 i1 i0 | out");

        // Apply test cases
        {i3, i2, i1, i0} = 4'b1000; {s1, s0} = 2'b00; #10; $display("%b  %b  |  %b  |  %b", s1, s0, {i3, i2, i1, i0}, out);
        {i3, i2, i1, i0} = 4'b1000; {s1, s0} = 2'b01; #10; $display("%b  %b  |  %b  |  %b", s1, s0, {i3, i2, i1, i0}, out);
        {i3, i2, i1, i0} = 4'b1000; {s1, s0} = 2'b10; #10; $display("%b  %b  |  %b  |  %b", s1, s0, {i3, i2, i1, i0}, out);
        {i3, i2, i1, i0} = 4'b1000; {s1, s0} = 2'b11; #10; $display("%b  %b  |  %b  |  %b", s1, s0, {i3, i2, i1, i0}, out);

        $finish;
    end
endmodule
