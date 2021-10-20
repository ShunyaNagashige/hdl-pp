`timescale 1ns/1ns
module top;
reg CLK, RESET, SEL_IN;
wire [3:0] OUTDATA;

parameter STEP = 10;

EX6TOP EX6TOP(CLK, RESET, OUTDATA, SEL_IN);

always begin
	#STEP	CLK = ~CLK;
end

initial begin
	RESET = 1'b0;
	CLK = 1'b0;
	SEL_IN = 1'b1;
	#STEP RESET=1'b1; // assert RESET !
	#STEP RESET=1'b0; // negate RESET
	#( STEP*34 ) SEL_IN = 1'b0;
	#STEP RESET=1'b1; // assert RESET !
	#STEP RESET=1'b0; // negate RESET
	#( STEP*35 ) $finish;
end

initial $monitor( $stime, " CLK=%b, RESET=%b, SEL_IN=%b, Q=%h, OUTDATA=%h", 
                            CLK, RESET, SEL_IN, EX6TOP.CNT.Q, OUTDATA );

endmodule