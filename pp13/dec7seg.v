
module DEC7SEG (HEX, LEDOUT); 
input [3:0] HEX;
output [7:0] LEDOUT;

// 7Segment decoder function
function [7:0] SEGDEC;
input [3:0] HEXIN;
	case( HEXIN )
	4'h0: SEGDEC = 8'b11111100;	// 0
	4'h1: SEGDEC = 8'b01100000;	// 1
	4'h2: SEGDEC = 8'b11011010;	// 2
	4'h3: SEGDEC = 8'b11110010;	// 3
	4'h4: SEGDEC = 8'b01100110;	// 4
	4'h5: SEGDEC = 8'b10110110;	// 5
	4'h6: SEGDEC = 8'b10111110;	// 6
	4'h7: SEGDEC = 8'b11100000;	// 7
	4'h8: SEGDEC = 8'b11111110;	// 8
	4'h9: SEGDEC = 8'b11110110;	// 9
	4'ha: SEGDEC = 8'b11101110;	// A
	4'hb: SEGDEC = 8'b00111110;	// b
	4'hc: SEGDEC = 8'b00011010;	// c
	4'hd: SEGDEC = 8'b01111010;	// d
	4'he: SEGDEC = 8'b10011110;	// E
	4'hf: SEGDEC = 8'b10001110;	// F
	default: SEGDEC = 8'bxxxxxxxx;	// ?
	endcase
endfunction

assign LEDOUT = SEGDEC ( HEX );

endmodule
