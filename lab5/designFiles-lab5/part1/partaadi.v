module part1(SW, LEDR, KEY);
	input [1:0] SW;
	input [0:0] KEY;
	output [9:0] LEDR;
	wire w;
	assign w = SW[1];
	wire clock;
	assign clock = KEY[0];
	wire reset;
	assign reset = SW[0];
	wire [8:0] Y;
	wire [8:0] y;
	assign LEDR[8:0] = y;
	
	wire z;
	
	
	assign Y[0] = (y[1] | y[2] | y[3] | y[4] | y[5] | y[6] | y[7] | y[8]);
	assign Y[1] = !z & (y[0] | y[5] | y[6] | y[7] | y[8]); 
	assign Y[2] = !z & y[1];
	assign Y[3] = !z & y[2];
	assign Y[4] = !z & (y[3] | y[4]);
	assign Y[5] = z & (y[0] | y[1] | y[2] | y[3] | y[4]);
	assign Y[6] = z & y[5];
	assign Y[7] = z & y[6];
	assign Y[8] = z & (y[7] | y[8]);
	
	ff f0(clock, reset, Y[0], y[0]);
	ff f1(clock, reset, Y[1], y[1]);
	ff f2(clock, reset, Y[2], y[2]);
	ff f3(clock, reset, Y[3], y[3]);
	ff f4(clock, reset, Y[4], y[4]);
	ff f5(clock, reset, Y[5], y[5]);
	ff f6(clock, reset, Y[6], y[6]);
	ff f7(clock, reset, Y[7], y[7]);
	ff f8(clock, reset, Y[8], y[8]);
	assign z = y[4] | y[8];
	assign LEDR[9] = z;
endmodule
