// Testbench for D Flip-Flop
module d_flipflop_testbench;
  
  // Declare signals
  reg clk;
  reg reset;
  reg d;
  wire q;
  wire q_not;
  
  // Instantiate the D Flip-Flop module
  d_flipflop uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_not(q_not)
  );
  
  // Generate clock with 10ns period
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // Toggle clk every 5ns (10ns period)
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
    #10;
    d = 1;
    #20;
    d = 0;
    #20;
    d = 1;
    #20;
    d = 0;
    #20;
    
    // Additional reset test
    reset = 1;
    #10;
    reset = 0;
    #20;
    
    // End simulation
    $finish;
  end
  
  // Monitor signals
  initial begin
    $monitor("Time: %0t | CLK: %b | RESET: %b | D: %b | Q: %b | Q_NOT: %b", 
             $time, clk, reset, d, q, q_not);
  end

endmodule

// D Flip-Flop Module (for reference/testing)
module d_flipflop(
  input clk,
  input reset,
  input d,
  output reg q,
  output wire q_not
);

  assign q_not = ~q;

  always @(posedge clk or posedge reset) begin
    if (reset)
      q <= 0;
    else
      q <= d;
  end

endmodule