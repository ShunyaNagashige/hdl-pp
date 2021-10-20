`timescale 1ns/1ns
module top;
reg [7:0] A, B;
reg SEL;
wire [7:0] Y;

parameter STEP = 10;

SELECTOR2 sel ( A, B, SEL, Y );


initial begin
	A=8'h1; B=8'h4; SEL=1'b1;
	#STEP A=8'h1; B=8'h4; SEL=1'b0;
	#STEP A=8'h5; B=8'h6; SEL=1'b1;
	#STEP A=8'h5; B=8'h6; SEL=1'b0;
	#STEP $finish;
end

initial $monitor( $stime, " SEL=%b Y=%h A=%h B=%h", SEL, Y, A, B );

endmodule