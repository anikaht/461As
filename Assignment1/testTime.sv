module testTime;
    time t_var;        // Declare a 'time' variable
    real r_var;        // Declare a 'real' variable for $realtime

    initial begin
        $monitor("Time = %0t, t_var = %0d, r_var = %0f", $time, t_var, r_var);

        #0 t_var = $stime;  // Assign the simulation time using $stime
        #5 r_var = $realtime;  // Assign the simulation time using $realtime
        #10 t_var = $stime;  // Update t_var with $stime
        #15 r_var = $realtime; // Update r_var with $realtime

        #20 $finish; // End simulation
    end
endmodule
