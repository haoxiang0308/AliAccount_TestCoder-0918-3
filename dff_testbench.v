// Testbench for D Flip-Flop
`timescale 1ns / 1ps

module dff_testbench;
    reg clk;
    reg reset;
    reg d;
    wire q, q_not;

    // Instantiate the D Flip-Flop module
    // Note: You need to have the 'dff' module defined in another file or within this file before the testbench.
    // For this example, we assume the module 'dff' exists with the following ports:
    // module dff(input clk, input reset, input d, output reg q, output q_not);
    // The 'dff' module itself is not created here, only the testbench for it.
    dff uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q),
        .q_not(q_not)
    );

    // Clock generation: 10ns period -> 100MHz frequency
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clk every 5ns
    end

    // Test stimulus
    initial begin
        // Initialize signals
        reset = 1;
        d = 0;
        #10; // Wait for 10ns

        // Release reset and apply test vectors
        reset = 0;
        #10;
        d = 1; // Set D high
        #20;
        d = 0; // Set D low
        #20;
        d = 1; // Set D high again
        #20;
        reset = 1; // Assert reset
        #10;
        d = 0; // Change D while reset is high (should be ignored)
        #20;
        reset = 0; // De-assert reset
        #20;

        // Finish simulation
        $display("Simulation finished at time %t", $time);
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time: %t | Reset: %b | D: %b | Q: %b | Q_N: %b", $time, reset, d, q, q_not);
    end

endmodule