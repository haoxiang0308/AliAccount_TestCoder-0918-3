// Testbench for D Flip-Flop
`timescale 1ns / 1ps

module tb_d_ff();
    reg clk;
    reg reset;
    reg D;
    wire Q;

    // Instantiate the D Flip-Flop module
    // Assuming the D Flip-Flop module is named 'd_ff'
    d_ff uut (
        .clk(clk),
        .reset(reset),
        .D(D),
        .Q(Q)
    );

    // Generate clock signal
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Main test sequence
    initial begin
        // Initialize signals
        reset = 1;
        D = 0;
        #10; // Wait for a bit

        // Release reset and apply test vectors
        reset = 0;
        #10;
        D = 1;
        #20;
        D = 0;
        #20;
        D = 1;
        #20;
        $finish; // End simulation
    end

    // Monitor signals
    initial begin
        $monitor("Time: %0t, Reset: %b, D: %b, Q: %b", $time, reset, D, Q);
    end

endmodule