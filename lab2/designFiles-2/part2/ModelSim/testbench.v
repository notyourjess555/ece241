`timescale 1ns / 1ps

module testbench ( );

	reg [3:0] SW;
    wire [6:0] HEX1, HEX0;

	initial begin
		SW <= 0;
		#10 SW <= 1;
		#10 SW <= 2;
		#10 SW <= 3;
		#10 SW <= 4;
		#10 SW <= 9;
		#10 SW <= 10;
		#10 SW <= 11;
		#10 SW <= 12;
		#10 SW <= 13;
		#10 SW <= 14;
		#10 SW <= 15;
		#10 SW <= 16;
	end // initial

	part2 U1 (SW, HEX1, HEX0);

endmodule
