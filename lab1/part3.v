module part3(SW, LEDR);
	
	
	input [9:0] SW; 
	output [9:0] LEDR;

	// 2-bit 3-to-1 multiplexer
	// SW[9:8] = input
	// SW[5:4] = U, SW[3:2] = V, SW[1:0] = W
	//set them on or off

	assign LEDR[1:0] = (SW[9:8] == 2'b00) ? SW[5:4] : //u
			(SW[9:8] == 2'b01) ? SW[3:2] : //v
			SW[1:0]; //if neither of the first two conditions, then output W."

	//unused LEDs off
	assign LEDR[9:2] = 8'b00000000;

endmodule