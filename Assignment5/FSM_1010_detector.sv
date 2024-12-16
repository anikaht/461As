module FSM_1010_detector(
    input clk,
    input rst,
    input data_in,
    output reg flag
);
    // State encoding
    parameter S0 = 3'b000, 
              S1 = 3'b001, 
              S2 = 3'b010, 
              S3 = 3'b011, 
              S4 = 3'b100;

    reg [2:0] current_state, next_state;

    // State transition logic
    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= S0;  // Reset to initial state
        else
            current_state <= next_state;  // Move to the next state
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            S0: next_state = (data_in) ? S1 : S0;
            S1: next_state = (data_in) ? S1 : S2;
            S2: next_state = (data_in) ? S3 : S0;
            S3: next_state = (data_in) ? S1 : S4;
            S4: next_state = (data_in) ? S1 : S0;
            default: next_state = S0;
        endcase
    end

    // Output logic: Flag is combinational when transitioning to S4
    always @(*) begin
        flag = (current_state == S3 && !data_in);  // Detecting transition into S4
    end
endmodule
