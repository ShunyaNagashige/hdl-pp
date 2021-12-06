// Synchronous BCD counter with asynchronous reset
module CNT10(CLOCK, RESET, EN, CNT, BO);
input CLOCK, RESET, EN;
output [3:0] CNT;
output BO;

reg [3:0] CNT;

always @(posedge CLOCK or posedge RESET) begin
// TODO:?
    if(RESET == 1'b1)
        CNT <= 4'd0;
    else if(EN == 1'b1) begin
        if(CNT == 4'd0)
            CNT <= 4'd9;
        else
            CNT <= CNT - 4'd1; 
    end
end

// TODO:?
assign BO = (CNT == 4'd0 && EN == 1'b1);

endmodule