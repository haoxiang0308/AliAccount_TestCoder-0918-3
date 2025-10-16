// Traffic Light Controller using Finite State Machine
// This module controls a simple traffic light system with 4 states
// States: Green_NS (North-South), Yellow_NS, Green_EW (East-West), Yellow_EW

module traffic_light_fsm (
    input wire clk,          // System clock
    input wire reset,        // Reset signal (active high)
    input wire pedestrian,   // Pedestrian button input
    output reg [2:0] ns_light,  // North-South light: [2]=Red, [1]=Yellow, [0]=Green
    output reg [2:0] ew_light   // East-West light: [2]=Red, [1]=Yellow, [0]=Green
);

    // Define states
    typedef enum logic [1:0] {
        GREEN_NS    = 2'b00,  // Green for North-South
        YELLOW_NS   = 2'b01,  // Yellow for North-South
        GREEN_EW    = 2'b10,  // Green for East-West
        YELLOW_EW   = 2'b11   // Yellow for East-West
    } state_t;
    
    state_t current_state, next_state;
    
    // Counter for timing control
    reg [23:0] counter;  // 24-bit counter for longer timing
    parameter T_GREEN = 24'd5000000;   // Green light duration (adjust for simulation)
    parameter T_YELLOW = 24'd1000000;  // Yellow light duration
    parameter T_PREAMBLE = 24'd500000; // Brief delay before changing
    
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= GREEN_NS;
            counter <= 24'd0;
        end else begin
            current_state <= next_state;
            if (current_state == next_state) begin
                counter <= counter + 1;
            end else begin
                counter <= 24'd0;
            end
        end
    end
    
    // Next state logic
    always_comb begin
        case (current_state)
            GREEN_NS: begin
                if (pedestrian || counter >= T_GREEN)
                    next_state = YELLOW_NS;
                else
                    next_state = GREEN_NS;
            end
            
            YELLOW_NS: begin
                if (counter >= T_YELLOW)
                    next_state = GREEN_EW;
                else
                    next_state = YELLOW_NS;
            end
            
            GREEN_EW: begin
                if (pedestrian || counter >= T_GREEN)
                    next_state = YELLOW_EW;
                else
                    next_state = GREEN_EW;
            end
            
            YELLOW_EW: begin
                if (counter >= T_YELLOW)
                    next_state = GREEN_NS;
                else
                    next_state = YELLOW_EW;
            end
            
            default: next_state = GREEN_NS;
        endcase
    end
    
    // Output logic - set light values based on current state
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            ns_light <= 3'b001;  // NS Green ON
            ew_light <= 3'b100;  // EW Red ON
        end else begin
            case (current_state)
                GREEN_NS: begin
                    ns_light <= 3'b001;  // NS Green ON
                    ew_light <= 3'b100;  // EW Red ON
                end
                
                YELLOW_NS: begin
                    ns_light <= 3'b010;  // NS Yellow ON
                    ew_light <= 3'b100;  // EW Red ON
                end
                
                GREEN_EW: begin
                    ns_light <= 3'b100;  // NS Red ON
                    ew_light <= 3'b001;  // EW Green ON
                end
                
                YELLOW_EW: begin
                    ns_light <= 3'b100;  // NS Red ON
                    ew_light <= 3'b010;  // EW Yellow ON
                end
                
                default: begin
                    ns_light <= 3'b001;  // NS Green ON
                    ew_light <= 3'b100;  // EW Red ON
                end
            endcase
        end
    end

endmodule

// Testbench for the traffic light controller
module tb_traffic_light_fsm;
    reg clk;
    reg reset;
    reg pedestrian;
    
    wire [2:0] ns_light;
    wire [2:0] ew_light;
    
    // Instantiate the traffic light FSM
    traffic_light_fsm uut (
        .clk(clk),
        .reset(reset),
        .pedestrian(pedestrian),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time units period
    end
    
    // Test sequence
    initial begin
        // Initialize
        reset = 1;
        pedestrian = 0;
        #20;
        reset = 0;
        
        // Normal operation - let it cycle through states
        #1000;
        
        // Test pedestrian input during green_NS
        pedestrian = 1;
        #100;
        pedestrian = 0;
        #2000;
        
        // Let it run for a few more cycles
        #5000;
        
        $finish;
    end
    
    // Monitor outputs
    initial begin
        $monitor("Time: %0t | NS_Light: %b | EW_Light: %b | State: %s", 
                 $time, ns_light, ew_light, 
                 uut.current_state == uut.GREEN_NS ? "GREEN_NS" :
                 uut.current_state == uut.YELLOW_NS ? "YELLOW_NS" :
                 uut.current_state == uut.GREEN_EW ? "GREEN_EW" : "YELLOW_EW");
    end

endmodule