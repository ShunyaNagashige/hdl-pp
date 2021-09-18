
module dice (clk, res, s, state);
input clk, res, s;
output [2:0] state;
reg [2:0] state;

always @ (posedge clk or negedge res)
begin
	if (res) state <= 3'h1;
	else
	case (state)
	1: if(s) state <= 3'h2;
	2: if(s) state <= 3'h3;
	3: if(s) state <= 3'h4;
	4: if(s) state <= 3'h5;
	5: if(s) state <= 3'h6;
	6: if(s) state <= 3'h1;
	endcase
end
endmodule

/*
module and2a (a, b, y);
input a, b;
output y;
assign y = a & b;
endmodule
*/

/*********************************************/
module top;

reg clck, reset, ss;
wire [2:0] stat;
//wire yy;

dice dice1(clck, reset, ss, stat);
//and2a and2a(stat[0], stat[1], yy);

initial
begin

/* $dumpfile("dice.vcd"); */
$dumpvars(0,top);

	clck = 1;
	reset = 0;
	ss = 0;

/**********************************/
      #2 reset = 1;
      #2 reset = 0;
      #6 ss = 1;
      #4 ss = 0;
      #6 ss = 1;
      #30  $finish;
/**********************************/
end

always #1 clck = ~clck;

//initial $monitor("s0=%b, s1=%b", stat[0], stat[1]);

endmodule
