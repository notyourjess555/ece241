module ff(D, clk, Q);

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
    ff A(D0, clk, y[0]);
    ff B(D1, clk, y[1]);
    ff C(D2, clk, y[2]);
    ff D(D3, clk, y[3]);
    ff E(D4, clk, y[4]);
    ff F(D5, clk, y[5]);
    ff G(D6, clk, y[6]);
    ff H(D7, clk, y[7]);
    ff I(D8, clk, y[8]);

    //output z = LEDR[9]
    assign LEDR[9]= y[4]| y[8];

    //output state codes
    assign LEDR[8:0] = y;
   
endmodule
