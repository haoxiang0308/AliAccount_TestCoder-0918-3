// 4-bit Adder Module
module four_bit_adder (
    input [3:0] a,      // 4-bit input A
    input [3:0] b,      // 4-bit input B
    input cin,          // Carry-in
    output [3:0] sum,   // 4-bit sum output
    output cout         // Carry-out
);

    // Internal wire for carry propagation
    wire c1, c2, c3;

    // Full Adder instances for each bit
    // Bit 0
    assign {sum[0], c1} = a[0] + b[0] + cin;
    // Bit 1
    assign {sum[1], c2} = a[1] + b[1] + c1;
    // Bit 2
    assign {sum[2], c3} = a[2] + b[2] + c2;
    // Bit 3
    assign {sum[3], cout} = a[3] + b[3] + c3;

endmodule