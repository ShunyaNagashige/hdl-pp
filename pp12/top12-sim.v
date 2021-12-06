`timescale 1ns/1ns

module TOP;
reg CLK, RST;
wire [3:0]OUT1, OUT10;
parameter STEP = 100;

TOP12 TOP12 (CLK, RST, OUT1, OUT10);

always #( STEP/2 )	CLK =~ CLK;

initial begin
    // $dumpvars(0,TOP);

	CLK = 0; RST = 0;
	#( STEP ) RST = 1;
	#( STEP ) RST = 0;
	#( STEP*500 ) $finish;
end

initial $monitor( $stime, " CLK=%b RST=%b OUT=%d%d", CLK, RST, OUT10, OUT1 );

endmodule