module helloWorld ();
    initial begin
        $display ("Hello World!!!\r");
        $display ("Hello World!!!\f");
        #10 $finish;
    end
endmodule
