module full_adder(a, b, ci, s, co);

    input a, b, ci;
    output s, co;

    //s  = a XOR b XOR ci
    //co = ab + aci + bci
    
    assign s  = a ^ b ^ ci;
    assign co = (a & b) | (a & ci) | (b & ci);

endmodule

module part3(SW, LEDR);

    input [8:0] SW;
    output [9:0] LEDR;

    wire [3:0] A;
    wire [3:0] B;
    wire [3:0] S;
    
    wire c1, c2, c3;
    wire cout;

    assign A = SW[7:4];
    assign B = SW[3:0];

    //reuse functions
    full_adder FA0(
        A[0], B[0], SW[8],
        S[0], c1
    );

    full_adder FA1(
        A[1], B[1], c1,
        S[1], c2
    );

    full_adder FA2(
        A[2], B[2], c2,
        S[2], c3
    );

    full_adder FA3(
        A[3], B[3], c3,
        S[3], cout
    );

    assign LEDR[4] = cout;
    assign LEDR[3] = S[3];
    assign LEDR[2] = S[2];
    assign LEDR[1] = S[1];
    assign LEDR[0] = S[0];

endmodule