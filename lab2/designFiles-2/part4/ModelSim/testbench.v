`timescale 1ns / 1ps

module testbench ( );

	reg [8:0] SW;
    wire [9:0] LEDR;
    wire [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

	initial begin
		SW <= 0;
		#10 SW[3:0] <= 4'b0001;
		#10 SW[7:4] <= 4'b0001;
		#10 SW[7:4] <= 4'b1000;
		#10 SW[7:4] <= 4'b1001;
		#10 SW[3:0] <= 4'b0010;
		#10 SW[3:0] <= 4'b0011;
		#10 SW[3:0] <= 4'b0110;
		#10 SW[3:0] <= 4'b0111;
		#10 SW[3:0] <= 4'b1000;
		#10 SW[3:0] <= 4'b1001;
        #10 SW[8] <= 1'b1;
		#10 SW[3:0] <= 4'b1010;                  // should set LEDR[9]
		#10 SW[3:0] <= 4'b0; SW[7:4] <= 4'b1100; // should set LEDR[9]
	end // initial

	part4 U1 (SW[8:0], LEDR, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);

endmodule
