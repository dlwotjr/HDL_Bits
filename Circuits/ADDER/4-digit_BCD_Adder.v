module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum
);

    wire carry1, carry2, carry3;

    bcd_fadd ins1 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .cout(carry1), .sum(sum[3:0]));
    bcd_fadd ins2 (.a(a[7:4]), .b(b[7:4]), .cin(carry1), .cout(carry2), .sum(sum[7:4]));
    bcd_fadd ins3 (.a(a[11:8]), .b(b[11:8]), .cin(carry2), .cout(carry3), .sum(sum[11:8]));
    bcd_fadd ins4 (.a(a[15:12]), .b(b[15:12]), .cin(carry3), .cout(cout), .sum(sum[15:12]));

endmodule