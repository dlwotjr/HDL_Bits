module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
	
    wire [100:0] sum_result; 
    assign sum_result = a+b+cin;
    assign sum = sum_result[99:0];
    assign cout = sum_result[100];
    
endmodule

/*
module top_module (
	input [99:0] a,
	input [99:0] b,
	input cin,
	output cout,
	output [99:0] sum
);

	// The concatenation {cout, sum} is a 101-bit vector.
	assign {cout, sum} = a+b+cin;

endmodule
*/