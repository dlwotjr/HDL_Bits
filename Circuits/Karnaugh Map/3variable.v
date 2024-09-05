module top_module(
    input a,
    input b,
    input c,
    output out  ); 
	// a=1 | b=1 | c=1
    assign out = a|b|c;
endmodule