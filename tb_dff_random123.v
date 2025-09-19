// Verilog Testbench for D Flip-Flop
// File name: tb_dff_random123.v

`timescale 1ns / 1ps

module tb_dff;

    // Inputs
    reg clk;
    reg d;

    // Outputs
    wire q;

    // Instantiate the Unit Under Test (UUT)
    dff uut (
        .clk(clk), 
        .d(d), 
        .q(q)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // 10ns clock period
    end

    // Test procedure
    initial begin
        // Initialize Inputs
        clk = 0;
        d = 0;
        $display("Time\tCLK\tD\tQ");

        // Wait 100 ns for global reset to finish
        #100;

        // Apply test vectors
        #10 d = 0; // Hold reset
        #10 d = 1; // Set D high
        #10 d = 0; // Set D low
        #10 d = 1; // Set D high
        #10 d = 0; // Set D low

        // Finish simulation
        #20 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("%0t\t%b\t%b\t%b", $time, clk, d, q);
    end

endmodule