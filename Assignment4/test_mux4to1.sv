module test_mux4to1;
    reg [3:0] data_in;
    reg [1:0] sel;
    wire out;

    mux4to1 uut(.data_in(data_in), .sel(sel), .out(out));

    initial begin
        data_in = 4'b1010;
        sel = 2'b00; #10;
        $display("Sel: %b, Output: %b", sel, out);

        sel = 2'b01; #10;
        $display("Sel: %b, Output: %b", sel, out);

        sel = 2'b10; #10;
        $display("Sel: %b, Output: %b", sel, out);

        sel = 2'b11; #10;
        $display("Sel: %b, Output: %b", sel, out);
    end
endmodule
