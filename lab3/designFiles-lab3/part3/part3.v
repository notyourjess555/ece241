module D_latch (D, Clk, Qa, Qb);

    input Clk, D;
    output Qa, Qb;

    wire R, S;
    wire R_g, S_g;

    assign R = ~D;
    assign S = D;

    //NAND gates
    assign S_g = ~(S & Clk); 
    assign R_g = ~(R & Clk);

    assign Qa = ~(S_g & Qb);
    assign Qb = ~(R_g & Qa);

endmodule

module part3 (SW, LEDR);

    input [1:0]SW;
    output[9:0] LEDR;

    wire Qm, Qm_bar, Qs, Qs_bar;

    D_latch Master(SW[0], ~SW[1], Qm, Qm_bar);
    D_latch Slave(Qm, SW[1],Qs, Qs_bar);

    //SW0 to drive the D input of your flip-flop
    //SW1 as the Clock input. Connect the Q output to LEDR0.

    assign LEDR[0] = Qs;
    assign LEDR[9:1] = 9'b0;
endmodule

//when simulate it, change D while the clock is high. The output should not follow D immediately; 
//it should remain unchanged until the next positive edge captures the appropriate value.