// 分周回路
// Frequency divider 1/1000
module CLKDIV1000(CLOCK, RESET, EN, CY);
input CLOCK, RESET, EN;
output CY;

reg [9:0]CNT;

always @(posedge CLOCK or posedge RESET) begin
// TODO:?
    if(RESET == 1'b1)
        CNT <= 10'd0;
    else if(EN == 1'b1) begin
        if(CNT == 10'd999)
            CNT <= 10'd0;
        else
            CNT <= CNT + 1;
    end
end

// TODO:?
assign CY = (CNT == 10'd999);

endmodule