`timescale 1ns/1ns
module top;
reg [3:0] HEX;
wire [7:0] LED;

parameter STEP = 10;

DEC7SEG dec7seg_u ( HEX, LED );

always begin
	#STEP	HEX = HEX + 4'h1;
end

initial begin
	HEX = 4'h0;
	#( STEP*17 ) $finish;
end

initial $monitor( $stime, " HEX=%h LED=%b", HEX, LED );

endmodule