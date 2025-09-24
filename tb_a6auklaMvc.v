// Testbench for D Flip-Flop
`timescale 1ns/1ps
module tb_d_flipflop;
    reg clk;
    reg rst_n;
    reg d;
    wire q;

    d_flipflop uut (
        .clk(clk),
        .rst_n(rst_n),
        .d(d),
        .q(q)
    );

    initial begin
        \$dumpfile("tb_a6auklaMvc.vcd");
        \$dumpvars(0, tb_d_flipflop);
    end

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period
    end

    // Test sequence
    initial begin
        // Initialize
        rst_n = 0;
        d = 0;
        #10;

        // Deassert reset
        rst_n = 1;
        #10;

        // Test data input
        d = 1;
        #20;

        d = 0;
        #20;

        d = 1;
        #20;

        // End simulation
        #20;
        \$finish;
    end

endmodule