`timescale 1ns/1ps

module dff_testbench();
  reg clk;
  reg rst_n;
  reg d;
  wire q;

  // Instantiate the D flip-flop module
  // Assuming the DFF module is named 'dff' with ports clk, rst_n, d, q
  // dff uut (
  //   .clk(clk),
  //   .rst_n(rst_n),
  //   .d(d),
  //   .q(q)
  // );

  // Generate clock
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
  end

  // Generate stimulus
  initial begin
    // Initialize signals
    rst_n = 0;
    d = 0;
    #15;
    rst_n = 1; // Release reset after 15ns

    // Apply test vectors
    #10 d = 1; // Apply D=1 after reset
    #20 d = 0; // Apply D=0
    #20 d = 1; // Apply D=1
    #20 d = 0; // Apply D=0

    // Finish simulation
    #20 $finish;
  end

  // Monitor outputs
  initial begin
    $monitor("Time=%0t ns, CLK=%b, RST_N=%b, D=%b, Q=%b", $time, clk, rst_n, d, q);
  end

endmodule