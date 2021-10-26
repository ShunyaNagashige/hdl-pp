`timescale 1ns/1ns
module top;
reg CLK, RB, EN;
wire [3:0] Q;
wire CY;
parameter STEP = 100;

COUNT10 COUNTER( CLK, RB, EN, Q, CY );

always #( STEP/2 )	CLK = ~CLK;

initial begin
	CLK=1'b0; RB=1'b1; EN=1'b1;
	#(STEP) RB=1'b0;
	#(STEP) RB=1'b1;
	#(STEP*19) EN=1'b0;
	#(STEP) EN=1'b1;
	#(STEP*8) $finish;
end

initial $monitor( $stime, " CLK=%b RB=%b EN=%b Q=%h CY=%b", CLK, RB, EN, Q, CY);

endmodule