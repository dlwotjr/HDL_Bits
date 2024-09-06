//this problem wants to know how to connect continuous ports in top_modules

module top_module ( input clk, input d, output q );
	wire wire1, wire2;
    my_dff ins1(.clk(clk), .d(d), .q(wire1);
    my_dff ins2(.clk(clk), .d(wire1), .q(wire2);
    my_dff ins3(.clk(clk), .d(wire2), .q(q);
endmodule