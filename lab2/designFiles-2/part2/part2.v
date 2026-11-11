module part2 (SW, HEX1, HEX0);
    
    input [3:0] SW;
    output [0:6] HEX1, HEX0;

    //wire to split inputs
    wire [3:0] v;
    wire z;

    //assign values
    assign v = SW[3:0];
    assign z = v[3] & (v[1]|v[2]); //note: one | for or

    //set up a
    wire [3:0] a;

    //transform the v input into digits with new logic
    assign a[3] = 1'b0;
    assign a[2] = v[3] & v[2] & v[1];
    assign a[1] = v[3] & v[2] & ~v[1];
    assign a[0] = v[0];

    //d1
    wire [3:0] d0;

    assign d0[3] = (~z & v[3]) | (z & a[3]);
    assign d0[2] = (~z & v[2]) | (z & a[2]);
    assign d0[1] = (~z & v[1]) | (z & a[1]);
    assign d0[0] = (~z & v[0]) | (z & a[0]);

    //d1
    wire [3:0] d1;
    assign d1 = {3'b000, z};


    //7-segment HEX1, displays tens digit
    assign HEX1 = (d1 == 4'b0000) ? 7'b0111111 :
                  (d1 == 4'b0001) ? 7'b0000110 :
                                    7'b0000000;

    //7-segment HEX0, displays ones digit
    assign HEX0 = (d0 == 4'b0000) ? 7'b0111111 :
                  (d0 == 4'b0001) ? 7'b0000110 :
                  (d0 == 4'b0010) ? 7'b1011011 :
                  (d0 == 4'b0011) ? 7'b1001111 :
                  (d0 == 4'b0100) ? 7'b1100110 :
                  (d0 == 4'b0101) ? 7'b1101101 :
                  (d0 == 4'b0110) ? 7'b1111101 :
                  (d0 == 4'b0111) ? 7'b1000111 :
                  (d0 == 4'b1000) ? 7'b1111111 :
                  (d0 == 4'b1001) ? 7'b1100111 :
                                    7'b0000000;


endmodule