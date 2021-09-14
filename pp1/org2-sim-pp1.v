`timescale 1ns/1ns
module top;
reg a, b;
wire y;
OR_G2 OR_G2(a, b, y);
initial begin
a = 0; b = 0;
#1 a = 0; b = 1;
#1 a = 1; b = 0;
#1 a = 1; b = 1;
#1 a = 0; b = 0;
#20 $finish;
end
initial $monitor($stime, " a=%b b=%b y=%b", a, b, y);
endmodule