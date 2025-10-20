// Testbench for D-flipflop module
module d_flipflop_tb;

    // Inputs
    reg clk;
    reg reset;
    reg d;
    
    // Outputs
    wire q;

    // Instantiate the D-flipflop module
    d_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle clock every 5 time units
    end

    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        d = 0;
        
        // Apply reset
        #10;
        reset = 0;
        
        // Test different input combinations
        #10 d = 1;      // Set D to 1
        #10 d = 0;      // Set D to 0
        #10 d = 1;      // Set D to 1
        #10 d = 0;      // Set D to 0
        
        // Test reset again
        #5 reset = 1;   // Apply reset
        #10 reset = 0;  // Remove reset
        
        // More tests
        d = 1;
        #10 d = 0;
        #10 d = 1;
        
        // End simulation
        #20 $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time: %0t | Reset: %b | D: %b | Q: %b", $time, reset, d, q);
    end

endmodule