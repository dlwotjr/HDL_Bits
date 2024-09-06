/*
# verilog 의 할당 3가지 방식
- 연속 할당(Continuous Assignment) / 차단 할당(Blocking Assignment) / 비차단 할당(Non-Blocking Assignment)
- Continuous Assignment
	- assign a= b+c;
	- 조합회로에서 사용 
	- assign이 몇개든 순서에 상관없이 할당됨
- Blocking Assignment
	- always @($*$) a= b+c;
	- 이걸 할당하는 동안 밑에 있는 것은 순서를 기다리며 할당이 되지 않음
	- 내부 값이 바뀌면 순차적으로 할당을 함
- Non-Blocking Assignment
	- always @(posedge clk) a<=b+c;
	- clk의 rising edge에서만 assign됨
	- <= 로 할당함
    */
    // synthesis verilog_input_version verilog_2001
module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );
    
    assign out_assign = a ^ b;
    always @(*) out_always_comb = a ^b;
    always @(posedge clk) out_always_ff <= a^b;

endmodule