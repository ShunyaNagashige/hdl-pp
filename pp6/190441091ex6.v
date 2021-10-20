/* ----  EX6  ---- */
// 190441091 永重俊弥
// CNT16の出力か、その出力をROM16に通した出力か、を選択する(全体としては順序)回路

/* -- Start of CNT16 -- */
module CNT16(CLK, RESET, Q);
input CLK, RESET;
output [3:0] Q;
reg [3:0] Q;

always @(posedge CLK or posedge RESET) begin
  if(RESET == 1'b1) begin
    Q <= 4'h0;
  end
  else begin
    Q <= Q + 4'h1;
  end
end

endmodule
/* -- End of CNT16 -- */


/* -- 16 word ROM -- */
module ROM16(ADDR, DATA);
// TODO: 全体的にalwaysにより記述したROMに必要な記述をする．

input [3:0] ADDR;
output [3:0] DATA;
// alwaysの出力はregにする必要がある
reg [3:0] DATA;

always @(ADDR)
begin
    case (ADDR)
        4'd0: DATA <= 4'h0;
        4'd1: DATA <= 4'h1;
        4'd2: DATA <= 4'h2;
        4'd3: DATA <= 4'h4;
        4'd4: DATA <= 4'h8;
        4'd5: DATA <= 4'h8;
        4'd6: DATA <= 4'h4;
        4'd7: DATA <= 4'h2;
        4'd8: DATA <= 4'h1;
        4'd9: DATA <= 4'h1;
        4'd10: DATA <= 4'h3;
        4'd11: DATA <= 4'h7;
        4'd12: DATA <= 4'hf;
        4'd13: DATA <= 4'h7;
        4'd14: DATA <= 4'h3;
        4'd15: DATA <= 4'h1;
        default: DATA <= 4'hx;
    endcase
end

endmodule
/* -- End of ROM16 -- */


/* -- ex6 TOP module -- */
module EX6TOP(CLK, RESET, OUTDATA, SEL_IN);
// TODO: 全体的にEX6TOPに必要な記述をする．

input CLK, RESET, SEL_IN;
output [3:0] OUTDATA;
wire [3:0] IN0;
wire [3:0] IN1;

// FIXME: 条件演算子により4ビット2入力のセレクタに必要な記述をする．

// SELが0でも1でもない場合、条件式の値は0(false)になる。このとき、OUTDATAにはIN0が入る。
assign OUTDATA = (SEL_IN) ? IN1 : IN0 ;

// FIXME: CNT16の下位モジュール呼び出しのポートを接続する．(インスタンス名は変更不可)
CNT16 CNT(CLK,RESET,IN1);

// ROM16の下位モジュール呼び出しのポートを接続する。
ROM16 ROM(IN1,IN0);

endmodule
/* -- End of EX6TOP -- */
