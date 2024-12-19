`include "nor_gate.v"
module nor_gate_tb;

    // Inputs and output
    reg A, B;        // Test inputs
    wire Out;        // NOR gate output

    // Instantiate the NOR gate
    nor_gate uut (
        .A(A),
        .B(B),
        .Out(Out)
    );

    // Testbench logic
    initial begin
        $display("A B | Out");
        $monitor("%b %b | %b", A, B, Out);

        // Apply test cases
        A = 0; B = 0; #10;  // NOR(0,0) = 1
        A = 0; B = 1; #10;  // NOR(0,1) = 0
        A = 1; B = 0; #10;  // NOR(1,0) = 0
        A = 1; B = 1; #10;  // NOR(1,1) = 0

        $finish;
    end

endmodule