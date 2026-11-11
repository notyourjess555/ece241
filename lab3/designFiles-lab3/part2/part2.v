module D_latch (Clk, D, Q);

    input Clk, D;
    output Q;

    wire R, S, Qb;
    wire R_g, S_g;

    assign R = ~D;
    assign S = D;

    //NAND gates
    assign S_g = ~(S & Clk); 
    assign R_g = ~(R & Clk);

    assign Q = ~(S_g & Qb);
    assign Qb = ~(R_g & Q);

endmodule

module part2 (SW, LEDR);
    input [1:0] SW;
    output [9:0] LEDR;

    //SW0 to drive the D input of the latch
    //SW1 as the Clk input. 
    //Connect the Q output to LEDR0.
    
    wire Qa;
    D_latch my_latch (SW[0], SW[1], Qa);

    assign LEDR[0]= Qa;
    assign LEDR[9:1] = 9'b0;

endmodule