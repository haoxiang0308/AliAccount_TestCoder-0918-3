// Testbench for D Flip-Flop
module d_flip_flop_tb;
    reg clk;
    reg reset;
    reg d;
    wire q;

    // Instantiate the D Flip-Flop module
    d_flip_flop uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Generate clock
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time unit period
    end

    // Test sequence
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, d_flip_flop_tb);

        // Initialize signals
        reset = 1;
        d = 0;
        #10;

        // Release reset
        reset = 0;
        #10;

        // Test data input
        d = 1; #10;
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;

        // End simulation
        #20;
        $finish;
    end

endmodule