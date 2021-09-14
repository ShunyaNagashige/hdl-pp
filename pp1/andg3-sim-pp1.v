`timescale 1ns/1ns
module top;
reg a, b, c;
wire y;
AND_G3 AND_G3(a, b, c, y);
initial begin
a = 0; b = 0; c = 0;
#1 a = 0; b = 0; c=1;
#1 a = 0; b = 1;c=0;
#1 a = 0; b = 1;c=1;
#1 a = 1; b = 0;c=0;
#1 a=1;b=0;c=1;
#1 a=1;b=1;c=0;
#1 a=1;b=1;c=1;
#20 $finish;
end
initial $monitor($stime, " a=%b b=%b c=%b y=%b", a, b,c, y);
endmodule