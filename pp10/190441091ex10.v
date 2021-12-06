// 190441091 永重俊弥

/* DEC3TO8_TEST */
`timescale 1ns/1ns // シミュレーションの１ユニットを1nsに設定

module DEC3TO8_TEST;
reg A, B, C; // 入力信号のレジスタ宣言
wire [7:0] Y; // 出力信号のネット宣言

parameter STEP = 10; // シミュレーション実行の１ステップ時間を設定

DEC3TO8 DEC3TO8 ( A, B, C, Y ); // テスト対象呼び出し

initial begin // テスト入力を順次変化させるための文
    C=1; B=1; A=1;
    #STEP A=0; // 1Step(10ns)毎に入力が変化する．
    #STEP B=0; A=1;
    #STEP A=0;
    #STEP C=0; B=1; A=1;
    #STEP A=0;
    #STEP B=0; A=1;
    #STEP A=0;
    #STEP $finish; // シミュレーション終了のためのシステムタスク
end

initial $monitor ("A=%b, B=%b, C=%b, Y=%b", A, B, C, Y );

endmodule