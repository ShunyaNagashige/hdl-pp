// 190441091 âièdèrñÌ

module COUNT10 (CLK, RB, EN, Q, CY);
input CLK, RB, EN;
output [3:0] Q;
output CY;
reg [3:0] Q;

always @(posedge CLK) begin
    if (RB == 1'b0)
        Q <= 4'h0;
    else if (EN == 1'b1) begin
        if (Q == 4'h9)
            Q <= 4'h0;
        else
            Q <= Q + 4'h1;
    end
end

assign CY = (EN == 1'b1 & Q == 4'h9);

endmodule

    