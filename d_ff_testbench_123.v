// Testbench for D Flip-Flop
module d_ff_tb();
  reg clk;
  reg rst_n;
  reg d;
  wire q;

  // Instantiate the D Flip-Flop (assuming module name is d_ff)
  d_ff uut (
    .clk(clk),
    .rst_n(rst_n),
    .d(d),
    .q(q)
  );

  // Clock generation: 10 time units period
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // Toggle clk every 5 time units
  end

  // Test stimulus
  initial begin
    // Initialize signals
    d = 0;
    rst_n = 0; // Assert reset (active low)
    #15;       // Wait for a bit
    rst_n = 1; // De-assert reset
    #10;

    // Test sequence
    d = 1;      // Set D to 1
    #10;
    d = 0;      // Set D to 0
    #10;
    d = 1;      // Set D to 1
    #10;
    d = 0;      // Set D to 0
    #10;

    // Finish simulation
    $finish;
  end

endmodule