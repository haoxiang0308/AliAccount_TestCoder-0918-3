// Traffic Light Controller using Finite State Machine
// This module controls a traffic light system with red, yellow, and green lights
// The sequence is: Red -> Green -> Yellow -> Red (with appropriate timing)

module traffic_light_controller (
    input clk,           // System clock
    input reset,         // Reset signal (active high)
    output reg red,      // Red light output
    output reg yellow,   // Yellow light output
    output reg green     // Green light output
);

    // Define states for the traffic light FSM
    parameter RED_STATE = 2'b00;
    parameter GREEN_STATE = 2'b01;
    parameter YELLOW_STATE = 2'b10;
    
    // State register
    reg [1:0] current_state, next_state;
    
    // Counter for timing control (assuming 1Hz clock for simplicity)
    // In a real implementation, you might use a slower clock or a counter
    reg [23:0] timer;  // 24-bit counter for longer timing
    parameter RED_TIME = 24'd5000000;    // Red light duration (5 seconds with 10MHz clock)
    parameter GREEN_TIME = 24'd3000000;  // Green light duration (3 seconds)
    parameter YELLOW_TIME = 24'd2000000; // Yellow light duration (2 seconds)
    
    // State register - synchronous reset
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= RED_STATE;
        else
            current_state <= next_state;
    end
    
    // Timer - counts clock cycles and resets when state changes
    always @(posedge clk or posedge reset) begin
        if (reset)
            timer <= 24'd0;
        else if (current_state != next_state)  // State changed
            timer <= 24'd0;
        else
            timer <= timer + 24'd1;
    end
    
    // Next state logic
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
    
    // Output logic - assign light outputs based on current state
    always @(*) begin
        case (current_state)
            RED_STATE: begin
                red = 1'b1;
                yellow = 1'b0;
                green = 1'b0;
            end
            GREEN_STATE: begin
                red = 1'b0;
                yellow = 1'b0;
                green = 1'b1;
            end
            YELLOW_STATE: begin
                red = 1'b0;
                yellow = 1'b1;
                green = 1'b0;
            end
            default: begin
                red = 1'b1;   // Default to red in case of invalid state
                yellow = 1'b0;
                green = 1'b0;
            end
        endcase
    end
    
endmodule

// Testbench for the traffic light controller
module tb_traffic_light_controller;
    reg clk;
    reg reset;
    wire red, yellow, green;
    
    // Instantiate the traffic light controller
    traffic_light_controller uut (
        .clk(clk),
        .reset(reset),
        .red(red),
        .yellow(yellow),
        .green(green)
    );
    
    // Generate clock (10MHz for simulation)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10MHz clock (period = 10ns)
    end
    
    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        #20;
        reset = 0;
        
        // Run for a few cycles to observe the sequence
        #100000000;  // Run for 100ms to see multiple cycles
        
        $finish;
    end
    
    // Monitor outputs
    initial begin
        $monitor("Time: %0t | Reset: %b | Red: %b | Yellow: %b | Green: %b | State: %s", 
                 $time, reset, red, yellow, green, 
                 uut.current_state == uut.RED_STATE ? "RED" :
                 uut.current_state == uut.GREEN_STATE ? "GREEN" : "YELLOW");
    end
    
endmodule