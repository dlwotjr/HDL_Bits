//sop form
module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
	wire temp1,temp2,temp3,temp4;
    assign temp1 = ~x3 & x2 & ~x1;
    assign temp2 = ~x3 & x2 & x1;
    assign temp3 = x3 & ~x2 & x1;
    assign temp4 = x3 & x2 & x1;
    assign f = temp1 | temp2 | temp3 | temp4;
endmodule