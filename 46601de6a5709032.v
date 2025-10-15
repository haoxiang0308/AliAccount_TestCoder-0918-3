// 4-bit Adder Verilog Module
module four_bit_adder (
    input [3:0] a,        // 4-bit input A
    input [3:0] b,        // 4-bit input B
    input cin,            // Carry input
    output [3:0] sum,     // 4-bit sum output
    output cout           // Carry output
);

    // Internal wires for carry propagation
    wire c1, c2, c3;
    
    // Full adder instances for each bit
    // Bit 0
    assign {c1, sum[0]} = a[0] + b[0] + cin;
    
    // Bit 1
    assign {c2, sum[1]} = a[1] + b[1] + c1;
    
    // Bit 2
    assign {c3, sum[2]} = a[2] + b[2] + c2;
    
    // Bit 3
    assign {cout, sum[3]} = a[3] + b[3] + c3;

endmodule