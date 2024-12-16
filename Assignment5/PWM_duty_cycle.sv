module PWM_duty_cycle (
    input clk,           // High-frequency clock
    input rst,           // Reset signal
    input pwm_in,        // PWM signal input
    output reg [7:0] duty_cycle  // Duty cycle percentage
);

    reg [15:0] high_count, total_count;  // Counters for high and total time
    reg pwm_prev;       // To detect edges
    reg update_flag;    // Signal to update duty cycle
    reg first_period;   // Skip first period calculation

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            high_count <= 0;
            total_count <= 0;
            duty_cycle <= 0;
            pwm_prev <= 0;
            update_flag <= 0;
            first_period <= 1;  // Enable warm-up phase
        end else begin
            // Count total time and high time
            total_count <= total_count + 1;
            if (pwm_in) high_count <= high_count + 1;

            // Detect falling edge (end of PWM period)
            if (pwm_prev && ~pwm_in) begin
                if (!first_period && total_count > 0) begin
                    duty_cycle <= (high_count * 100) / total_count;  // Duty cycle calculation
                end
                first_period <= 0;  // Disable warm-up after first period

                // Reset counters for next period
                high_count <= 0;
                total_count <= 0;
            end

            pwm_prev <= pwm_in;  // Update previous state
        end
    end
endmodule
