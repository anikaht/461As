`timescale 10ns/100ps

module testTimescale;
    real real_delay; // Declare a real variable for calculated delay
    integer time_units; // Integer value for equivalent time units

    initial begin
        $display("Time at Start = %0t", $time);

        // Calculate delay in integer time units (rounded)
        real_delay = 2.71828 * 10; // 10ns per time unit
        time_units = real_delay + 0.5; // Round to the nearest integer

        #time_units; // Apply the rounded delay
        $display("Time after Delay = %0t", $time);

        // Display calculated real delay for comparison
        $display("Calculated Real Delay = %0.4f ns", real_delay);
        $display("Rounded Delay Applied = %0d time units", time_units);

        $finish;
    end
endmodule
