// Traffic Light Controller using Finite State Machine
// This module controls a simple traffic light system with three states:
// - Red light for main road (30 seconds)
// - Green light for main road (20 seconds) 
// - Yellow light for main road (5 seconds)
// Then cycles back to red

module traffic_light_fsm (
    input wire clk,           // System clock
    input wire reset,         // System reset
    output reg [2:0] main_light,   // Main road light: [2]=Red, [1]=Yellow, [0]=Green
    output reg [2:0] side_light    // Side road light: [2]=Red, [1]=Yellow, [0]=Green
);

// Define states
parameter RED_STATE    = 3'b001;
parameter GREEN_STATE  = 3'b010;
parameter YELLOW_STATE = 3'b100;

// Internal signals
reg [2:0] current_state, next_state;
reg [31:0] counter;  // Counter for timing
reg [31:0] counter_max;

// State register
always @(posedge clk or posedge reset) begin
    if (reset) begin
        current_state <= RED_STATE;
        counter <= 0;
    end else begin
        if (counter < counter_max) begin
            counter <= counter + 1;
        end else begin
            counter <= 0;
            current_state <= next_state;
        end
    end
end

// Next state logic
always @(*) begin
    case (current_state)
        RED_STATE: begin
            next_state = GREEN_STATE;
            counter_max = 30; // Red light for 30 time units
        end
        GREEN_STATE: begin
            next_state = YELLOW_STATE;
            counter_max = 20; // Green light for 20 time units
        end
        YELLOW_STATE: begin
            next_state = RED_STATE;
            counter_max = 5; // Yellow light for 5 time units
        end
        default: begin
            next_state = RED_STATE;
            counter_max = 30;
        end
    endcase
end

// Output logic
always @(*) begin
    case (current_state)
        RED_STATE: begin
            main_light = 3'b100;    // Red for main road
            side_light = 3'b001;    // Green for side road
        end
        GREEN_STATE: begin
            main_light = 3'b001;    // Green for main road
            side_light = 3'b100;    // Red for side road
        end
        YELLOW_STATE: begin
            main_light = 3'b010;    // Yellow for main road
            side_light = 3'b100;    // Red for side road
        end
        default: begin
            main_light = 3'b100;    // Default to red for main road
            side_light = 3'b001;    // Default to green for side road
        end
    endcase
end

endmodule

// Testbench for traffic light controller
module traffic_light_tb;
    reg clk;
    reg reset;
    wire [2:0] main_light;
    wire [2:0] side_light;
    
    // Instantiate the traffic light controller
    traffic_light_fsm uut (
        .clk(clk),
        .reset(reset),
        .main_light(main_light),
        .side_light(side_light)
    );
    
    // Generate clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10 time unit period
    end
    
    // Initialize and run simulation
    initial begin
        reset = 1;
        #20;
        reset = 0;
        
        // Run for 1000 time units
        #1000;
        $finish;
    end
    
    // Monitor outputs
    initial begin
        $monitor("Time: %0t | Main: R=%b Y=%b G=%b | Side: R=%b Y=%b G=%b", 
                 $time, 
                 main_light[2], main_light[1], main_light[0],
                 side_light[2], side_light[1], side_light[0]);
    end
endmodule