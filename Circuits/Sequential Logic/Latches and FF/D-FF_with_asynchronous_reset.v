module top_module (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q   
);
    always @ (posedge clk or posedge areset) begin
        if (areset)       
            q <= 0;
        else              // 입력값 d를 q에 저장
            q <= d;
    end
endmodule
