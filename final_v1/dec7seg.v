module DEC7SEG(HEX, LEDOUT);
input [3:0] HEX;
output [7:0] LEDOUT;

function [7:0] DEC;
input [3:0] HEX;
 case (HEX)
     4'h0: DEC = 8'b1111_1100;
     4'h1: DEC = 8'b0110_0000;
     4'h2: DEC = 8'b1101_1010;
     4'h3: DEC = 8'b1111_0010;
     4'h4: DEC = 8'b0110_0110;
     4'h5: DEC = 8'b1011_0110;
     4'h6: DEC = 8'b1011_1110;
     4'h7: DEC = 8'b1110_0000;
     4'h8: DEC = 8'b1111_1110;
     4'h9: DEC = 8'b1111_0110;
     4'ha: DEC = 8'b1110_1110;
     4'hb: DEC = 8'b0011_1110;
     4'hc: DEC = 8'b0001_1010;
     4'hd: DEC = 8'b0111_1010;
     4'he: DEC = 8'b1001_1110;
     4'hf: DEC = 8'b1000_1110;
     default: DEC = 8'b0000_0000;
 endcase
endfunction

assign LEDOUT = DEC(HEX);

endmodule