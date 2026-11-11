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

module mytff (enable, clear, clk, Q);
    input enable, clear, clk;
    output reg Q;

    always@(posedge clk)
    begin
        if (clear == 1'b0)
            Q <= 1'b0;    
        else if(enable == 1'b1)
            Q <= ~Q;
    end
endmodule

module part1 (SW, KEY, HEX1, HEX0);
    input [1:0] SW ;
    input [0:0] KEY ;
    output [6:0] HEX1, HEX0;

    //Use the KEY0 pushbutton as a manually-applied Clock input, switches SW1 and SW0 as Enable and Clear
    //inputs, respectively, and 7-segment displays HEX1-0 to show the hexadecimal count as your circuit operates.

    wire clk;
    wire enable, clear;
    wire [7:0] Q;

    assign clk = KEY[0];
    assign enable = SW[1];
    assign clear = SW[0];

    mytff T0(enable, clear, clk, Q[0]);
    mytff T1(enable & Q[0], clear, clk, Q[1]);
    mytff T2(enable & Q[0] & Q[1], clear, clk, Q[2]);
    mytff T3(enable & Q[0] & Q[1] & Q[2], clear, clk, Q[3]);
    mytff T4(enable & Q[0] & Q[1] & Q[2] & Q[3], clear, clk, Q[4]);
    mytff T5(enable & Q[0] & Q[1] & Q[2] & Q[3] & Q[4], clear, clk, Q[5]);
    mytff T6(enable & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5], clear, clk, Q[6]);
    mytff T7(enable & Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6], clear, clk, Q[7]);

    hex_decoder upper4bit (Q[7:4], HEX1);
    hex_decoder lower4bit (Q[3:0], HEX0);

endmodule

