module signedNumber;
    reg [31:0] a; // 32-bit register to hold hexadecimal values

    initial begin
        a = 14'h1234; // Assign a 14-bit value
        $display("Current Value of a = %h", a);

        a = 14'h1234; // Reassign the same value
        $display("Current Value of a = %h", a);

        a = 32'hDEAD_BEEF; // Assign a 32-bit value
        $display("Current Value of a = %h", a);

        a = 32'hDEAD_BEEF; // Reassign the same value
        $display("Current Value of a = %h", a);

        #10 $finish; // End simulation
    end
endmodule
