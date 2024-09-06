/*

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
*/

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

/*
out console result
packed array[0]   = 0
unpacked array[0] = 1
packed array      = 10101010
*/