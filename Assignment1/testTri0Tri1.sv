module testTri0Tri1;
    tri0 wire0;    // tri0: defaults to 0 if no driver
    tri1 wire1;    // tri1: defaults to 1 if no driver

    reg driverA, driverB;  // Two drivers for the wires

    assign wire0 = driverA;  // Driver A for wire0
    assign wire1 = driverB;  // Driver B for wire1

    initial begin
        $monitor("Time=%0t | driverA=%b, wire0=%b | driverB=%b, wire1=%b", 
                 $time, driverA, wire0, driverB, wire1);

        // Assign 4 different values: 0, 1, X, Z
        driverA = 0; driverB = 0; #5;   // Step 1: Both 0
        driverA = 1; driverB = 1; #5;   // Step 2: Both 1
        driverA = 'x; driverB = 'x; #5; // Step 3: Both X
        driverA = 'z; driverB = 'z; #5; // Step 4: Both Z

        #5 $finish; // End simulation
    end
endmodule