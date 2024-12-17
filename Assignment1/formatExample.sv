module formatExample;
    // Variable declarations
    reg [7:0] binary_val;  // 8-bit binary value
    reg [7:0] char_val;    // Character value (ASCII)
    integer dec_val;       // Decimal integer
    real exp_val;          // Real number for scientific notation
    real float_val;        // Floating-point number
    reg [15:0] hex_val;    // 16-bit hexadecimal value
    reg [7:0] oct_val;     // 8-bit octal value
    reg [7:0] str_val [0:5]; // String array
    time sim_time;         // Simulation time variable

    initial begin
        // Initialize values
        binary_val = 8'b10110101;  // Binary
        char_val = 8'd65;          // ASCII 'A'
        dec_val = -12345;          // Decimal value
        exp_val = 12345.678;       // Exponential notation
        float_val = 3.14159265;    // Floating-point number
        hex_val = 16'hDEAD;        // Hexadecimal
        oct_val = 8'o77;           // Octal value
        str_val[0] = "H";
        str_val[1] = "e";
        str_val[2] = "l";
        str_val[3] = "l";
        str_val[4] = "o";
        str_val[5] = "!";
        sim_time = 1234;           // Simulation time

        // Display values using different formats
        $display("=== Demonstration of Different Format Specifiers ===");
        $display("Binary Value (%%b): %b", binary_val);
        $display("Character Value (%%c): %c", char_val);
        $display("Decimal Value (%%d): %d", dec_val);
        $display("Decimal Value (%%0d): %0d", dec_val);
        $display("Exponential Notation (%%e): %e", exp_val);
        $display("Floating Point Value (%%f): %f", float_val);
        $display("Formatted Float (%%6.2f): %6.2f", float_val);
        $display("General Notation (%%g): %g", float_val);
        $display("Hexadecimal Value (%%h): %h", hex_val);
        $display("Octal Value (%%o): %o", oct_val);
        $display("String (%%s): %s%s%s%s%s%s", str_val[0], str_val[1], str_val[2], str_val[3], str_val[4], str_val[5]);
        $display("Simulation Time (%%t): %t", sim_time);
        $display("Zero-Padded Time (%%00t): %00t", sim_time);

        #10 $finish; // End simulation
    end
endmodule

