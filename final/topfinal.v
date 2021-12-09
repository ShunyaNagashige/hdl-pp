module TOPFINAL(CLOCK, RESET, PSW, RSW, SEG_A, SEG_B, SEG_C, SEG_D, LED, BZ);
input CLOCK, RESET;
input [3:0] PSW; // 押しボタン（最下位ビットが左側，最上位ビットが右側）
input [3:0] RSW; // BCDロータリスイッチ（0～9のBCDコード値が得られる）
output [7:0] SEG_A, SEG_B, SEG_C, SEG_D; // 7seg LED（SEG_Aが左側，SEG_Dが右側 次もスライド参照）
output [7:0] LED; // 追加ハード：LED（最下位ビットが左側，最上位ビットが右側 ／ 1:点灯，0:消灯）
output BZ; // 追加ハード：スピーカ（1:On，0:Off）

reg BZ;

wire BO1S_10S, BO10S_M;
wire [3:0] OUT_1S, OUT_10S, OUT_M;
reg CAN_START, IS_COUNTING;

// ボタンの押し下し，及び，終了状態の，判定を行う
// PSW[0]をスタートボタン，PSW[1]をアラーム停止ボタンとする
always @(posedge CLOCK or posedge RESET) begin
    if(RESET == 1'b1) begin
        CAN_START <= 1'b0;
        IS_COUNTING <= 1'b0;
        BZ <= 1'b0;
    end
    else if(OUT_M == RSW && OUT_10S == 4'd0 && OUT_1S == 4'd0) begin
        // カウント開始時
        if(PSW[0] == 1'b1) begin
            CAN_START <= 1'b0;
            IS_COUNTING <= 1'b1;
        end
    end
    else if(OUT_M == 4'd0 && OUT_10S == 4'd0 && OUT_1S == 4'd0) begin
        // アラームを停止する
        if(BZ == 1'b1 && PSW[1] == 1'b1) begin
            BZ <= 1'b0;
            CAN_START <= 1'b1;
        end
        // カウント終了時
        else if(CAN_START == 1'b0) begin
            BZ <= ~BZ;
            IS_COUNTING <= 1'b0;
        end
        // カウント開始時
        else if(BZ == 1'b0 && CAN_START == 1'b1 && PSW[0] == 1'b1) begin
            CAN_START <= 1'b0;
            IS_COUNTING <= 1'b1;
        end
    end
end

CLKDIV1000 CLKDIV1000(CLOCK, RESET, IS_COUNTING, EN);

CNT10 CNT10(CLOCK, RESET, EN, OUT_1S, BO1S_10S);
CNT6 CNT6(CLOCK, RESET, BO1S_10S, OUT_10S, BO10S_M);
CNTRSW CNTRSW(CLOCK, RESET, BO10S_M, RSW, OUT_M);

DEC7SEG DEC7SEG_1S(OUT_1S, SEG_D);
DEC7SEG DEC7SEG_10S(OUT_10S, SEG_C);
DEC7SEG DEC7SEG_M(OUT_M, SEG_B);

endmodule