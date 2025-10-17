// Traffic Light Controller using Finite State Machine
// This module implements a traffic light controller with a 4-state FSM
// States: Green_NS (North-South), Yellow_NS, Green_EW (East-West), Yellow_EW
// The controller manages traffic lights for a simple intersection

module traffic_light_fsm (
    input wire clk,          // System clock
    input wire reset,        // Reset signal (active high)
    output reg [2:0] ns_light,  // North-South light (Red=3'b100, Yellow=3'b010, Green=3'b001)
    output reg [2:0] ew_light   // East-West light (Red=3'b100, Yellow=3'b010, Green=3'b001)
);

    // Define states for the FSM
    parameter S0_GREEN_NS = 3'b000;  // NS Green, EW Red
    parameter S1_YELLOW_NS = 3'b001; // NS Yellow, EW Red
    parameter S2_GREEN_EW = 3'b010;  // EW Green, NS Red
    parameter S3_YELLOW_EW = 3'b011; // EW Yellow, NS Red
    
    // Internal state register
    reg [2:0] current_state, next_state;
    
    // Timer for controlling light durations
    reg [23:0] counter;  // 24-bit counter for longer timing
    parameter NS_GREEN_TIME = 24'd5000000;   // 5 seconds at 1MHz clock
    parameter NS_YELLOW_TIME = 24'd1000000;  // 1 second at 1MHz clock
    parameter EW_GREEN_TIME = 24'd5000000;   // 5 seconds at 1MHz clock
    parameter EW_YELLOW_TIME = 24'd1000000;  // 1 second at 1MHz clock
    
    // State register: updates state on clock edge
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= S0_GREEN_NS;
            counter <= 24'd0;
        end
        else begin
            current_state <= next_state;
            if (next_state != current_state) begin
                // Reset counter when changing states
                counter <= 24'd0;
            end
            else begin
                // Increment counter while staying in the same state
                counter <= counter + 1;
            end
        end
    end
    
    // Next state logic: determines next state based on current state and timer
    always @(*) begin
        case (current_state)
            S0_GREEN_NS: 
                if (counter >= NS_GREEN_TIME)
                    next_state = S1_YELLOW_NS;
                else
                    next_state = S0_GREEN_NS;
                    
            S1_YELLOW_NS:
                if (counter >= NS_YELLOW_TIME)
                    next_state = S2_GREEN_EW;
                else
                    next_state = S1_YELLOW_NS;
                    
            S2_GREEN_EW:
                if (counter >= EW_GREEN_TIME)
                    next_state = S3_YELLOW_EW;
                else
                    next_state = S2_GREEN_EW;
                    
            S3_YELLOW_EW:
                if (counter >= EW_YELLOW_TIME)
                    next_state = S0_GREEN_NS;
                else
                    next_state = S3_YELLOW_EW;
                    
            default:
                next_state = S0_GREEN_NS;
        endcase
    end
    
    // Output logic: sets the traffic light colors based on current state
    always @(*) begin
        case (current_state)
            S0_GREEN_NS: begin
                ns_light = 3'b001;  // NS Green
                ew_light = 3'b100;  // EW Red
            end
            S1_YELLOW_NS: begin
                ns_light = 3'b010;  // NS Yellow
                ew_light = 3'b100;  // EW Red
            end
            S2_GREEN_EW: begin
                ns_light = 3'b100;  // NS Red
                ew_light = 3'b001;  // EW Green
            end
            S3_YELLOW_EW: begin
                ns_light = 3'b100;  // NS Red
                ew_light = 3'b010;  // EW Yellow
            end
            default: begin
                ns_light = 3'b100;  // NS Red (safe state)
                ew_light = 3'b100;  // EW Red (safe state)
            end
        endcase
    end

endmodule

// Testbench for the traffic light controller
module tb_traffic_light_fsm;
    reg clk;
    reg reset;
    wire [2:0] ns_light;
    wire [2:0] ew_light;
    
    // Instantiate the traffic light controller
    traffic_light_fsm uut (
        .clk(clk),
        .reset(reset),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );
    
    // Generate clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units period = 100MHz with default time scale
    end
    
    // Initialize and run simulation
    initial begin
        // Initialize signals
        reset = 1;
        #100;
        reset = 0;
        
        // Run simulation for a few cycles to see state transitions
        #100000000;  // Run for a long time to observe multiple cycles
        
        $finish;
    end
    
    // Monitor outputs
    initial begin
        $monitor("Time: %0t ns | State: %b | NS Light: %b (%s) | EW Light: %b (%s)", 
                 $time, 
                 uut.current_state,
                 ns_light, 
                 (ns_light == 3'b001) ? "GREEN" : (ns_light == 3'b010) ? "YELLOW" : "RED",
                 ew_light,
                 (ew_light == 3'b001) ? "GREEN" : (ew_light == 3'b010) ? "YELLOW" : "RED");
    end
    
endmodule