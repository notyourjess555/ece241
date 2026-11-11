module part3 (SW, CLOCK_50, KEY, LEDR);
    input [2:0] SW;
    input [1:0] KEY;
    input CLOCK_50;
    output [0:0] LEDR;

    //clock section
    reg [25:0] counter;
    reg enable;

    always@(posedge CLOCK_50)
    begin
        if(KEY[0] == 1'b0)
        begin
            counter <= 26'b0;
            enable <= 1'b0;
        end
        else if(counter != 26'd24999999)
        begin
            counter <= counter + 1'b1;
            enable <= 1'b0;
        end
        else if(counter == 26'd24999999)
        begin
            counter <= 26'b0;
            enable <= 1'b1;
        end
    end


    //cases
    wire [2:0] alphabet;
    assign alphabet = SW[2:0];

    parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100,
    F = 3'b101, G = 3'b110, H = 3'b111;

    reg [10:0] morsecode;
    reg [3:0] morselen;

    //1 on, 0 off
    always @(*)
    begin
        case (alphabet)
            A: 
            begin
                morsecode = 11'b10111000000;
                morselen = 5;
            end

            B: 
            begin
                morsecode = 11'b11101010100;
                morselen = 9;
            end
            
            C: 
            begin
                morsecode = 11'b11101011101;
                morselen = 11;
            end
            
            D: 
            begin
                morsecode = 11'b11101010000;
                morselen = 7;
            end
    
            E:
            begin
                morsecode = 11'b10000000000;
                morselen = 1;
            end
            
            F: 
            begin
                morsecode = 11'b10101110100;
                morselen = 9;
            end
            
            G: 
            begin
                morsecode = 11'b11101110100;
                morselen = 9;
            end
            
            H: 
            begin
                morsecode = 11'b10101010000;
                morselen = 7;
            end

            default:
            begin
                morsecode = 11'b0;
                morselen = 0;
            end
        endcase
    end

    //key fsm

    reg current, transmit; 
    parameter pressed = 1'b0, released = 1'b1;

    always @(*)
    begin
        case (current)
            pressed:
                if(KEY[1] == 1'b0)
                    transmit = pressed;
                else
                    transmit = released;

            released:
            begin
                if(KEY[1] == 1'b0)
                    transmit = pressed;
                else
                    transmit = released;
            end

            default: transmit = released;
        endcase
    end 
 
    
    //output
    reg [10:0] morsecode_shift;  
    reg [3:0] morselen_remaining;  

    //just pressed
    wire load;
    assign load = (current == released) && (transmit == pressed);
    //current like before it is released and now it is pressed

    //check every clock edge and update key status
    always @(posedge CLOCK_50) begin
    if (KEY[0] == 1'b0)
        current <= released;
    else
        current <= transmit;
    end

    always @(posedge CLOCK_50)
    begin
        if(KEY[0] == 1'b0)
        begin
            morsecode_shift <= 11'b0;
            morselen_remaining <= 0;
        end
        else if(load == 1'b1)
        begin
            morsecode_shift <= morsecode;
            morselen_remaining <= morselen;
        end
        else if(enable == 1'b1 && morselen_remaining > 0)
        begin
            morsecode_shift <= {morsecode_shift[9:0], 1'b0};
            morselen_remaining <= morselen_remaining-1;
        end 
    end 

    assign LEDR[0] = morsecode_shift[10]; 
        
endmodule
