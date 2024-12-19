module reduction_ops;
    reg [3:0] A;

    initial begin
        A = 4'b01xz;

        // Perform reduction operations and display results
        $display("&A = %b", &A);      // Reduction AND
        $display("~|A = %b", ~|A);    // Reduction NOR
        $display("^A = %b", ^A);      // Reduction XOR
        $display("~^A = %b", ~^A);    // Reduction XNOR
    end
endmodule
