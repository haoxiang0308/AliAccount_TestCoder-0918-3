// Testbench for D Flip-Flop
`timescale 1ns/1ps

module dff_testbench;
    reg clk;
    reg rst;
    reg d;
    wire q, q_bar;

    // Instantiate the D Flip-Flop module
    dff uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation - 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize signals
        rst = 1;
        d = 0;
        
        // Reset the DFF
        #10;
        rst = 0;
        
        // Test different input combinations
        #15;
        d = 1;
        #10;
        d = 0;
        #10;
        d = 1;
        #10;
        d = 0;
        #10;
        
        // Test reset functionality
        rst = 1;
        #10;
        rst = 0;
        #10;
        
        // Final test
        d = 1;
        #10;
        d = 0;
        #10;
        
        // End simulation
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time: %0t | CLK: %b | RST: %b | D: %b | Q: %b | Q_BAR: %b", 
                 $time, clk, rst, d, q, q_bar);
    end
endmodule