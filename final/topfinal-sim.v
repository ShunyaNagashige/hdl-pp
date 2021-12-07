`timescale 1ms/1ms // シミュレーションの１ユニットを1msに設定

module TOPFINAL_TEST;

reg CLOCK, RESET;
reg [3:0] PSW; // 押しボタン
reg [3:0] RSW; // BCDロータリスイッチ
wire [7:0] SEG_A, SEG_B, SEG_C, SEG_D; // 7seg LED（SEG_Aが左側，SEG_Dが右側 次もスライド参照）
wire [7:0] LED; // 追加ハード：LED（最下位ビットが左側，最上位ビットが右側 ／ 1:点灯，0:消灯）
wire BZ; // 追加ハード：スピーカ（1:On，0:Off）

parameter STEP = 1;

