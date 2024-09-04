
## 문제 : Half Adder
```verilog
module top_module( 
    input a, b,
    output cout, sum );
	
    assign sum = a ^ b;
    assign cout = a&b;
    
endmodule
```

## 문제 : Full Adder
```verilog
module top_module( 
    input a, b, cin,
    output cout, sum );

    assign sum = a^ b ^ cin;
    assign cout = a&b | a&cin | b&cin;
    
endmodule
```

## 문제 : 3-bit binary adder
```verilog
module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    full_adder ins1(.a(a[0]), .b(b[0]), .cin(cin), .cout(cout[0]), .sum(sum[0]));
    full_adder ins2(.a(a[1]), .b(b[1]), .cin(cout[0]), .cout(cout[1]), .sum(sum[1]));
    full_adder ins3(.a(a[2]), .b(b[2]), .cin(cout[1]), .cout(cout[2]), .sum(sum[2]));
    
endmodule


module full_adder( 
    input a, b, cin,
    output cout, sum );

    assign sum = a^ b ^ cin;
    assign cout = a&b | a&cin | b&cin;
    
endmodule
```

## 문제: Adder
![[Pasted image 20240904113743.png]]
```verilog
module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);

    wire [2:0] cout;
    full_adder ins1(.a(x[0]), .b(y[0]), .cin(0), .cout(cout[0]), .sum(sum[0]));
    full_adder ins2(.a(x[1]), .b(y[1]), .cin(cout[0]), .cout(cout[1]), .sum(sum[1]));
    full_adder ins3(.a(x[2]), .b(y[2]), .cin(cout[1]), .cout(cout[2]), .sum(sum[2]));
    full_adder ins4(.a(x[3]), .b(y[3]), .cin(cout[2]), .cout(sum[4]), .sum(sum[3]));
    
endmodule

module full_adder( 
    input a, b, cin,
    output cout, sum );

    assign sum = a^ b ^ cin;
    assign cout = a&b | a&cin | b&cin;
    
endmodule
```

## 문제 : Sigend Addition Overflow
8-Bit 2의 보수 a,b가 있을 때 sum과 overflow가 났는지 확인하는 문제
```verilog
module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
); 
 
    assign s = a+b;
    assign overflow = (a[7] == b[7]) && (s[7] != a[7]);

endmodule
```

## 문제 : 100-bit binary adder
나의 답안 :
```verilog
module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
	
    wire [100:0] sum_result; 
    assign sum_result = a+b+cin;
    assign sum = sum_result[99:0];
    assign cout = sum_result[100];
    
endmodule
```
문제에서 요구한 답안 :
```verilog
module top_module (
	input [99:0] a,
	input [99:0] b,
	input cin,
	output cout,
	output [99:0] sum
);

	// The concatenation {cout, sum} is a 101-bit vector.
	assign {cout, sum} = a+b+cin;

endmodule
```
- 벡터니까 되는 것임!

## 문제 : 4-digit BCD Adder
```verilog
module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum
);

    wire carry1, carry2, carry3;

    bcd_fadd ins1 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .cout(carry1), .sum(sum[3:0]));
    bcd_fadd ins2 (.a(a[7:4]), .b(b[7:4]), .cin(carry1), .cout(carry2), .sum(sum[7:4]));
    bcd_fadd ins3 (.a(a[11:8]), .b(b[11:8]), .cin(carry2), .cout(carry3), .sum(sum[11:8]));
    bcd_fadd ins4 (.a(a[15:12]), .b(b[15:12]), .cin(carry3), .cout(cout), .sum(sum[15:12]));

endmodule
```