module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
	wire carry, unused;
    wire [15:0] r1, r2;
    wire [31:0] temp;
    assign temp = b ^ {32{sub}};
    add16 ins1 (.a(a[15:0]), .b(temp[15:0]), .cin(sub), .cout(carry), .sum(r1));
    add16 ins2 (.a(a[31:16]), .b(temp[31:16]), .cin(carry), .cout(unused), .sum(r2));
    assign sum = {r2, r1};
endmodule