module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] r1, r2_0, r2_1, r2;
    wire sig, unused_count;
    
    add16 ins1(.a(a[15:0]) ,.b(b[15:0]) ,.cin(0), .cout(sig), .sum(r1));
    add16 ins2(.a(a[31:16]) ,.b(b[31:16]) ,.cin(0), .cout(unused_count), .sum(r2_0));
    add16 ins3(.a(a[31:16]) ,.b(b[31:16]) ,.cin(1), .cout(unused_count), .sum(r2_1));
    
    assign r2 = sig? r2_1 : r2_0;
    assign sum = {r2,r1};
endmodule