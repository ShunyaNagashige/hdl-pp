// Synchronous BCD counter with asynchronous reset
module CNTRSW(CLOCK, RESET, EN, RSW, CNT);
input CLOCK, RESET, EN;
input [3:0] RSW;
output [3:0] CNT;

reg [3:0] CNT;

always @(posedge CLOCK or posedge RESET) begin
// TODO:?
    if(RESET == 1'b1)
        CNT <= RSW;
    else if(EN == 1'b1) begin
        if(CNT == 4'd0)
            CNT <= RSW - 1;
        else
            CNT <= CNT - 4'd1;
    end
end

// TODO:?
// assign BO = (CNT == 4'd0 && EN == 1'b1);

endmodule