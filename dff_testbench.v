// Testbench for D-FlipFlop
`timescale 1ns/1ps

module dff_testbench;
  
  // Declare inputs and outputs
  reg clk;
  reg reset;
  reg d;
  wire q;
  wire q_bar;
  
  // Instantiate the D-FlipFlop module
  // Assuming the DFF module has inputs: clk, reset, d and outputs: q, q_bar
  dff uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_bar(q_bar)
  );
  
  // Clock generation - 10ns period
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle clk every 5ns to get 10ns period
  end
  
  // Test stimulus
  initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    
    // Display header
    $display("Time\t\tCLK\tRESET\tD\tQ\tQ_BAR");
    $monitor("%0t\t\t%b\t%b\t\t%b\t%b\t%b", $time, clk, reset, d, q, q_bar);
    
    // Reset sequence
    #10;
    reset = 0;
    
    // Test different input combinations
    #10;
    d = 1;
    
    #20;
    d = 0;
    
    #20;
    d = 1;
    
    #20;
    reset = 1;
    
    #10;
    reset = 0;
    d = 1;
    
    #20;
    d = 0;
    
    #20;
    
    // End simulation
    $finish;
  end

endmodule

// Example D-FlipFlop module (for reference/testing)
module dff (
  input clk,
  input reset,
  input d,
  output reg q,
  output wire q_bar
);

  assign q_bar = ~q;

  always @(posedge clk or posedge reset) begin
    if (reset)
      q <= 0;
    else
      q <= d;
  end

endmodule