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

module part2 (SW, KEY, HEX3, HEX2, HEX1, HEX0);

    input [1:0] SW ;
    input [0:0] KEY ;
    output [6:0] HEX3, HEX2, HEX1, HEX0;

    wire clk;
    wire enable, clear;
    reg [15:0] Q;

    assign clk = KEY[0];
    assign enable = SW[1];
    assign clear = SW[0];

    always@ (posedge clk)
    begin
        if(clear == 1'b0)
            Q <= 16'b0;
        else if (enable == 1'b1)
            Q <= Q + 1'b1;
    end

    hex_decoder hex3 (Q[15:12],HEX3);
    hex_decoder hex2 (Q[11:8],HEX2);
    hex_decoder hex1 (Q[7:4],HEX1);
    hex_decoder hex0 (Q[3:0],HEX0);


endmodule

