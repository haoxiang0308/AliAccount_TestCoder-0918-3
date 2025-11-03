// D Flip-Flop module
`timescale 1ns/1ps

module dff (
    input clk,
    input rst,
    input d,
    output reg q,
    output q_bar
);

    // Main DFF logic
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 0;
        else
            q <= d;
    end

    // Inverted output
    assign q_bar = ~q;

endmodule