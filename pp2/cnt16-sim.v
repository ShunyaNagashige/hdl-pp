`timescale 1ns/1ns

module top;
reg clk, rst;
wire [15:0]q;
parameter STEP = 100;

CNT16 CNT16 (clk, rst, q);

always #( STEP/2 )	clk =~ clk;

initial begin
	clk = 1'b0; rst = 1'b0;
	#( STEP ) rst = 1'b1;
	#( STEP ) rst = 1'b0;
	#( STEP*20 ) $finish;
end

initial $monitor( $stime, " clk=%b rst=%b q=%b", clk, rst, q );

endmodule