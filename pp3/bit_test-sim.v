`timescale 1ns/1ns

module TOP;

reg [7:0] DATA;
wire HAO;
wire LEP;

parameter STEP = 100;

BIT_TEST BIT_TEST (DATA, HAO, LEP);

always #( STEP )	DATA = DATA + 8'h1;

initial begin
	DATA=8'h0;
	#( STEP*256 ) $finish;
end

initial $monitor( $stime, " DATA=%b(%h) HAO=%b LEP=%b", DATA, DATA, HAO, LEP );

endmodule