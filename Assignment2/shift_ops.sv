module shift_ops;
    reg [3:0] A;
    reg [1:0] B;

    initial begin
        A = 4'b01xz;

        // Left shift with unknown amount
        $display("A << 1'bz = %b", A << 1'bz);

        // Right shift with unknown amount
        B = 2'bxx;
        $display("A >> B = %b", A >> B);
    end
endmodule
