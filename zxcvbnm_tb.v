// Randomly named testbench for D Flip-Flop
// File: zxcvbnm_tb.v

`timescale 1ns / 1ps

module zxcvbnm_tb;

    // Inputs
    reg clk;
    reg rst_n;
    reg d;

    // Outputs
    wire q;
    wire qn;

    // Instantiate the Unit Under Test (UUT)
    dff uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q),
        .qn(qn)
    );

    // Clock generation
    always #5 clk = ~clk; // 10ns period clock (50MHz)

    // Test procedure
    initial begin
        // Initialize Inputs
        clk = 0;
        rst_n = 0;
        d = 0;
        
        // Display header
        $display("Time\tclk\trst_n\td\tq\tqn");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk, rst_n, d, q, qn);

        // Release reset
        #15 rst_n = 1;
        
        // Apply test vectors
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;
        
        // Assert reset again
        #10 rst_n = 0;
        #10 rst_n = 1;
        d = 1;
        #10 d = 0;
        #10 $finish;
    end

endmodule