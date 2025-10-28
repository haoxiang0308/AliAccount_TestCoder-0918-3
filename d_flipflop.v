// D Flip-Flop module
module d_flipflop (
    input clk,
    input reset,
    input d,
    output reg q,
    output reg q_bar
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 0;
        q_bar <= 1;
    end
    else begin
        q <= d;
        q_bar <= ~d;
    end
end

endmodule