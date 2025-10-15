// Traffic Light Controller using Finite State Machine
// This module controls a simple traffic light system with 3 states:
// - RED (for main road)
// - GREEN (for main road)
// - YELLOW (for main road)
// Side road lights are complementary (when main is red, side is green/yellow)

module traffic_light_fsm (
    input wire clk,           // System clock
    input wire reset,         // Reset signal (active high)
    output reg [2:0] main_light,  // Main road light: [2]Red, [1]Yellow, [0]Green
    output reg [2:0] side_light   // Side road light: [2]Red, [1]Yellow, [0]Green
);

    // Define states
    parameter RED_STATE = 3'b001;
    parameter GREEN_STATE = 3'b010;
    parameter YELLOW_STATE = 3'b100;
    
    // Internal state register
    reg [2:0] current_state, next_state;
    
    // Timer for state duration
    reg [23:0] timer;  // 24-bit timer for longer delays
    parameter RED_TIME = 24'd25000000;    // 25M cycles = ~0.5 seconds at 50MHz (adjust as needed)
    parameter GREEN_TIME = 24'd50000000;  // ~1 second at 50MHz (adjust as needed)
    parameter YELLOW_TIME = 24'd12500000; // ~0.25 seconds at 50MHz (adjust as needed)
    
    // State register: Update state on clock edge
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= RED_STATE;
            timer <= 24'd0;
        end
        else begin
            if (current_state != next_state) begin
                current_state <= next_state;
                timer <= 24'd0;  // Reset timer when changing states
            end
            else begin
                timer <= timer + 1;  // Increment timer while in state
            end
        end
    end
    
    // Next state logic: Determine next state based on current state and timer
    always @(*) begin
        case (current_state)
            RED_STATE: begin
                if (timer >= RED_TIME)
                    next_state = GREEN_STATE;
                else
                    next_state = RED_STATE;
            end
            
            GREEN_STATE: begin
                if (timer >= GREEN_TIME)
                    next_state = YELLOW_STATE;
                else
                    next_state = GREEN_STATE;
            end
            
            YELLOW_STATE: begin
                if (timer >= YELLOW_TIME)
                    next_state = RED_STATE;
                else
                    next_state = YELLOW_STATE;
            end
            
            default: next_state = RED_STATE;
        endcase
    end
    
    // Output logic: Set light values based on current state
    always @(*) begin
        case (current_state)
            RED_STATE: begin
                main_light = 3'b100;  // Main: Red ON
                side_light = 3'b001;  // Side: Green ON
            end
            
            GREEN_STATE: begin
                main_light = 3'b001;  // Main: Green ON
                side_light = 3'b100;  // Side: Red ON
            end
            
            YELLOW_STATE: begin
                main_light = 3'b010;  // Main: Yellow ON
                side_light = 3'b100;  // Side: Red ON
            end
            
            default: begin
                main_light = 3'b100;  // Default to Main: Red ON
                side_light = 3'b001;  // Default to Side: Green ON
            end
        endcase
    end

endmodule

// Testbench for traffic light controller
module traffic_light_tb;
    reg clk, reset;
    wire [2:0] main_light, side_light;
    
    // Instantiate the traffic light controller
    traffic_light_fsm uut (
        .clk(clk),
        .reset(reset),
        .main_light(main_light),
        .side_light(side_light)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk;  // 50MHz clock (20ns period = 10ns half period)
    end
    
    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        #50;
        reset = 0;
        
        // Run simulation for several cycles
        #1000;
        
        // Finish simulation
        $display("Simulation completed");
        $finish;
    end
    
    // Monitor outputs
    initial begin
        $monitor("Time=%0t, State=%b, Main=%b, Side=%b", 
                 $time, uut.current_state, main_light, side_light);
    end
endmodule