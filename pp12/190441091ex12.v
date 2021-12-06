// ------------------
// Frequency divider 1/3
module CLKDIV3(CLOCK, RESET, CY);
input CLOCK, RESET;
output CY;

reg [1:0]CNT;

always @(posedge CLOCK or posedge RESET) begin
// TODO:?
    if(RESET == 1'b1)
        CNT <= 2'h0;
    else if(CNT == 2'h2)
        CNT <= 2'h0;
    else
        CNT <= CNT + 1;
end

// TODO:?
assign CY = (CNT == 2'h2);

endmodule
// ------------------

// ------------------
// Synchronous BCD counter with asynchronous reset
module CNT10(CLOCK, RESET, EN, CNT, BO);
input CLOCK, RESET, EN;
output [3:0] CNT;
output BO;

reg [3:0] CNT;

always @(posedge CLOCK or posedge RESET) begin
// TODO:?
    if(RESET == 1'b1)
        CNT <= 4'h0;
    else if(EN == 1'b1) begin
        if(CNT == 4'h0)
            CNT <= 4'h9;
        else
            CNT <= CNT - 4'h1; 
    end
end

// TODO:?
assign BO = (CNT == 4'h0 && EN == 1'b1);

endmodule
// ------------------


// ------------------
// Example module for test
// OUT1‚Í1‚ÌˆÊCOUT10‚Í10‚ÌˆÊ‚ð•\‚·
// CLOCK‚ÆRESET‚Í—§‚¿ã‚ª‚è‚Å—LŒø
module TOP12(CLOCK, RESET, OUT1, OUT10);
input CLOCK, RESET;
output [3:0] OUT1, OUT10;
// TODO:
wire EN, BO1, BO10;

// TODO:
CLKDIV3 CLKDIV3(CLOCK, RESET, EN);

// 1‚ÌˆÊ‚ð”‚¦‚é(down)
CNT10 CNT1(CLOCK, RESET, EN, OUT1, BO1);
// 10‚ÌˆÊ‚ð”‚¦‚é(down)
CNT10 CNT10(CLOCK, RESET, BO1, OUT10, BO10);

endmodule
// ------------------
