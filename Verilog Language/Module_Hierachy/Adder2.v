//Module Fadd
module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire [15:0] r1, r2;
    wire carry;
    add16 ins1(.a(a[15:0]), .b(b[15:0]), .cin(0), .cout(carry), .sum(r1));
    add16 ins2(.a(a[31:16]), .b(b[31:16]), .cin(carry), .cout(), .sum(r2));
    assign sum = {r2,r1};
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
    assign sum = a^b^cin;
    assign cout = (a&b)|(a&cin)|(b&cin);
endmodule