module Dff(D, clk, Q);

    input D, clk;
    output reg Q;

    always@(posedge clk)
    begin
        Q<=D;
    end

endmodule

module part1(SW, KEY, LEDR);

    input [1:0]SW;
    input [0:0]KEY;
    output [9:0]LEDR;

    wire D0, D1, D2, D3, D4, D5, D6, D7, D8;
    wire w, clk;
    wire y0, y1, y2, y3, y4, y5, y6, y7, y8;
    assign w = SW[1];
    assign clk = KEY[0];

    //assign the logic
    assign D0 = SW[0];
    assign D1 = (~y0 | y5 | y6 | y7 | y8) & ~w & SW[0];
    assign D2 = y1 & ~w & SW[0];
    assign D3 = y2 & ~w & SW[0];
    assign D4 = (y3 | y4) & ~w & SW[0];
    assign D5 = (~y0 | y1 | y2 | y3 | y4) & SW[0] & w;
    assign D6 = y5 & w & SW[0];
    assign D7 = y6 & w & SW[0];
    assign D8 = (y7 | y8) & w & SW[0];

    //assign the dff
    Dff A(D0, clk, y0);
    Dff B(D1, clk, y1);
    Dff C(D2, clk, y2);
    Dff D(D3, clk, y3);
    Dff E(D4, clk, y4);
    Dff F(D5, clk, y5);
    Dff G(D6, clk, y6);
    Dff H(D7, clk, y7);
    Dff I(D8, clk, y8);

    //output z = LEDR[9]
    assign LEDR[9]= y4 | y8;

    //output state codes
    assign LEDR[8] = y8;
    assign LEDR[7] = y7;
    assign LEDR[6] = y6;
    assign LEDR[5] = y5;
    assign LEDR[4] = y4;
    assign LEDR[3] = y3;
    assign LEDR[2] = y2;
    assign LEDR[1] = y1;
    assign LEDR[0] = y0;

endmodule