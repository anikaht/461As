module testTri();
    tri myTri;
    reg driver1, driver2;
    
    assign myTri = driver1;
    assign myTri = driver2;
    
    initial begin
        driver1 = 1;
        driver2 = 1;
        #10 driver2 = 'bz;
        #10 $finish;
    end
endmodule
