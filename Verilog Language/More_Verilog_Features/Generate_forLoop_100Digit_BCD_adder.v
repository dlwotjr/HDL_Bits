module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );

    wire [100:0] carry; 

    genvar i;
    assign carry[0] = cin; 

    bcd_fadd ins1(a[3:0], b[3:0], carry[0], carry[1], sum[3:0]);

    generate
        for(i = 1; i < 100; i++) begin: bcd_fadd_block
            bcd_fadd ins(a[4*i+3:4*i], b[4*i+3:4*i], carry[i], carry[i+1], sum[4*i+3:4*i]);
        end
    endgenerate

    assign cout = carry[100]; 

endmodule

