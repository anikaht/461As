module testWireRetain();
    reg [1:0] flag;       // Control flag
    reg [7:0] last_data;  // Register to "retain" previous value
    wire [7:0] data;      // Output wire to simulate trireg behavior

    // Procedurally assign the data
    assign data = (flag == 1) ? 10 :
                  (flag == 3) ? 30 :
                  (flag == 2) ? 255 : last_data;

    initial begin
        $monitor("Time=%0t, flag=%d, data=%d", $time, flag, data);
        
        last_data = 8'bz; // Initialize last_data
        flag = 1;  #200;   // flag = 1 → data = 10
        last_data = data;  

        flag = 0;  #200;   // flag = 0 → data retains last value
        last_data = data;

        flag = 3;  #200;   // flag = 3 → data = 30
        last_data = data;

        flag = 0;  #200;   // flag = 0 → data retains last value
        last_data = data;

        flag = 2;  #200;   // flag = 2 → data = 255
        last_data = data;

        flag = 0;  #10;    // flag = 0 → data retains last value
        $finish;
    end
endmodule
