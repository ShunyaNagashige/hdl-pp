// 190441091 âièdèrñÌ

`timescale 1ns/1ns
module top;
reg [3:0] HEX;
wire [7:0] LED;

reg [7:0] SEG; 

parameter STEP = 10;

DEC7SEG dec7seg_u ( HEX, LED );

always @(LED) begin
    case(LED)
        8'b11111100: SEG = "0";	// 0
        8'b01100000: SEG = "1";	// 1
        8'b11011010: SEG = "2";	// 2
        8'b11110010: SEG = "3";	// 3
        8'b01100110: SEG = "4";	// 4
        8'b10110110: SEG = "5";	// 5
        8'b10111110: SEG = "6";	// 6
        8'b11100000: SEG = "7";	// 7
        8'b11111110: SEG = "8";	// 8
        8'b11110110: SEG = "9";	// 9
        8'b11101110: SEG = "A";	// A
        8'b00111110: SEG = "b";	// b
        8'b00011010: SEG = "c";	// c
        8'b01111010: SEG = "d";	// d
        8'b10011110: SEG = "E";	// E
        8'b10001110: SEG = "F";	// F
    endcase
end

always begin
	#STEP	HEX = HEX + 4'h1;
end

initial begin
	HEX = 4'h0;
	#( STEP*16 ) $finish;
end

initial $monitor( $stime, " HEX=%h LED=%b LEDCHAR=%s", HEX, LED, SEG);

endmodule