// Testbench for D Flip-Flop
module d_ff_tb;
  reg clk;
  reg reset;
  reg d;
  wire q, q_bar;

  // Instantiate the D Flip-Flop (assuming module name is d_ff)
  d_ff uut (
    .clk(clk),
    .reset(reset),
    .d(d),
    .q(q),
    .q_bar(q_bar)
  );

  // Generate clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 time units period
  end

  // Test sequence
  initial begin
    // Initialize signals
    reset = 1;
    d = 0;
    #10;

    reset = 0; // Deassert reset
    #10;

    d = 1; // Set D high
    #20;

    d = 0; // Set D low
    #20;

    d = 1; // Set D high again
    #20;

    $finish; // End simulation
  end

  // Monitor outputs
  initial begin
    $monitor("Time: %0t, D: %b, Q: %b, Q_bar: %b", $time, d, q, q_bar);
  end

endmodule