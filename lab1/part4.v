module part4 (SW, LEDR, HEX0);
	
	//note: 7-segment display turns ON when its output is 0
	
	input [1:0] SW;
	output [9:0] LEDR;
	output [6:0] HEX0;
	
	wire [1:0]X;
	wire [6:0] h;
	
	assign X = SW; //to the sw
	//logic
	// 00 = d
	// 01 = E
	// 10 = 1
	// 11 = blank
	
	//nested ternary operator
	assign h = (X == 2'b00) ? 7'b1011110 :   // d
           (X == 2'b01) ? 7'b1111001 :   // E
           (X == 2'b10) ? 7'b0000110 :   // 1
                          7'b0000000;     // blank
								  
	assign HEX0 = ~h; //flip
	assign LEDR = 10'b0000000000;

endmodule