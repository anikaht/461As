module conditional_expr;
    reg [3:0] A;
    reg [1:0] B1;
    reg [2:0] B2;

    initial begin
        // Case 1: B = 2'b1x
        B1 = 2'b1x;
        A = B1 ? 4'b1100 : 5'b11ZX0;  // Truncate 5'b11ZX0 to 4 bits
        $display("Case 1: B = %b, A = %b", B1, A);

        // Case 2: B = 3'b1xz
        B2 = 3'b1xz;
        A = B2 ? 4'b1100 : 5'b11ZX0;  // Truncate 5'b11ZX0 to 4 bits
        $display("Case 2: B = %b, A = %b", B2, A);
    end
endmodule
