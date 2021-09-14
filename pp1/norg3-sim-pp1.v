`timescale 1ns/1ns
module top;
reg a, b;
wire y;
NOR_G3 NOR_G3(a, b, c, y);
initial begin
a = 0; b = 0; c = 0;
#1 a = 0; b = 1;
#1 a = 1; b = 0;
#1 a = 1; b = 1;
#1 a = 0; b = 0;
#20 $finish;
end
initial $monitor($stime, " a=%b b=%b y=%b", a, b, y);
endmodule