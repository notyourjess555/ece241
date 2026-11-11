module part2 (SW, KEY, LEDR);

    //define input and output ports
    input [1:0]SW;
    input [0:0]KEY;
    output [4:0]LEDR;

    //define signals
    wire w, clk;
    assign w = SW[1];
    assign clk = KEY[0];

    // y_Q = current state, Y_D = next state
    reg [3:0] y_Q, Y_D; 
    parameter A = 4'b0000, B = 4'b0001, C = 4'b0010, D = 4'b0011, E = 4'b0100,
    F = 4'b0101, G = 4'b0110, H = 4'b0111, I = 4'b1000;

    always @(w, y_Q)
    begin: state_table
        case (y_Q)
            A: if (!w) Y_D = B;
                else Y_D = F;

            B: if (!w) Y_D = C;
                else Y_D = F;
            C: if (!w) Y_D = D;
                else Y_D = F;
            D: if (!w) Y_D = E;
                else Y_D = F;

            E: if (!w) Y_D = E;
                else Y_D = F;
            
            F: if (!w) Y_D = B;
                else Y_D = G;
            G: if (!w) Y_D = B;
                else Y_D = H;
            H: if (!w) Y_D = B;
                else Y_D = I;

            I: if (!w) Y_D = B;
                else Y_D = I;

        default: Y_D = 4’b0000;
        endcase
    end // state_table
 

    always @(posedge clk)
    begin: state_FFS
        if(SW[0] == 1'b0)
            y_Q <= 4'b000;
        else
            y_Q <= Y_D;
    
    end // state_FFS
    
    
    //assignments for output z and the LEDs
    //output z = LEDR[4]
    assign LEDR[4]= (y_Q == E) | (y_Q == I); //1 if current state is in one of them

    //output state codes
    assign LEDR[3] = y_Q[3];
    assign LEDR[2] = y_Q[2];
    assign LEDR[1] = y_Q[1];
    assign LEDR[0] = y_Q[0];

endmodule
    