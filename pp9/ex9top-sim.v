`timescale 1ns/1ns
module top;
reg CLK, RST, SW1;
wire [3:0]OUT;
parameter STEP = 100;

EX9TOP EX9TOP( CLK, RST, SW1, OUT );

always #( STEP/2 )	CLK =~ CLK;

initial begin

    $dumpvars(0,top);

	CLK=1'b0; RST=1'b0; SW1=1'b0;
	#(STEP)    RST=1'b1;	#(STEP) RST=1'b0; // Reset!
	#(STEP)    SW1=1'b1;	#(STEP) SW1=1'b0; // Stop中にStart
	#(STEP*2)  SW1=1'b1;	#(STEP) SW1=1'b0; // Start中にStart
	#(STEP*10) SW1=1'b1;	#(STEP) SW1=1'b0; // Stop中にStart
	#(STEP*10) $finish;
end

initial $monitor( $stime, " CLK=%b RST=%b SW1=%b OUT=%h", 
CLK, RST, SW1, OUT);

endmodule