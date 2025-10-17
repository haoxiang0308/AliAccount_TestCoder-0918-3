// Testbench for D Flip-Flop
`timescale 1ns/1ps

module dff_testbench;
  
  // DUT (Device Under Test) inputs and outputs
  reg clk;
  reg reset;
  reg d;
  wire q, q_bar;
  
  // Instantiate the D flip-flop module
  // Assuming the DFF module is named 'dff' with inputs clk, reset, d and outputs q, q_bar
  dff uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_bar(q_bar)
  );
  
  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10ns period
  end
  
  // Test stimulus
  initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    
    // Wait for a few clock cycles
    #20;
    
    // Release reset
    reset = 0;
    
    // Apply test vectors
    #10 d = 1;    // Set D to 1
    #20 d = 0;    // Set D to 0
    #20 d = 1;    // Set D to 1
    #20 d = 0;    // Set D to 0
    #20 d = 1;    // Set D to 1
    
    // Test reset functionality
    #10 reset = 1;  // Assert reset
    #20 reset = 0;  // Deassert reset
    #20 d = 1;      // Set D to 1
    
    // Finish simulation
    #50 $finish;
  end
  
  // Monitor outputs
  initial begin
    $monitor("Time: %0t | CLK: %b | RESET: %b | D: %b | Q: %b | Q_BAR: %b", 
             $time, clk, reset, d, q, q_bar);
  end
  
endmodule