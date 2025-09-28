// Testbench for d_flipflop
`timescale 1ns/1ps

module tb_d_flipflop;
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

    // Clock generation: 10ns period (100MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clk every 5 time units
    end

    // Test stimulus
    initial begin
        // Initialize signals
        rst_n = 0; // Reset is active low, so start with 0
        d = 0;
        #10; // Wait for a bit

        // Release reset
        rst_n = 1;
        #10;

        // Apply test vectors
        $display("Time: %0t, D: %b, Q: %b", $time, d, q);
        d = 1; #10;
        $display("Time: %0t, D: %b, Q: %b", $time, d, q);
        d = 0; #10;
        $display("Time: %0t, D: %b, Q: %b", $time, d, q);
        d = 1; #10;
        $display("Time: %0t, D: %b, Q: %b", $time, d, q);

        // End simulation
        #20;
        $finish;
    end

endmodule