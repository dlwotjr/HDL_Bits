module top_module ( input [1:0] A, input [1:0] B, output z ); 
	wire temp1, temp2;
    assign temp1 = A[0] ^ B[0];
    assign temp2 = A[1] ^ B[1];
    assign z = ~(temp1|temp2);
endmodule

/*//solution
module top_module ( input [1:0] A, input [1:0] B, output z ); 
    assign z = (A==B);

endmodule
*/