module not_ops;
    reg [2:0] A; // Define A as 3-bit wide to accommodate all cases

    initial begin
        // Test cases
        A = 1'bx;    $display("A = %b, !A = %b", A, !A); // A = 1'bx
        A = 1'bz;    $display("A = %b, !A = %b", A, !A); // A = 1'bz
        A = 2'b1z;   $display("A = %b, !A = %b", A, !A); // A = 2'b1z
        A = 2'b0z;   $display("A = %b, !A = %b", A, !A); // A = 2'b0z
        A = 2'bxz;   $display("A = %b, !A = %b", A, !A); // A = 2'bxz
        A = 3'bxxx;  $display("A = %b, !A = %b", A, !A); // A = 3'bxxx
        A = 3'b1xx;  $display("A = %b, !A = %b", A, !A); // A = 3'b1xx
        A = 3'b0xx;  $display("A = %b, !A = %b", A, !A); // A = 3'b0xx
    end
endmodule