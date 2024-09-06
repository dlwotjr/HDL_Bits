/*
- casez -> z는 dont care term 나타내는 자료형!
- ?도 가능은 하지만 z로 명시적 표현하자!
*/

module top_module (
    input [7:0] in,
    output reg [2:0] pos );
	always@(*)begin
        casez(in)
            8'bzzzzzzz1 : pos = 3'd0;
            8'b??????10 : pos = 3'd1;
            8'b?????100 : pos = 3'd2;
            8'b????1000 : pos = 3'd3;
            8'b???10000 : pos = 3'd4;
            8'b??100000 : pos = 3'd5;
            8'b?1000000 : pos = 3'd6;
            8'b10000000 : pos = 3'd7;
            default pos = 3'd0;
        endcase
    end
endmodule