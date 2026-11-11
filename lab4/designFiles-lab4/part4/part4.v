module part4(CLOCK_50, HEX0,HEX1, HEX2, HEX3, HEX4, HEX5);


    input CLOCK_50;
	output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
    wire [6:0] d, e, one, blank;
	
	assign d = 7'b1011110; 
    assign e = 7'b1111001;
    assign one = 7'b0000110;
    assign blank = 7'b0000000;

    //fast counter

    reg [25:0] counter;
    reg enable;

    always@(posedge CLOCK_50)
    begin
        if(counter != 26'd49999999)
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

    reg [2:0] position;

    always@(posedge CLOCK_50)
    begin
        if (enable == 1'b1)
        begin
            if (position == 3'd5)
            begin
                position <= 3'b0;
            end
            else
                position <= position + 1'b1;
        end
    end

    //output
    wire [6:0] h0, h1, h2, h3, h4, h5;
    
    assign h0 = (position == 0) ? one:
                (position == 4) ? d:
                (position == 5) ? e:
                            blank;

    assign h1 = (position == 0) ? e:
                (position == 1) ? one:
                (position == 5) ? d:
                            blank;

    assign h2 = (position == 0) ? d:
                (position == 1) ? e:
                (position == 2) ? one:
                            blank;

    assign h3 = (position == 1) ? d:
                (position == 2) ? e:
                (position == 3) ? one:
                            blank;

    assign h4 = (position == 2) ? d:
                (position == 3) ? e:
                (position == 4) ? one:
                            blank;

    assign h5 = (position == 3) ? d:
                (position == 4) ? e:
                (position == 5) ? one:
                            blank;
    
    assign HEX0 = ~h0;
    assign HEX1 = ~h1;
    assign HEX2 = ~h2;
    assign HEX3 = ~h3;
    assign HEX4 = ~h4;
    assign HEX5 = ~h5;
    
        
endmodule