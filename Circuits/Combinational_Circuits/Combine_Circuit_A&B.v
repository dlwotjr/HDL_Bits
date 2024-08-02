module top_module (input x, input y, output z);
	wire temp1, temp2, temp3, temp4;
    mt2015_q4a ins1(x,y,temp1);
    mt2015_q4b ins2(x,y,temp2);
    assign temp3 = temp1|temp2;
    assign temp4 = temp1&temp2;
    assign z = temp3^temp4;
endmodule

module mt2015_q4a (input x, input y, output z);
	assign z= x&~y;
endmodule

module mt2015_q4b ( input x, input y, output z );
    assign z= ~(x^y);
endmodule