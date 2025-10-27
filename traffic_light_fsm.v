// Traffic Light Controller using Finite State Machine
// This module implements a traffic light controller with 4 states:
// 1. Green for North-South (30 seconds)
// 2. Yellow for North-South (5 seconds) 
// 3. Green for East-West (30 seconds)
// 4. Yellow for East-West (5 seconds)
//
// Inputs: clk (clock), reset
// Outputs: ns_red, ns_yellow, ns_green (North-South lights)
//          ew_red, ew_yellow, ew_green (East-West lights)

module traffic_light_fsm (
    input clk,
    input reset,
    output reg ns_red,
    output reg ns_yellow,
    output reg ns_green,
    output reg ew_red,
    output reg ew_yellow,
    output reg ew_green
);

    // Define states for the FSM
    parameter IDLE = 2'b00;
    parameter NS_GREEN = 2'b01;
    parameter NS_YELLOW = 2'b10;
    parameter EW_GREEN = 2'b11;
    
    // Counter for timing (assuming 1 second per clock cycle)
    // If using a higher frequency clock, adjust the counter accordingly
    parameter NS_GREEN_TIME = 30;  // 30 seconds for NS green
    parameter YELLOW_TIME = 5;     // 5 seconds for yellow
    parameter EW_GREEN_TIME = 30;  // 30 seconds for EW green
    
    reg [5:0] counter;  // Counter up to 35 seconds max
    reg [1:0] current_state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
            counter <= 6'd0;
        end
        else begin
            current_state <= next_state;
            case (next_state)
                IDLE: counter <= 6'd0;
                NS_GREEN: 
                    if (counter < NS_GREEN_TIME)
                        counter <= counter + 1;
                    else
                        counter <= 6'd0;
                NS_YELLOW:
                    if (counter < YELLOW_TIME)
                        counter <= counter + 1;
                    else
                        counter <= 6'd0;
                EW_GREEN:
                    if (counter < EW_GREEN_TIME)
                        counter <= counter + 1;
                    else
                        counter <= 6'd0;
                default: counter <= counter + 1;
            endcase
        end
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            IDLE: next_state = NS_GREEN;
            NS_GREEN: 
                if (counter >= NS_GREEN_TIME)
                    next_state = NS_YELLOW;
                else
                    next_state = NS_GREEN;
            NS_YELLOW:
                if (counter >= YELLOW_TIME)
                    next_state = EW_GREEN;
                else
                    next_state = NS_YELLOW;
            EW_GREEN:
                if (counter >= EW_GREEN_TIME)
                    next_state = NS_GREEN;  // Cycle back to NS_GREEN
                else
                    next_state = EW_GREEN;
            default: next_state = IDLE;
        endcase
    end

    // Output logic - determine light states based on current state
    always @(*) begin
        // Default: all lights off
        ns_red = 1'b0;
        ns_yellow = 1'b0;
        ns_green = 1'b0;
        ew_red = 1'b0;
        ew_yellow = 1'b0;
        ew_green = 1'b0;
        
        case (current_state)
            IDLE: begin
                ns_red = 1'b1;  // Initially red for safety
                ew_red = 1'b1;
            end
            NS_GREEN: begin
                ns_green = 1'b1;
                ew_red = 1'b1;
            end
            NS_YELLOW: begin
                ns_yellow = 1'b1;
                ew_red = 1'b1;
            end
            EW_GREEN: begin
                ns_red = 1'b1;
                ew_green = 1'b1;
            end
        endcase
    end

endmodule