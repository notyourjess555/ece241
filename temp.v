module part1(SW, KEY, LEDR);

    input [1:0] SW;
    input [0:0] KEY;
    output [9:0] LEDR;

    reg [8:0] y;

    always @(posedge KEY[0]) begin
        if (SW[0] == 0)
            y <= 9'b000000001;
        else
            y <= 9'b000000000;
    end

    assign LEDR[8:0] = y;
    assign LEDR[9] = 1'b0;

endmodule
