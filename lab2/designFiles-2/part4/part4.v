module full_adder(a, b, ci, s, co);

    input a, b, ci;
    output s, co;

    assign s = a ^ b ^ ci;
    assign co = (a & b) | (a & ci) | (b & ci);

endmodule

module part4 (SW, LEDR, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
    input [8:0] SW;
    output [9:0] LEDR;
    output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;

    //get x, y and cin
    wire [3:0] X;
    wire [3:0] Y;
    wire cin;

    assign X = SW[7:4];
    assign Y = SW[3:0];
    assign cin = SW[8];

    //bad x and y (larger than 9)
    wire badX;
    wire badY;

    //0 if under 9, 1 when over
    assign badX = X[3] & (X[2] | X[1]);
    assign badY = Y[3] & (Y[2] | Y[1]);

    //LEDR9 turns on if either input is not a valid BCD digit
    assign LEDR[9] = badX | badY;

    wire [4:0] T; //make t the binary answer, 5 bits
    wire c1, c2, c3;

    full_adder FA0(X[0], Y[0], cin, T[0], c1);
    full_adder FA1(X[1], Y[1], c1,  T[1], c2);
    full_adder FA2(X[2], Y[2], c2,  T[2], c3);
    full_adder FA3(X[3], Y[3], c3,  T[3], T[4]);

    //check if T > 9 
    wire z;

    assign z = T[4] | (T[3] & (T[2] | T[1]));

    //Calculate the BCD ones digit
    wire [3:0] S0;
    wire [3:0] corrected;

    assign corrected = T[3:0] + 4'b0110; 


    //for the tens
    //select T if z = 0 | Select corrected if z = 1

    assign S0[0] = (~z & T[0]) | (z & corrected[0]);
    assign S0[1] = (~z & T[1]) | (z & corrected[1]);
    assign S0[2] = (~z & T[2]) | (z & corrected[2]);
    assign S0[3] = (~z & T[3]) | (z & corrected[3]);

    //Tens digit
    wire S1;
    assign S1 = z; //either 0 or 1, based on z


    //result to LEDs, raw binary sum
    assign LEDR[4] = T[4];
    assign LEDR[3] = T[3];
    assign LEDR[2] = T[2];
    assign LEDR[1] = T[1];
    assign LEDR[0] = T[0];


    /// 7-segment displays
    // X on HEX5
    // Y on HEX3
    // S1 on HEX1
    // S0 on HEX0

    //from part II
    
    assign HEX5 = (X == 4'b0000) ? 7'b0111111 :
                (X == 4'b0001) ? 7'b0000110 :
                (X == 4'b0010) ? 7'b1011011 :
                (X == 4'b0011) ? 7'b1001111 :
                (X == 4'b0100) ? 7'b1100110 :
                (X == 4'b0101) ? 7'b1101101 :
                (X == 4'b0110) ? 7'b1111101 :
                (X == 4'b0111) ? 7'b1000111 :
                (X == 4'b1000) ? 7'b1111111 :
                (X == 4'b1001) ? 7'b1100111 :
                                    7'b0000000;


    // 7-segment display Y on HEX3
    assign HEX3 = (Y == 4'b0000) ? 7'b0111111 :
                (Y == 4'b0001) ? 7'b0000110 :
                (Y == 4'b0010) ? 7'b1011011 :
                (Y == 4'b0011) ? 7'b1001111 :
                (Y == 4'b0100) ? 7'b1100110 :
                (Y == 4'b0101) ? 7'b1101101 :
                (Y == 4'b0110) ? 7'b1111101 :
                (Y == 4'b0111) ? 7'b1000111 :
                (Y == 4'b1000) ? 7'b1111111 :
                (Y == 4'b1001) ? 7'b1100111 :
                                    7'b0000000;


    // 7-segment display tens digit S1 on HEX1
    assign HEX1 = (S1 == 1'b0) ? 7'b0111111 :
                                    7'b0000110;


    // 7-segment display ones digit S0 on HEX0
    assign HEX0 = (S0 == 4'b0000) ? 7'b0111111 :
                (S0 == 4'b0001) ? 7'b0000110 :
                (S0 == 4'b0010) ? 7'b1011011 :
                (S0 == 4'b0011) ? 7'b1001111 :
                (S0 == 4'b0100) ? 7'b1100110 :
                (S0 == 4'b0101) ? 7'b1101101 :
                (S0 == 4'b0110) ? 7'b1111101 :
                (S0 == 4'b0111) ? 7'b1000111 :
                (S0 == 4'b1000) ? 7'b1111111 :
                (S0 == 4'b1001) ? 7'b1100111 :
                                    7'b0000000;
    
    //nothing on these
    assign HEX4 = 7'b1111111;
    assign HEX2 = 7'b1111111;


endmodule