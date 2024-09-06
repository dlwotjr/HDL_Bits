BLOG!!
https://dlwotjr11101.tistory.com/15

문제 : 3-variable
![[Pasted image 20240905101945.png]]
```verilog
module top_module(
    input a,
    input b,
    input c,
    output out  ); 
	// a=1 | b=1 | c=1
    assign out = a|b|c;
endmodule
```

문제 : 4-variable_1
![[Pasted image 20240905165239.png]]
```verilog
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = (~b&~c) | (~a&~d) | (b&c&d) | (a&c&d);
endmodule
```

문제 : 4-variable_2
![[Pasted image 20240905165618.png]]
```verilog
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = (~b&c)|(a&c)|(a);
endmodule
```

문제 : 4-variable_3
![[Pasted image 20240905165736.png]]
- 이렇게 카르노 맵으로 보았을때 엮일수 없는 해당 격자 그림이 가장 cost가 큰 것임
```verilog
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 

    assign out = (~a&b&~c&~d)|(a&~b&~c&~d)|(~a&~b&~c&d)|(a&b&~c&d)|(~a&b&c&d)|(a&~b&c&d)|(~a&~b&c&~d)|(a&b&c&~d);
    
endmodule
```

문제 : minimum SOP and POS
- 계속 틀렸었는데 그 이유는 ab와 cd의 위치를 바꿔 표시했기 때문 그림에서도 두개를 바꿔 생각해야함
![[Pasted image 20240905175259.png]]
```verilog
module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 
    assign out_sop = (c&d)|(~a&~b&c);
    assign out_pos = ~((~c)|(a&~b)|(b&~d));
endmodule
```

문제 : k-map_1
![[Pasted image 20240905175731.png]]
```verilog
module top_module (
    input [4:1] x, 
    output f );
    assign f = (~x[1]&x[3])|(x[2]&~x[3]&x[4]);
endmodule
```

문제 : k-map_2
![[Pasted image 20240905180248.png]]
```verilog
module top_module (
    input [4:1] x,
    output f
); 
    assign f = (~x[2]&~x[4])|(~x[1]&x[3])|(x[2]&x[3]&x[4]);
endmodule
```

문제 : K-map implemented with a MUX
![[Pasted image 20240905194820.png]]
```verilog
//나의 답안
module top_module (
    input wire a,
    input wire b,
    input wire c,
    input wire d,
    output reg [3:0] mux_in
); 
    always @(*) begin
        if (c== 0 && d == 0) 
            mux_in = 4'b0100;
        else if (c == 0 && d == 1) 
            mux_in = 4'b0001;
        else if (c == 1 && d == 0) 
            mux_in = 4'b0101;
        else 
            mux_in = 4'b1001;
    end
endmodule

//solution
module top_module (
	input c,
	input d,
	output [3:0] mux_in
);
	
	// After splitting the truth table into four columns,
	// the rest of this question involves implementing logic functions
	// using only multiplexers (no other gates).
	// I will use the conditional operator for each 2-to-1 mux: (s ? a : b)
	assign mux_in[0] = c ? 1 : d;          // 1 mux:   c|d
	assign mux_in[1] = 0;                  // No muxes:  0
	assign mux_in[2] = d ? 0 : 1;          // 1 mux:    ~d
	assign mux_in[3] = c ? d : 0;          // 1 mux:   c&d
	
endmodule
```