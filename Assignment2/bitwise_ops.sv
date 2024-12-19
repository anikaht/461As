module bitwise_ops;
    reg [3:0] A, B;  // 4-bit registers
    reg [1:0] C;     // 2-bit register
    reg [3:0] extended_result; // Temporary variable for full-width results
    reg [1:0] truncated_result; // Temporary variable for truncated results

    initial begin
        // Inputs
        A = 4'b01xz;
        B = 4'bzx01;
        C = 2'bz1;

        // Perform bitwise operations and display results
        $display("~A = %b", ~A);                               // ~4'b01xz
        $display("A & B = %b", A & B);                         // 4'b01xz & 4'bzx01
        $display("A | B = %b", A | B);                         // 4'b01xz | 4'bzx01
        $display("A ^ B = %b", A ^ B);                         // 4'b01xz ^ 4'bzx01
        $display("A ^~ B = %b", A ^~ B);                       // 4'b01xz ^~ 4'bzx01

        // Compute extended and truncated results
        extended_result = A ^~ {2'b00, C};                     // Zero-extend C and perform XNOR
        truncated_result = extended_result[1:0];               // Truncate to 2 bits
        $display("A ^~ C (4-bit result) = %b", extended_result); // Full 4-bit result
        $display("A ^~ C (2-bit result) = %b", truncated_result); // Truncated 2-bit result
    end
endmodule
