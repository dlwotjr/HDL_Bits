module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);

    reg [7:0] r;  // 이전 클럭 주기의 입력 값을 저장할 레지스터

    always @ (posedge clk) begin
        r <= in;  
        pedge <= (in & ~r);  
    end

endmodule