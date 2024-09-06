module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//

    // assign intermediate_result1 = compare? true: false;
    wire [7:0] temp_result1, temp_result2;
	assign temp_result1 = a<b? a:b;
    assign temp_result2 = temp_result1<c? temp_result1:c;
    assign min = temp_result2<d? temp_result2:d;
    //assign out = temp_result1;
    
endmodule