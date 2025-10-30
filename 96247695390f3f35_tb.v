// Testbench for D Flip-Flop
`timescale 1ns/1ps

module d_flipflop_tb;
    
    // Testbench signals
    reg clk;
    reg reset;
    reg d;
    wire q;
    
    // Instantiate the D Flip-Flop
    d_flipflop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );
    
    // Clock generation - 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle clk every 5ns to get 10ns period
    end
    
    // Test sequence
    initial begin
        // Initialize signals
        reset = 1;
        d = 0;
        
        // Reset the flip-flop
        #10;
        reset = 0;
        $display("Time: %0t - After reset, q = %b", $time, q);
        
        // Test case 1: d = 1 at next clock
        #10;
        d = 1;
        $display("Time: %0t - Set d=1, before clk posedge, q = %b", $time, q);
        @(posedge clk);
        $display("Time: %0t - After clk posedge, q = %b", $time, q);
        
        // Test case 2: d = 0 at next clock
        #10;
        d = 0;
        $display("Time: %0t - Set d=0, before clk posedge, q = %b", $time, q);
        @(posedge clk);
        $display("Time: %0t - After clk posedge, q = %b", $time, q);
        
        // Test case 3: d = 1 again
        #10;
        d = 1;
        $display("Time: %0t - Set d=1, before clk posedge, q = %b", $time, q);
        @(posedge clk);
        $display("Time: %0t - After clk posedge, q = %b", $time, q);
        
        // Test reset functionality
        #10;
        reset = 1;
        $display("Time: %0t - Assert reset, q = %b", $time, q);
        @(posedge clk);
        $display("Time: %0t - After clk posedge with reset, q = %b", $time, q);
        
        // End simulation
        #20;
        $finish;
    end
    
    // Monitor all signals
    initial begin
        $monitor("Time: %0t | clk: %b | reset: %b | d: %b | q: %b", $time, clk, reset, d, q);
    end

endmodule