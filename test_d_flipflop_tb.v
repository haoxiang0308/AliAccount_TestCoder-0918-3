// Testbench for D Flip-Flop
module test_d_flipflop_tb;

// Inputs
reg clk;
reg reset;
reg d;

// Outputs
wire q;
wire q_bar;

// Instantiate the D Flip-Flop module
d_flipflop uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_bar(q_bar)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10 time units period
end

// Test sequence
initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    
    // Apply reset
    #10;
    
    // Release reset and test various inputs
    reset = 0;
    #10;
    
    // Test different input values
    d = 1; #20;
    d = 0; #20;
    d = 1; #20;
    d = 0; #20;
    
    // Test reset again
    reset = 1; #10;
    reset = 0; #10;
    
    // More input changes
    d = 1; #20;
    d = 0; #20;
    
    $display("Test completed.");
    $finish;
end

// Monitor signals
initial begin
    $monitor("Time: %0t | Reset: %b | D: %b | Q: %b | Q_Bar: %b", 
             $time, reset, d, q, q_bar);
end

endmodule