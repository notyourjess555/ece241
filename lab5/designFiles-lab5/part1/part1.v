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
    wire [8:0] y;
    assign w = SW[1];
    assign clk = KEY[0];

    //assign the logic
    assign D0 = ~SW[0];
    assign D1 = (y[0]| y[5] | y[6] | y[7] | y[8]) & ~w & SW[0];
    assign D2 = y[1] & ~w & SW[0];
    assign D3 = y[2] & ~w & SW[0];
    assign D4 = (y[3] | y[4]) & ~w & SW[0];
    assign D5 = (y[0] | y[1] | y[2] | y[3] | y[4]) & SW[0] & w;
    assign D6 = y[5] & w & SW[0];
    assign D7 = y[6] & w & SW[0];
    assign D8 = (y[7] | y[8]) & w & SW[0];

    //assign the dff
    Dff A(D0, clk, y[0]);
    Dff B(D1, clk, y[1]);
    Dff C(D2, clk, y[2]);
    Dff D(D3, clk, y[3]);
    Dff E(D4, clk, y[4]);
    Dff F(D5, clk, y[5]);
    Dff G(D6, clk, y[6]);
    Dff H(D7, clk, y[7]);
    Dff I(D8, clk, y[8]);

    //output z = LEDR[9]
    assign LEDR[9]= y[4]| y[8];

    //output state codes
    assign LEDR[8] = y[8];
    assign LEDR[7] = y[7];
    assign LEDR[6] = y[6];
    assign LEDR[5] = y[5];
    assign LEDR[4] = y[4];
    assign LEDR[3] = y[3];
    assign LEDR[2] = y[2];
    assign LEDR[1] = y[1];
    assign LEDR[0] = y[0];

endmodule
