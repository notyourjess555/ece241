module part3 (KEY, CLOCK_50, HEX0);
    input [0:0] KEY;
    input CLOCK_50;
    output [6:0] HEX0;

    //fast counter

    reg [25:0] counter;
    reg enable;

    always@(posedge CLOCK_50)
    begin
        if(KEY[0] == 1'b0)
        begin
            counter <= 26'b0;
            enable <= 1'b0;
        end
        else if(counter != 26'd49999999)
        begin
            counter <= counter + 1'b1;
            enable <= 1'b0;
        end
        else if(counter == 26'd49999999)
        begin
            counter <= 26'b0;
            enable <= 1'b1;
        end
    end

    //slow counter

    reg [3:0] digits;

    always@(posedge CLOCK_50)
    begin
        if(KEY[0]==1'b0)
            digits <= 4'b0;
        else if (enable == 1'b1)
        begin
            if (digits == 4'b1001)
                digits <= 4'b0;
            else
                digits <= digits + 1'b1;
        end
    end

    //output
    wire [6:0] h;

    assign h = (digits == 4'b0000) ? 7'b0111111: //0
                (digits == 4'b0001) ? 7'b0000110: //1 
                (digits == 4'b0010) ? 7'b1011011: //2
                (digits == 4'b0011) ? 7'b1001111: //3
                (digits == 4'b0100) ? 7'b1100110: //4
                (digits == 4'b0101) ? 7'b1101101: //5
                (digits == 4'b0110) ? 7'b1111101: //6
                (digits == 4'b0111) ? 7'b1110001: //7
                (digits == 4'b1000) ? 7'b1111111: //8
                (digits == 4'b1001) ? 7'b1110111: //9
                                7'b0000000; //else if blank

    assign HEX0 = ~h;
    
        
endmodule