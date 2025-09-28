// Simple D Flip-Flop with asynchronous reset
module d_flipflop (
    input  clk,
    input  rst_n, // Active low reset
    input  d,
    output reg q
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= 1'b0; // Reset output to 0
        end else begin
            q <= d;    // Latch the input D
        end
    end
endmodule