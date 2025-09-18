// Testbench for D Flip-Flop
`timescale 1ns / 1ps

module d_ff_tb;

    // Declare inputs and outputs
    reg clk;
    reg d;
    wire q;
    wire qn; // Optional inverted output

    // Instantiate the D Flip-Flop module (assuming it's named d_ff)
    d_ff uut (
        .clk(clk),
        .d(d),
        .q(q),
        .qn(qn)
    );

    // Clock generation
    always begin
        #5 clk = ~clk; // 10ns clock period
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        clk = 0;
        d = 0;

        // Display header
        $display("Time\tCLK\tD\tQ\tQN");
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, clk, d, q, qn);

        // Apply test vectors
        #15 d = 1;  // Change D to 1
        #10 d = 0;  // Change D to 0
        #10 d = 1;  // Change D to 1
        #10 d = 0;  // Change D to 0

        // Finish simulation
        #20 $finish;
    end

endmodule