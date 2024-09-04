
- # Combinational Logic
- # Basic Gates

문제 : Wire
```verilog
module top_module (
    input in,
    output out);
	assign out =in;
endmodule
```

문제 : GND
```verilog
module top_module (
    output out);
	assign out =1'b0;
endmodule
```

문제 : NOR
```verilog
module top_module (
    input in1,
    input in2,
    output out);
    assign out = ~(in1|in2);
endmodule
```

문제 : Another Gate
```verilog
module top_module (
    input in1,
    input in2,
    output out);
    assign out = in1&~in2;
endmodule
```

문제 : Two Gates
```verilog
module top_module (
    input in1,
    input in2,
    input in3,
    output out);
	wire temp;
    assign temp = ~in1^in2;
    assign out = temp ^ in3;
endmodule
```

문제 : More Logic Gates
- NAND, NOR에 괄호 잘 붙일 것
```verilog
module top_module( 
    input a, b,
    output out_and,
    output out_or,
    output out_xor,
    output out_nand,
    output out_nor,
    output out_xnor,
    output out_anotb
);
    assign out_and = a&b;
    assign out_or= a|b;
    assign out_xor=a^b;
    assign out_nand=~a&b;
    assign out_nor=~(a|b);
    assign out_xnor=~a^b;
    assign out_anotb=a&~b;
endmodule

```

문제 : 7420chip
```verilog
module top_module ( 
    input p1a, p1b, p1c, p1d,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );

    assign p1y = ~(p1a&p1b&p1c&p1d);
    assign p2y = ~(p2a&p2b&p2c&p2d);
endmodule

```

문제 : Truth Table
- Sum of product
```verilog
module top_module( 
    input x3,
    input x2,
    input x1,  // three inputs
    output f   // one output
);
	wire temp1,temp2,temp3,temp4;
    assign temp1 = ~x3 & x2 & ~x1;
    assign temp2 = ~x3 & x2 & x1;
    assign temp3 = x3 & ~x2 & x1;
    assign temp4 = x3 & x2 & x1;
    assign f = temp1 | temp2 | temp3 | temp4;
endmodule
```

문제 : Two Bit equality
- A와 B의 두 비트가 같으면 1출력 아니면 0 출력
```verilog
module top_module ( input [1:0] A, input [1:0] B, output z ); 
	wire temp1, temp2;
    assign temp1 = A[0] ^ B[0];
    assign temp2 = A[1] ^ B[1];
    assign z = ~(temp1|temp2);
endmodule

//간단하게는 이렇게만 해도됨 
module top_module ( input [1:0] A, input [1:0] B, output z ); 
    assign z = (A==B);

endmodule
```

문제 : Simple Circuits A
```verilog
module top_module (input x, input y, output z);
	assign z= x&~y;
endmodule
```

문제 : Simple Circuits A
```verilog
module top_module ( input x, input y, output z );
    assign z= ~(x^y);
endmodule
```

문제 : Combine Circuits A and B
```verilog
module top_module (input x, input y, output z);
	wire temp1, temp2, temp3, temp4;
    mt2015_q4a ins1(x,y,temp1);
    mt2015_q4b ins2(x,y,temp2);
    assign temp3 = temp1|temp2;
    assign temp4 = temp1&temp2;
    assign z = temp3^temp4;
endmodule

module mt2015_q4a (input x, input y, output z);
	assign z= x&~y;
endmodule

module mt2015_q4b ( input x, input y, output z );
    assign z= ~(x^y);
endmodule
```

문제 : Ring or Vibrate
```verilog
module top_module (
    input ring,
    input vibrate_mode,
    output ringer,       // Make sound
    output motor         // Vibrate
);
	assign ringer = ring&~vibrate_mode;
    assign motor = ring&vibrate_mode;
endmodule
```

문제 : Thermostat
```verilog
module top_module (
    input too_cold,
    input too_hot,
    input mode,
    input fan_on,
    output heater,
    output aircon,
    output fan
); 
	assign heater = mode & too_cold;
	assign aircon = ~mode & too_hot;
	assign fan = heater | aircon | fan_on;

endmodule
```

문제 : 3-bits population count
```verilog
module top_module( 
    input [2:0] in,
    output [1:0] out );
    assign out = in[0] + in[1] + in[2];
endmodule
```

문제 : Gates and Vectors
```verilog
module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
    
    assign out_both[2] = in[3]&in[2];
    assign out_both[1] = in[2]&in[1];
    assign out_both[0] = in[1]&in[0];
    
    assign out_any[3] = in[3]|in[2];
    assign out_any[2] = in[2]|in[1];
    assign out_any[1] = in[1]|in[0];
    
    assign out_different[3] = in[0] ^ in[3];
    assign out_different[2] = in[2] ^ in[3];
    assign out_different[1] = in[1] ^ in[2];
    assign out_different[0] = in[0] ^ in[1];

endmodule
```

문제 : Even loog Vectors
```verilog
module top_module( 
    input [99:0] in,
    output [98:0] out_both,
    output [99:1] out_any,
    output [99:0] out_different );
	
    genvar i;
    generate
        for(i=0;i<99;i=i+1) begin: loop
            assign out_both[i] = in[i+1]&in[i];
            assign out_any[i+1] = in[i+1]|in[i];
            assign out_different[i] = in[i]^in[i+1];
        end
    endgenerate
    assign out_different[99] = in[0]^in[99];
endmodule
```