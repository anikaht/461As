module TestTrior;
    trior bus;           // Declare a wire with OR behavior (trior)
    reg Aout, Bout;      // Two data drivers
    reg EnableA, EnableB; // Enable signals for drivers

    // Drive 'bus' based on enable signals
    assign bus = EnableA ? Aout : 8'hz;  // Aout drives bus when EnableA = 1
    assign bus = EnableB ? Bout : 8'hz;  // Bout drives bus when EnableB = 1

    initial begin
        $monitor("time=%0g, bus=%b", $time, bus);
        EnableA = 1; EnableB = 1; Aout = 0; Bout = 0; // Both enabled, drivers set to 0
        #1 Aout = 1;          // Change Aout to 1
        #1 Bout = 1;          // Change Bout to 1
        #2 $finish;           // End simulation
    end
endmodule