module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
	genvar i;
    full_adder ins1(a[0],b[0],cin,sum[0],cout[0]);
    generate
        for(i=1;i<100;i++)begin : full_adder
            full_adder ins(a[i],b[i],cout[i-1],sum[i],cout[i]);
        end
    endgenerate
endmodule

module full_adder(input a,b,cin, output sum, cout);
    assign sum = a^b^cin;
    assign cout = (a&b)|(b&cin)|(a&cin);    
endmodule