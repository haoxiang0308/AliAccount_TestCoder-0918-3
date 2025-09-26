// 4-bit Ripple Carry Adder
module adder_4bit (
    input [3:0] a,      // 4-bit input A
    input [3:0] b,      // 4-bit input B
    input cin,          // Carry-in
    output [3:0] sum,   // 4-bit sum output
    output cout         // Carry-out
);

    // Internal carry signals for the full adders
    wire c1, c2, c3;

    // Full Adder instances (using internal logic)
    // FA for bit 0
    assign {c1, sum[0]} = a[0] + b[0] + cin;
    // FA for bit 1
    assign {c2, sum[1]} = a[1] + b[1] + c1;
    // FA for bit 2
    assign {c3, sum[2]} = a[2] + b[2] + c2;
    // FA for bit 3
    assign {cout, sum[3]} = a[3] + b[3] + c3;

endmodule