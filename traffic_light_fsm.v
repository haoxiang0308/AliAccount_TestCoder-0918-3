// Traffic Light Controller using Finite State Machine
module traffic_light_fsm (
    input wire clk,           // System clock
    input wire reset,         // System reset
    input wire pedestrian,    // Pedestrian button (active high)
    output reg [2:0] ns_light, // North-South traffic light (R=100, Y=010, G=001)
    output reg [2:0] ew_light  // East-West traffic light (R=100, Y=010, G=001)
);

    // Define states for the FSM
    parameter IDLE = 3'b000,
              NS_GREEN = 3'b001,
              NS_YELLOW = 3'b010,
              EW_GREEN = 3'b011,
              EW_YELLOW = 3'b100;

    // Internal signals
    reg [2:0] current_state, next_state;
    
    // Timing parameters (in clock cycles, assuming 1Hz clock for simplicity)
    // In a real design, you would use a counter to generate longer delays
    parameter NS_GREEN_TIME = 25,   // 25 seconds for North-South green
              NS_YELLOW_TIME = 5,   // 5 seconds for North-South yellow
              EW_GREEN_TIME = 25,   // 25 seconds for East-West green
              EW_YELLOW_TIME = 5;   // 5 seconds for East-West yellow

    // Counter for timing
    reg [6:0] counter;
    
    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end
    
    // Counter logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            counter <= 7'b0000000;
        else if (current_state == NS_GREEN && counter < NS_GREEN_TIME)
            counter <= counter + 1;
        else if (current_state == NS_YELLOW && counter < NS_YELLOW_TIME)
            counter <= counter + 1;
        else if (current_state == EW_GREEN && counter < EW_GREEN_TIME)
            counter <= counter + 1;
        else if (current_state == EW_YELLOW && counter < EW_YELLOW_TIME)
            counter <= counter + 1;
        else
            counter <= 7'b0000000;  // Reset counter when changing states
    end
    
    // Next state logic
    always @(*) begin
        case (current_state)
            IDLE: 
                if (!reset)
                    next_state = NS_GREEN;
                else
                    next_state = IDLE;
                    
            NS_GREEN:
                if (counter >= NS_GREEN_TIME || pedestrian)
                    next_state = NS_YELLOW;
                else
                    next_state = NS_GREEN;
                    
            NS_YELLOW:
                if (counter >= NS_YELLOW_TIME)
                    next_state = EW_GREEN;
                else
                    next_state = NS_YELLOW;
                    
            EW_GREEN:
                if (counter >= EW_GREEN_TIME || pedestrian)
                    next_state = EW_YELLOW;
                else
                    next_state = EW_GREEN;
                    
            EW_YELLOW:
                if (counter >= EW_YELLOW_TIME)
                    next_state = NS_GREEN;
                else
                    next_state = EW_YELLOW;
                    
            default:
                next_state = IDLE;
        endcase
    end
    
    // Output logic (Moore outputs based on current state)
    always @(*) begin
        case (current_state)
            IDLE: begin
                ns_light = 3'b100;  // North-South: Red
                ew_light = 3'b100;  // East-West: Red
            end
            NS_GREEN: begin
                ns_light = 3'b001;  // North-South: Green
                ew_light = 3'b100;  // East-West: Red
            end
            NS_YELLOW: begin
                ns_light = 3'b010;  // North-South: Yellow
                ew_light = 3'b100;  // East-West: Red
            end
            EW_GREEN: begin
                ns_light = 3'b100;  // North-South: Red
                ew_light = 3'b001;  // East-West: Green
            end
            EW_YELLOW: begin
                ns_light = 3'b100;  // North-South: Red
                ew_light = 3'b010;  // East-West: Yellow
            end
            default: begin
                ns_light = 3'b100;  // Default to Red
                ew_light = 3'b100;  // Default to Red
            end
        endcase
    end
    
endmodule

// Testbench for the traffic light controller
module tb_traffic_light_fsm;
    reg clk;
    reg reset;
    reg pedestrian;
    wire [2:0] ns_light;
    wire [2:0] ew_light;
    
    // Instantiate the traffic light controller
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
        forever #5 clk = ~clk;  // 10 time units period (1Hz equivalent)
    end
    
    // Test sequence
    initial begin
        $display("Time, NS_Light, EW_Light");
        $monitor("%0t, NS=%b, EW=%b", $time, ns_light, ew_light);
        
        // Initialize
        reset = 1;
        pedestrian = 0;
        #10;
        
        // Release reset
        reset = 0;
        #10;
        
        // Wait for some cycles to see normal operation
        #200;
        
        // Test pedestrian button
        pedestrian = 1;
        #10;
        pedestrian = 0;
        #300;
        
        // End simulation
        $finish;
    end
    
endmodule