`timescale 100us/100us

module TOPFINAL_TEST;

reg CLOCK, RESET;
reg [3:0] PSW; // 押しボタン
reg [3:0] RSW; // BCDロータリスイッチ
wire [7:0] SEG_A, SEG_B, SEG_C, SEG_D; // 7seg LED（SEG_Aが左側，SEG_Dが右側 次もスライド参照）
wire [7:0] LED; // 追加ハード：LED（最下位ビットが左側，最上位ビットが右側 ／ 1:点灯，0:消灯）
wire BZ; // 追加ハード：スピーカ（1:On，0:Off）

wire [7:0] STR_B, STR_C, STR_D;

parameter STEP = 5;

TOPFINAL TOPFINAL(CLOCK, RESET, PSW, RSW, SEG_A, SEG_B, SEG_C, SEG_D, LED, BZ);

always begin
    #(STEP) CLOCK = ~CLOCK;
end

always begin
    #(STEP * 12)    if (STR_B == "0" && STR_C == "0" && STR_D == "0") begin
                        // アラームを止める
                        #(STEP * 5) PSW[1] = 1'b1; 
                        #(STEP * 5) PSW[1] = 1'b0;

                        RSW = 4'd2;

                        #(STEP * 5) PSW[0] = 1'b1;
                        #(STEP) PSW[0] = 1'b0;
                    end
end

// 押しボタンのシミュレーションを描く

// カウントできるか？
// アラームがつくか？
// アラーム停止できるか？

initial begin
    CLOCK = 1'b0; RESET = 1'b0; RSW = 4'd1;

    #(STEP) RESET = 1'b1;
    #(STEP) RESET = 1'b0;

    #(STEP * 5) PSW[0] = 1'b1;
    #(STEP) PSW[0] = 1'b0;
end

function [7:0] STR;
input [7:0] SEG;
    case(SEG)
        8'b11111100: STR = "0";	// 0
        8'b01100000: STR = "1";	// 1
        8'b11011010: STR = "2";	// 2
        8'b11110010: STR = "3";	// 3
        8'b01100110: STR = "4";	// 4
        8'b10110110: STR = "5";	// 5
        8'b10111110: STR = "6";	// 6
        8'b11100000: STR = "7";	// 7
        8'b11111110: STR = "8";	// 8
        8'b11110110: STR = "9";	// 9
        // 8'b11101110: STR = "A";	// A
        // 8'b00111110: STR = "b";	// b
        // 8'b00011010: STR = "c";	// c
        // 8'b01111010: STR = "d";	// d
        // 8'b10011110: STR = "E";	// E
        // 8'b10001110: STR = "F";	// F
        default:     STR = "?";
    endcase
endfunction

assign STR_B = STR(SEG_B);
assign STR_C = STR(SEG_C);
assign STR_D = STR(SEG_D);

initial $monitor( $stime, " CLOCK=%b, RESET=%b, PSW=%b, RSW=%h, STR=0%s:%s%s, BZ=%b", 
  CLOCK, RESET, PSW, RSW, STR_B, STR_C, STR_D, BZ);

endmodule