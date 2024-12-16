module tb_PWM_duty_cycle;
    reg clk, rst, pwm_in;
    wire [7:0] duty_cycle;

    // Instantiate the module
    PWM_duty_cycle uut (
        .clk(clk),
        .rst(rst),
        .pwm_in(pwm_in),
        .duty_cycle(duty_cycle)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // 10ns clock period

    // Generate PWM signal
    initial begin
        rst = 1; pwm_in = 0; #20;  // Reset
        rst = 0;

        // PWM signal with varying duty cycles
        repeat (5) begin
            pwm_in = 1; #50;  // High for 50 time units (50% duty cycle)
            pwm_in = 0; #50;  // Low for 50 time units
        end

        repeat (5) begin
            pwm_in = 1; #30;  // High for 30 time units (30% duty cycle)
            pwm_in = 0; #70;  // Low for 70 time units
        end

        repeat (5) begin
            pwm_in = 1; #10;  // High for 10 time units (10% duty cycle)
            pwm_in = 0; #90;  // Low for 90 time units
        end

        #1000 $finish;
    end

    // Monitor output
    initial $monitor("Time: %0d, PWM In: %b, Duty Cycle: %0d%%", $time, pwm_in, duty_cycle);
endmodule
