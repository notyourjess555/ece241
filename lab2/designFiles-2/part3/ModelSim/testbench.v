`timescale 1ns / 1ps

module testbench ( );

	reg [8:0] SW;
    wire [9:0] LEDR;

	initial begin
		SW <= 0;
		#10 SW <= 9'b000000001;
		#10 SW <= 9'b000010001;
		#10 SW <= 9'b100010001;
		#10 SW <= 9'b000011110;
		#10 SW <= 9'b000011111;
		#10 SW <= 9'b011110001;
		#10 SW <= 9'b111100000;
	end // initial

	part3 U1 (SW, LEDR);

endmodule
