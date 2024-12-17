module testKeyword();
    reg wire;  // Using a keyword as a variable name
    initial begin
        wire = 1;
        $display("wire = %b", wire);
    end
endmodule
