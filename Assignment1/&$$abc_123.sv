module \&$$abc_123 ();
    initial begin
        $display("Escaped identifier works!");
        #10 $finish;
    end
endmodule
