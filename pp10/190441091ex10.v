// 190441091 �i�d�r��

/* DEC3TO8_TEST */
`timescale 1ns/1ns // �V�~�����[�V�����̂P���j�b�g��1ns�ɐݒ�

module DEC3TO8_TEST;
reg A, B, C; // ���͐M���̃��W�X�^�錾
wire [7:0] Y; // �o�͐M���̃l�b�g�錾

parameter STEP = 10; // �V�~�����[�V�������s�̂P�X�e�b�v���Ԃ�ݒ�

DEC3TO8 DEC3TO8 ( A, B, C, Y ); // �e�X�g�ΏیĂяo��

initial begin // �e�X�g���͂������ω������邽�߂̕�
    C=1; B=1; A=1;
    #STEP A=0; // 1Step(10ns)���ɓ��͂��ω�����D
    #STEP B=0; A=1;
    #STEP A=0;
    #STEP C=0; B=1; A=1;
    #STEP A=0;
    #STEP B=0; A=1;
    #STEP A=0;
    #STEP $finish; // �V�~�����[�V�����I���̂��߂̃V�X�e���^�X�N
end

initial $monitor ("A=%b, B=%b, C=%b, Y=%b", A, B, C, Y );

endmodule