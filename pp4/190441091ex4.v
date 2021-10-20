module SELECTOR2(A,B,SEL,Y);
input [7:0] A;
input [7:0] B;
input SEL;
output [7:0] Y;

assign Y = (SEL==1'b1)?A:B;

endmodule