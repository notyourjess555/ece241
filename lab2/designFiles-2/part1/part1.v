module part1 (SW, LEDR, HEX1, HEX0);

    input [7:0] SW;
    output [7:0] LEDR;
    output [6:0] HEX1, HEX0;

    //make wire to connect 
    wire [3:0] x;
    wire [3:0] y;

    assign x = SW[7:4];
    assign y = SW[3:0];

    //assign the led
    assign LEDR = SW;

    //assign the logic for x
    assign HEX1 = (x == 4'b0000) ? 7'b0111111: //0
                (x == 4'b0001) ? 7'b0000110: //1 
                (x == 4'b0010) ? 7'b1011011: //2
                (x == 4'b0011) ? 7'b1001111: //3
                (x == 4'b0100) ? 7'b1100110: //4
                (X == 4'b0101) ? 7'b1101101: //5
                (x == 4'b0110) ? 7'b1111101: //6
                (x == 4'b0111) ? 7'b1000111: //7
                (x == 4'b1000) ? 7'b1111111: //8
                (x == 4'b1001) ? 7'b1100111: //9
                                7'b0000000; //else if blank

    //assign the logic for y
    assign HEX0 = (y == 4'b0000) ? 7'b0111111: //0
                (y == 4'b0001) ? 7'b0000110: //1 
                (y == 4'b0010) ? 7'b1011011: //2
                (y == 4'b0011) ? 7'b1001111: //3
                (y == 4'b0100) ? 7'b1100110: //4
                (y == 4'b0101) ? 7'b1101101: //5
                (y == 4'b0110) ? 7'b1111101: //6
                (y == 4'b0111) ? 7'b1000111: //7
                (y == 4'b1000) ? 7'b1111111: //8
                (y == 4'b1001) ? 7'b1100111: //9
                                7'b0000000; //else if blank

endmodule