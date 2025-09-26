// Testbench for D Flip-Flop
`include "d_flipflop.v"

module d_flipflop_tb ();

    reg clk;
    reg rst_n;
    reg d;
    wire q;

    // Instantiate the D Flip-Flop
    d_flipflop uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time unit period
    end

    // Test sequence
    initial begin
        // Initialize signals
        rst_n = 0;
        d = 0;
        #10;

        // Release reset
        rst_n = 1;
        #10;

        // Test data input
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;

        // Finish simulation
        #20 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time: %0t, rst_n: %b, D: %b, Q: %b", $time, rst_n, d, q);
    end

endmodule