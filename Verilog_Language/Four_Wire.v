module top_module( 
    input a,b,c,
    output w,x,y,z );
assign {w,x,y,z} = {a,b,b,c};
//assign w = a;
//assign x = b;
//assign y = b;
//assign z = c;->이런식으로 하는 것도 가능하지만 위의 것이 더 짧으니까 좋다
endmodule