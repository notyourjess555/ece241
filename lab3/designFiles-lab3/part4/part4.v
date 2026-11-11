module part4(Clk, D, Qa, Qb, Qc);

    input D, Clk;
    output reg Qa, Qb, Qc;
	 reg Qa_bar, Qb_bar, Qc_bar;

    //d latch
    always @(D, Clk)
    begin
        if (Clk == 1'b1)
        begin 
            Qa = D;
            Qa_bar = ~D;
        end
    end

    //positive edge d flip flop
    always @(posedge Clk)
    begin
        Qb <= D;
        Qb_bar <= ~D;
    end

    //negative edge d flip flop
    always @(negedge Clk)
    begin
        Qc <= D;
        Qc_bar <= ~D;
    end

endmodule