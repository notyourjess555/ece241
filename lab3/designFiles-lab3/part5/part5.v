module hex_decoder(X, HEX);

    input [3:0] X;
    output [6:0] HEX;

    wire [6:0] h;

    assign h = (X == 4'h0) ? 7'b0111111 :
                 (X == 4'h1) ? 7'b0000110 :
                 (X == 4'h2) ? 7'b1011011 :
                 (X == 4'h3) ? 7'b1001111 :
                 (X == 4'h4) ? 7'b1100110 :
                 (X == 4'h5) ? 7'b1101101 :
                 (X == 4'h6) ? 7'b1111101 :
                 (X == 4'h7) ? 7'b0000111 :
                 (X == 4'h8) ? 7'b1111111 :
                 (X == 4'h9) ? 7'b1101111 :
                 (X == 4'hA) ? 7'b1110111 :
                 (X == 4'hB) ? 7'b1111100 :
                 (X == 4'hC) ? 7'b0111001 :
                 (X == 4'hD) ? 7'b1011110 :
                 (X == 4'hE) ? 7'b1111001 :
                               7'b1110001;
    assign HEX = ~h;

endmodule

module part5 (SW, KEY, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, LEDR);
    input [7:0] SW;
    input [1:0] KEY;
    output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
    output [9:0] LEDR;

    //register
    reg [7:0] A_reg;

    always @(posedge KEY[1], negedge KEY[0])
    begin
        //if key 0 is pressed
        if(!KEY[0])
        begin
            A_reg <= 8'b0; //set stored value back to 0
        end
        else
        begin
            A_reg <= SW; //equals to switch value
        end
    end

    //9 bit consider an possible carryout
    wire [8:0] S;

    //add the numbers A and B
    assign S = {1'b0, A_reg} + {1'b0, SW}; //add a zero infront for possible carry out
    
    //wire
    wire [3:0] A_hi, A_lo, B_hi, B_lo, S_hi, S_lo;
    // A: stored number 
    assign A_hi = A_reg[7:4];
    assign A_lo = A_reg[3:0];

    // B: switches
    assign B_hi = SW[7:4];
    assign B_lo = SW[3:0];

    //sum
    assign S_hi = S[7:4];
    assign S_lo = S[3:0];

    hex_decoder h5 (S_hi, HEX5);
    hex_decoder h4 (S_lo, HEX4);

    hex_decoder h3 (A_hi, HEX3);
    hex_decoder h2 (A_lo, HEX2);

    hex_decoder h1 (B_hi, HEX1);
    hex_decoder h0 (B_lo, HEX0);

    //carry out
    assign LEDR[0] = S[8];
    assign LEDR[9:1] = 9'b0;

endmodule
