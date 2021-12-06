`timescale 1ns/1ns

module top;

reg CLK, RST;
wire [2:0] Q;
// ToDo: �錾�������ɒǉ�
wire [7:0] S;
wire S3, S2, S1;
parameter STEP = 10;

// ToDo: ���ʃ��W���[���Ăяo���������ɒǉ�
CNT6 CNT6(CLK, RST, Q, S);

always begin
	// ToDo: �N���b�N�M�������̋L�q�������ɒǉ�
    #(STEP) CLK = ~ CLK;
end

initial begin
// ToDo: ���͐M���̋L�q�������ɒǉ�
        CLK = 1'b0; RST = 1'b0;
    #(STEP) RST = 1'b1;
    #(STEP) RST = 1'b0;
	#( STEP*12 ) $finish;
end

// ToDo: S�̊e�r�b�g�̐M����������L�q�������ɒǉ�
// memo: ���̃V�~�����[�^�Ȃ炱�̋L�q�͕s�v
assign S3 = S[3];
assign S2 = S[2];
assign S1 = S[1];

// ToDo: ������K�؂ɏC������
initial $monitor( $stime, " CLK=%b, RESET=%b, Q=%h, S[3]=%b, S[2]=%b, S[1]=%b", 
  CLK, RST, Q, S3, S2, S1 );

endmodule
