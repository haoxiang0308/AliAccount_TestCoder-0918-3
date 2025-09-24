// 4-bit Adder Module
module adder_4bit (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
);

    wire [3:0] carry_int;

    // Instantiate 4 full adders
    full_adder fa0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(carry_int[0]));
    full_adder fa1 (.a(a[1]), .b(b[1]), .cin(carry_int[0]), .sum(sum[1]), .cout(carry_int[1]));
    full_adder fa2 (.a(a[2]), .b(b[2]), .cin(carry_int[1]), .sum(sum[2]), .cout(carry_int[2]));
    full_adder fa3 (.a(a[3]), .b(b[3]), .cin(carry_int[2]), .sum(sum[3]), .cout(cout));

endmodule

// Full Adder Module
module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    assign sum = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);

endmodule