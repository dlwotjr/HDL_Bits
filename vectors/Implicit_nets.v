/*
- ## Implicit nets
	- 찾기 어려운 버그가 여기서 발생하기도 함
	- assign으로 할당하거나 선언되지 않은 모듈 포트를 연결할 때 Implicit net타입 신호가 생성됨
	- Implicit net 는 항상 1비트 와이어임
	- default_nettype none 지시어 추가해 error로 찾을 수 있다
*/

wire [2:0] a, c; // Two vectors 
assign a = 3'b101; // a = 101 
assign b = a; // b = 1 implicitly-created wire 
assign c = b; // c = 001 <-- bug 
my_module i1 (d,e); // d and e are implicitly one-bit wide if not declared.  
// This could be a bug if the port was intended to be a vector.	