// Verilog Testbench for D Flip-Flop
// Random Filename: tb_dff_random_12345.v

`timescale 1ns / 1ps

module tb_dff;

    // Inputs
    reg clk;
    reg d;
    reg rst_n; // Active low reset
    reg set_n; // Active low set

    // Outputs
    wire q;
    wire q_bar;

    // Instantiate the Unit Under Test (UUT)
    // Assuming the DFF module is named 'dff'
    dff uut (
        .clk(clk),
        .d(d),
        .rst_n(rst_n),
        .set_n(set_n),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation
    always #5 clk = ~clk; // 100MHz clock

    // Monitor outputs
    initial begin
        $monitor("Time = %0t: clk = %b, d = %b, rst_n = %b, set_n = %b, q = %b, q_bar = %b",
                 $time, clk, d, rst_n, set_n, q, q_bar);
    end

    // Test stimulus
    initial begin
        // Initialize Inputs
        clk = 0;
        d = 0;
        rst_n = 1;
        set_n = 1;

        $display("Starting DFF Testbench Simulation");

        // Apply reset
        #15 rst_n = 0; // Assert reset
        #10 rst_n = 1; // Deassert reset
        #10;

        // Apply set
        set_n = 0; // Assert set
        #10 set_n = 1; // Deassert set
        #10;

        // Test data capture on rising edge
        d = 0;
        #10;
        d = 1;
        #10;
        d = 0;
        #10;
        d = 1;
        #10;

        // Finish simulation
        #20 $display("Ending DFF Testbench Simulation");
        $finish;
    end

endmodule