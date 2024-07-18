module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	wire carry, unused_count;
    wire [15:0] r1, r2;
    add16 ins1 (.a(a[15:0]), .b(b[15:0]), .sum(r1), .cin(0), .cout(carry));
    add16 ins2 (.a(a[31:16]), .b(b[31:16]), .sum(r2), .cin(carry), .cout(unused_count));
    assign sum = {r2, r1};
endmodule