문제 : Step one 
```verilog
module top_module( output one );

// Insert your code here
    assign one = 1;

endmodule

//동일한 코드로 이렇게도 됨
module top_module( output one );
	
	assign one = 1'b1;
	//처음의 1 : 비트 수 지정
	//`b : 이진법임
	// 1 : 숫자 1
	
endmodule


```

문제 : output Zero
```verilog
module top_module(
    output zero
);// Module body starts after semicolon
assign zero = 1'b0;//사실 처음에 0으로 초기화 되어있어서 아무것도 안써도 됨
endmodule
```

# Section : Verilog Language
# Value Set
- 0(low), 1(high), x(unknown), z(high impedance)
	- High impedance : 양쪽선이 모두 신호선인 경우
# Nets and Variables
- Nets types
	- 신호선 사이의 연결을 위한 자료형
![[Pasted image 20240719104039.png]]
- Variable Types
	- 데이터를 저장할 수 있는 자료형
![[Pasted image 20240719104108.png]]
- Vectors
	- nets/regs를 Multibit로 선언한 것(65536Bit 최대)
- 
문제 : Simple Wire
```verilog
module top_module( input in, output out );
assign out = in;
endmodule
```

문제 : Four Wire
```verilog
module top_module( 
    input a,b,c,
    output w,x,y,z );
assign {w,x,y,z} = {a,b,b,c};
//assign w = a;
//assign x = b;
//assign y = b;
//assign z = c;->이런식으로 하는 것도 가능하지만 위의 것이 더 짧으니까 좋다
endmodule
```

문제 : Inverter
비트 연산자 ~(Not)과 논리 연산자(Not -> !)
이것의 차이는 비트 연산자의 경우 비트 단위로 동작하며 여러 비트의 입력에 대해서도 각 비트 반전을 시킴
논리 연산자는 다중 비트 입력에 대해서는 전체값을 0 또는 1로 간주해 처리함
```verilog
module top_module( input in, output out );
assign out = ~in;
endmodule
```

문제 : And Gate
```verilog
module top_module( 
    input a, 
    input b, 
    output out );
assign out = a&b;
endmodule
```

문제 : Nor Gate
```verilog
module top_module( 
    input a, 
    input b, 
    output out );
    assign out = ~(a|b);  //-> a~|b해도 됨
endmodule
```

문제 : XNOR GATE
```verilog
module top_module( 
    input a, 
    input b, 
    output out );
    assign out = ~(a^b); //-> a~^b해도 됨
endmodule
```

문제 : Declaring Wires
```verilog
`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 

wire net_ab;  // wire 변수 선언
wire net_cd;  // wire 변수 선언

assign net_ab = a & b;  // wire 변수에 값 할당   wire net_ab = a & b;이렇게 하면 할당과 선언 동시에 가능
assign net_cd = c & d;  // wire 변수에 값 할당
assign out = net_ab | net_cd;
assign out_n = ~out;


endmodule
```

문제 : 7458 Chips
3input gate
```verilog
module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

wire net_p2ab = p2a & p2b;
    wire net_p2cd = p2c & p2d;
    assign p2y = net_p2ab | net_p2cd;
    wire net_p1abc = p1a & p1b & p1c;
    wire net_p1def = p1d & p1e & p1f;
    assign p1y = net_p1abc | net_p1def;//할당시 assign 빼먹으면 안대
endmodule
```

# Section : Verilog Language - Vectors
문제 : Vectors
다중 비트 결과 할당
```verilog
module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration
    assign outv = vec[2:0]; // 이런 식으로 다중 비트 결과 할당 한다
    assign o0 = vec[0];
    assign o1 = vec[1];
    assign o2 = vec[2];
endmodule
```

문제 : Vectors in more detail
정보 :
- ## Declaring Vectors
	- vector의 type : wire 나 reg
	- vec[3:0]했다가 vec[0:3]하면 안됨 - 엔디안도 동일하게 유지해야함

- ## Implicit nets
	- 찾기 어려운 버그가 여기서 발생하기도 함
	- assign으로 할당하거나 선언되지 않은 모듈 포트를 연결할 때 Implicit net타입 신호가 생성됨
	- Implicit net 는 항상 1비트 와이어임
	- default_nettype none 지시어 추가해 error로 찾을 수 있다
```verilog
wire [2:0] a, c; // Two vectors 
assign a = 3'b101; // a = 101 
assign b = a; // b = 1 implicitly-created wire 
assign c = b; // c = 001 <-- bug 
my_module i1 (d,e); // d and e are implicitly one-bit wide if not declared.  
// This could be a bug if the port was intended to be a vector.		
```
- ## Unpacked vs Packed Arrays
	-  **Packed Arrays**:
		- 이건 내가 c에서 쓰던 배열인데 그 구성이 무조건 1비트인 것
	    - 단일 비트 타입으로 구성
	    - 벡터 연산 가능
	    - 데이터 버스, 레지스터 등의 비트 그룹 표현에 유용
	    - 전체 프린트 가능
	- **Unpacked Arrays**:
		- 이건 reg unpacked_arr_name [7:0];이런식으로 선언하면 reg 자료형을 8개를 가진 것 
	    - 모든 데이터 타입 가능
	    - 개별 요소 접근
	    - 메모리 배열, FIFO 큐 등 개별 데이터 요소 표현에 유용
	    - 전체 프린트 불가능
```verilog
module packed_unpacked_data();

  // packed array
  bit [7:0] packed_array = 8'hAA; 
  // unpacked array
  reg unpacked_array [7:0] = '{0,0,0,0,0,0,0,1}; 
  
  initial begin
    $display ("packed array[0]   = %b", packed_array[0]); // packed_array[0]는 가장 오른쪽 비트를 나타냄
    $display ("unpacked array[0] = %b", unpacked_array[0]); // unpacked_array[0]는 첫 번째 요소를 나타냄
    $display ("packed array      = %b", packed_array); // 전체 packed 배열을 표시
    // 아래 코드는 잘못된 문법입니다.
    // $display("unpacked array[0] = %b",unpacked_array); // unpacked_array 전체는 표시할 수 없음
    #1  $finish;
  end
  
endmodule


out console result
packed array[0]   = 0
unpacked array[0] = 1
packed array      = 10101010
```

```verilog
# answer

`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    assign out_hi = in[15:8];
    assign out_lo = in[7:0];
endmodule
```

문제 : Vector Part Select
```verilog
module top_module( 
    input [31:0] in,
    output [31:0] out );//

    assign out[31:24] = in[7:0];
    assign out[23:16] = in[15:8];
    assign out[15:8] = in[23:16];
    assign out[7:0] = in[31:24];
	//assign out = {in[7:0], in[15:8], in[23:16], in[31:24]};
	//이렇게도 할수 있다 생각하자
endmodule
```

문제 : Bitwise Operators
```verilog
module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    assign out_or_bitwise = a | b;
    assign out_or_logical = a||b;
    assign out_not = {~b[2:0],~a[2:0] };
endmodule
```
![[Pasted image 20240710152331.png]]
- Bitwise Operator / Logical Opertor
	- Bitwise Or의 경우 '값'으로 나오나 Logical Operator의 경우 0아니면 1이다.
	- Logical Operator의 내부 연산은 각 자리수가 0이 아닌지 확인 하는 것
	- 또한 a, b가 output의 범위를 벗어나는 경우 
	```verilog
	assign out_or_bitwise = {3'b0, a} | {3'b0, b};
	```

문제 : Four -input gates
```verilog
module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    assign out_and = in[0] & in[1] & in[2] & in[3];
    assign out_or = in[0] | in[1] | in[2] | in[3];
    assign out_xor = in[0] ^ in[1] ^ in[2] ^ in[3];
endmodule
```

- 더 간단하게 나타낼 수 있다.
	- &in -> 배열 in의 모든 비트 And연산
```verilog
module top_module( 
    input [3:0] in,
    output out_and,
    output out_or,
    output out_xor
);
    assign out_and = &in;   // in 배열의 모든 비트를 AND 연산
    assign out_or = |in;    // in 배열의 모든 비트를 OR 연산
    assign out_xor = ^in;   // in 배열의 모든 비트를 XOR 연산
endmodule
```

문제 : Vector concatenation Operator
![[Pasted image 20240710154055.png]]
```verilog
module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    // assign { ... } = { ... };
    assign {w,x,y,z}={a,b,c,d,e,f,2'b11};
endmodule
```
- {}연산자는 '연결 연산자'
	- 신호들을 순서대로 연결하여 하나의 벡터로 만듬

문제 : Vector Reversal 1
```verilog
module top_module( 
    input [7:0] in,
    output [7:0] out
);
    assign out = {in[0],in[1],in[2],in[3],in[4],in[5],in[6],in[7]};
endmodule
```

문제 : Replication_operator

Example
{5{1'b1}}           // 5'b11111 (or 5'd31 or 5'h1f)
{2{a,b,c}}          // The same as {a,b,c,a,b,c}
{3'd5, {2{3'd6}}}   // 9'b101_110_110. It's a concatenation of 101 with
                    // the second vector, which is two copies of 3'b110.
                    
```verilog
module top_module (
    input [7:0] in,
    output [31:0] out );//

    assign out = { {24{in[7]}} , in[7:0] };

endmodule
```

문제 : More Replication
- 괄호가 매우 중요
![[Pasted image 20240716161321.png]]
```verilog
module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    // assign out = ~{ ... } ^ { ... };
    assign out = ~{{5{a}},{5{b}},{5{c}},{5{d}},{5{e}}}^{5{a,b,c,d,e}};

endmodule
```

## Section : Module Hierachy

문제 : Module
*Instantiation*-> 인스턴스화
![[Pasted image 20240717121456.png]]
- 이렇게 각 포트를 이어주는 작업을 말함
```verilog
module a( input wire in_a, output reg out_a ); 
... 
endmodule

module b( input wire in_b, output reg out_b ); 
... 
endmodule

module top_module( input wire x1, input wire x2, output reg y1, output reg y2 );
	//이어줘야 할 top_module
endmodule
```

- Named - .을 빼먹지 말것
- 더욱 정확하게 쓸 수 있는 룰
```verilog
module top_module( input wire x1, input wire x2, output reg y1, output reg y2 );
	a u_a( .in_a (x1), .out_a (y1) ); 
	b u_b( .in_b (x2), .out_b (y2) ); 
endmodule
	
```
- Positional - Port 위치가 바뀌면 연결이 잘못되어 버림
- mod_a나 mod_b의 내부 인자 이름 몰라도 쓸 수있는 룰
	```verilog
module top_module( input wire x1, input wire x2, output reg y1, output reg y2 );
	a u_a( x1,y1 ); 
	b u_b( x2,y2 ); 
endmodule
```

## 답안
```verilog
module top_module ( input a, input b, output out );
    mod_a instance_name (.out(out), .in1(a), .in2(b));
endmodule
```

문제 : Connecting Ports by Position
- 이 문제는 Positional Association문제임
- 들어가는 인자는 top_module의 것들이 들어감 / 순서 잘 지켜야 함
- ==근데 mod_a의 내부 인자의 이름을 몰라도 쓸 수 있음==
```verilog
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a ins1(out1,out2,a,b,c,d);
endmodule

```

문제 : Connecting Ports by name
- 이 문제는 named Association문제임
- 들어가는 인자는 ==.mod_a인자(top_module인자)== 형식임
```verilog
module top_module ( 
    input a, 
    input b, 
    input c,
    input d,
    output out1,
    output out2
);
    mod_a inst(.in1(a),.in2(b),.in3(c),.in4(d),.out1(out1),.out2(out2));
endmodule
```

문제 : Three Modules
![[Pasted image 20240717130220.png]]
- wire 생성해서 중간 결과값에 대해 전달 필요함
```verilog
module top_module ( input clk, input d, output q );
	wire wire1, wire2;
    my_dff ins1(.clk(clk), .d(d), .q(wire1);
    my_dff ins2(.clk(clk), .d(wire1), .q(wire2);
    my_dff ins3(.clk(clk), .d(wire2), .q(q);
endmodule
```

문제 : Module and vectors
- MUX를 처음 다루는 문제
![[Pasted image 20240718122202.png]]
```verilog
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
```

```verilog
module top_module (
	input clk,
	input [7:0] d,
	input [1:0] sel,
	output reg [7:0] q
);

	wire [7:0] o1, o2, o3;		// output of each my_dff8
	
	// Instantiate three my_dff8s
	my_dff8 d1 ( clk, d, o1 );
	my_dff8 d2 ( clk, o1, o2 );
	my_dff8 d3 ( clk, o2, o3 );

	// This is one way to make a 4-to-1 multiplexer
	always @(*)		// Combinational always block
		case(sel)
			2'h0: q = d;
			2'h1: q = o1;
			2'h2: q = o2;
			2'h3: q = o3;
		endcase

endmodule
```

문제 : Adder1
- 동일한 입력이 들어갈 수 없음 - .cin(carry), .cout(carry)불가능
![[Pasted image 20240718125641.png]]
```verilog
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
	wire carry, unused_count;
    wire [15:0] r1, r2;
    add16 ins1 (.a(a[15:0]), .b(b[15:0]), .sum(r1), .cin(0), .cout(carry));
    add16 ins2 (.a(a[31:16]), .b(b[31:16]), .sum(r2), .cin(carry), .cout(unused_count));
    assign sum = {r2, r1};
endmodule
```


문제 : Module Fadd(Adder2)
![[Pasted image 20240718131040.png]]
```verilog
module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire [15:0] r1, r2;
    wire carry;
    add16 ins1(.a(a[15:0]), .b(b[15:0]), .cin(0), .cout(carry), .sum(r1));
    add16 ins2(.a(a[31:16]), .b(b[31:16]), .cin(carry), .cout(), .sum(r2));
    assign sum = {r2,r1};
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
    assign sum = a^b^cin;
    assign cout = (a&b)|(a&cin)|(b&cin);
endmodule
```

문제 : carry select adder
![[Pasted image 20240718132525.png]]
```verilog
module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] r1, r2_0, r2_1, r2;
    wire sig, unused_count;
    
    add16 ins1(.a(a[15:0]) ,.b(b[15:0]) ,.cin(0), .cout(sig), .sum(r1));
    add16 ins2(.a(a[31:16]) ,.b(b[31:16]) ,.cin(0), .cout(unused_count), .sum(r2_0));
    add16 ins3(.a(a[31:16]) ,.b(b[31:16]) ,.cin(1), .cout(unused_count), .sum(r2_1));
    
    assign r2 = sig? r2_1 : r2_0;
    assign sum = {r2,r1};
endmodule
```

문제 : Adder subtractor
![[Pasted image 20240719104535.png]]
```verilog
module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
	wire carry, unused;
    wire [15:0] r1, r2;
    wire [31:0] temp;
    assign temp = b ^ {32{sub}};
    add16 ins1 (.a(a[15:0]), .b(temp[15:0]), .cin(sub), .cout(carry), .sum(r1));
    add16 ins2 (.a(a[31:16]), .b(temp[31:16]), .cin(carry), .cout(unused), .sum(r2));
    assign sum = {r2, r1};
endmodule
```

# Section : Verilog_Language -> Procedures
- Verilog의 조건문에는 if, else, repeat, while, for, case가 있음
# begin / end
- c의 함수에서 {}와 같은 의미
- 대부분 initial always forever if-else와 함께 사용
# initial
- 최초의 시작시점
- 시뮬레이션의 시작 시점 - 0ns
# always
- @ : sensitive list 이후 나오는 변수들이 변화에 따라 움직임
- 보통 always사용해 플립플롭을 모델링함(상승에지 posegde/ 하강 에지-negedge)
# fork - join
- 개별 process의 생성 및 수행
- join문에서 모든 process가 종료되면 서브루틴이 종료됨
- process를 parallel하게 수행
# if-else
- case의 표현식에 전체 bit를 사용할 수 있는게 아니면 if-else쓰는게 좋음
```verilog
example : 4:1 MUX
always @(*) 
	begin 
		if(sel == 'h0) 
			out = a; 
		else if(sel == 'h1) 
			out = b; 
		else if(sel == 'h2) 
			out = c; 
		else if(sel == 'h3) 
			out = d; 
	end
```
# case statement
- 초기값이나 defualt없으면 회로 합성시에 latch 발생시킴
```verilog
example : 4:1 MUX
always @(*) 
	begin 
		case(sel)
			0 : out = a;
			1 : out = b;
			2 : out = c;
			3 : out = d;
		default : out = 'bx;
	end
```
# Ternary Operator
- 삼항연산자 - 근데 연쇄도 가능함
```verilog
result = (expression) ? expression_a : expression_b;

example : 4:1 MUX
assign out = (sel == 0) ? a : 
			 (sel == 1) ? b : 
			 (sel == 2) ? c : d;
```
# for statement
```verilog
for( init_expression; cond_expression; loop_expression ) begin
	statements; 
end
```
# while statement
```verilog
while ( cond_expression ) begin 
	statements; 
end
```

문제 : always Blocks(combinational)
- combinational always Blocks == assign statements (두개로 표현가능)
![[Pasted image 20240719121423.png]]
```verilog
// synthesis verilog_input_version verilog_2001
module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);
	assign out_assign = a & b;
    always @(*) out_alwaysblock = a & b;
endmodule
```
문제 : Always Block(clocked)
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
```verilog
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
```

문제 : if statement
```verilog
// synthesis verilog_input_version verilog_2001
module top_module(
    input a,
    input b,
    input sel_b1,
    input sel_b2,
    output wire out_assign,
    output reg out_always   ); 
    assign out_assign = sel_b1&sel_b2 ? b : a;
    always @(*) begin
        if(sel_b1==1 && sel_b2 ==1)
            out_always = b;
        else
            out_always = a;
    end
        				

endmodule
```

문제 : if statement latches
- "출력을 변경하지 않고 유지"라는 동작은 상태 기억이 필요 -> latch 생성
- else 항상 쓸 것 of default값
```verilog
// synthesis verilog_input_version verilog_2001
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else
           shut_off_computer = 0;
    end

    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
        else 
           keep_driving = ~arrived;
    end

endmodule
```
