// D Flip-Flop Module
module dff (
    input clk,
    input rst,
    input d,
    output reg q
);

always @(posedge clk or posedge rst) begin
    if (rst)
        q <= 1'b0;
    else
        q <= d;
end

endmodule

// Testbench for D Flip-Flop
module tb_dff;
    reg clk;
    reg rst;
    reg d;
    wire q;
    
    // Instantiate the DFF module
    dff uut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q)
    );
    
    // Clock generation
    always begin
        #5 clk = ~clk;
    end
    
    // Test sequence
    initial begin
        // Initialize inputs
        clk = 0;
        rst = 1;
        d = 0;
        
        // Release reset
        #10 rst = 0;
        
        // Apply test vectors
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;
        
        // Finish simulation
        #10 $finish;
    end
    
    // Monitor outputs
    initial begin
        $monitor("Time = %0t: clk = %b, rst = %b, d = %b, q = %b", $time, clk, rst, d, q);
    end
    
endmodule