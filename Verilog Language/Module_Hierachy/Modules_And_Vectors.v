module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] w1;
    wire [7:0] w2;
    wire [7:0] w3;
    wire [7:0] F;

    // Correctly instantiate my_dff8 modules using named port connections
    my_dff8 ins1 (.clk(clk), .d(d), .q(w1));
    my_dff8 ins2 (.clk(clk), .d(w1), .q(w2));
    my_dff8 ins3 (.clk(clk), .d(w2), .q(w3));
    
    // Correct case statement
    always @ (*) begin
        if(sel == 2'b00) begin
            F = d;
        end else if (sel == 2'b01) begin
            F = w1;
        end else if (sel == 2'b10) begin
            F = w2;
        end else if (sel == 2'b11) begin
            F = w3;
        end
    end
    /*이것도 가능함
	 always @ (sel, F, w1, w2, w3, d) begin
        case (sel)
            2'b00 : F = d;
            2'b01 : F = w1;
            2'b10 : F = w2;
            2'b11 : F = w3;
        endcase
	end
	*/

    assign q = F;
endmodule