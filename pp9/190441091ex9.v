/* ----  EX9  ---- */
/* TODO: no., name */
// 190441091 永重俊弥


/* -- Start of CNT6 -- */
module CNT6(CLK, RST, EN, Q, OVER);
input CLK, RST, EN;
output [2:0] Q;
reg [2:0] Q;
output OVER;

always @(posedge CLK or posedge RST) begin
  if(RST == 1'b1) begin
    // TODO: Enable付き6進カウンタの本体を記述
    Q <= 3'h5;
  end
  else if(EN == 1'b1) begin
    // TODO: Enable付き6進カウンタの本体を記述
    if(Q == 3'h0)
      Q <= 3'h5;
    else
      Q <= Q - 3'h1;
  end
end

// TODO: OVER信号を生成する
assign OVER = (EN & ~Q);

endmodule
/* -- End of CNT6 -- */

/* -- Start of STAT2 -- */
module STAT2(CLK, RST, GO, FIN, OUT);
input CLK, RST, GO, FIN;
output OUT;

// TODO: 2状態のステートマシンを記述

// ステート・レジスタ出力CUR, ステート生成回路出力NXT
reg CUR, NXT;

// ステート名定義
parameter S0 = 1'b0, S1 = 1'b1;

// ステート・レジスタの初期化と更新
always @(posedge CLK or posedge RST) begin
    if(RST == 1'b1)
        CUR <= S0;
    else
        CUR <= NXT;
end

// ステート生成回路(組み合わせ回路)
always @(CUR or GO or FIN) begin
    case(CUR)
      S0: if(GO)
            NXT <= S1;
          else
            NXT <= S0;
      S1: if(~GO & FIN)
            NXT <= S0;
          else
            NXT <= S1;
      default: NXT <= 1'bx;
    endcase
end

// 現在のステートマシンの状態から出力信号を生成する
assign OUT = CUR;

endmodule
/* -- End of STAT2 -- */


/* -- Start of EX9TOP -- */
module EX9TOP(CLK, RST, SW1, OUT);
input CLK, RST, SW1;
output [3:0] OUT;
wire [2:0] Q; // CNT6の出力Qを受取る配線
wire OVER; // CNT6の出力OVERを受け取る配線
wire EN; // STAT2の出力OUTを受け取る配線

// TODO: 最上位モジュールを記述（主に下位モジュール呼び出し）
// TODO: Q以外に必要な配線は準備すること
STAT2 STAT(CLK, RST, SW1, OVER, EN);
CNT6 CNT(CLK, RST, EN, Q, OVER);

assign OUT = {1'b0, Q};

endmodule
/* -- End of EX9TOP -- */