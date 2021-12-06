`timescale 1ns/1ns

module top;

reg CLK, RST;
wire [2:0] Q;
// ToDo: 宣言をここに追加
wire [7:0] S;
wire S3, S2, S1;
parameter STEP = 10;

// ToDo: 下位モジュール呼び出しをここに追加
CNT6 CNT6(CLK, RST, Q, S);

always begin
	// ToDo: クロック信号生成の記述をここに追加
    #(STEP) CLK = ~ CLK;
end

initial begin
// ToDo: 入力信号の記述をここに追加
        CLK = 1'b0; RST = 1'b0;
    #(STEP) RST = 1'b1;
    #(STEP) RST = 1'b0;
	#( STEP*12 ) $finish;
end

// ToDo: Sの各ビットの信号を代入する記述をここに追加
// memo: 今のシミュレータならこの記述は不要
assign S3 = S[3];
assign S2 = S[2];
assign S1 = S[1];

// ToDo: 引数を適切に修正する
initial $monitor( $stime, " CLK=%b, RESET=%b, Q=%h, S[3]=%b, S[2]=%b, S[1]=%b", 
  CLK, RST, Q, S3, S2, S1 );

endmodule
