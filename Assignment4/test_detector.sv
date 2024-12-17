module test_detector;
    reg [7:0] data_in;
    wire zeroflag, oneflag;

    detector_8bit rtl_design(.data_in(data_in), .zeroflag(zeroflag), .oneflag(oneflag));

    initial begin
        // Test cases
        data_in = 8'b00000000; #10;  // All 0s
        $display("Data: %b, ZeroFlag: %b, OneFlag: %b", data_in, zeroflag, oneflag);

        data_in = 8'b11111111; #10;  // All 1s
        $display("Data: %b, ZeroFlag: %b, OneFlag: %b", data_in, zeroflag, oneflag);

        data_in = 8'b10101010; #10;  // Mixed
        $display("Data: %b, ZeroFlag: %b, OneFlag: %b", data_in, zeroflag, oneflag);
    end
endmodule
