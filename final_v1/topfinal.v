module TOPFINAL(CLOCK, RESET, PSW, RSW, SEG_A, SEG_B, SEG_C, SEG_D, LED, BZ);
input CLOCK, RESET;
input [3:0] PSW; // �����{�^���i�ŉ��ʃr�b�g�������C�ŏ�ʃr�b�g���E���j
input [3:0] RSW; // BCD���[�^���X�C�b�`�i0�`9��BCD�R�[�h�l��������j
output [7:0] SEG_A, SEG_B, SEG_C, SEG_D; // 7seg LED�iSEG_A�������CSEG_D���E�� �����X���C�h�Q�Ɓj
output [7:0] LED; // �ǉ��n�[�h�FLED�i�ŉ��ʃr�b�g�������C�ŏ�ʃr�b�g���E�� �^ 1:�_���C0:�����j
output BZ; // �ǉ��n�[�h�F�X�s�[�J�i1:On�C0:Off�j

reg BZ;

wire BO1S_10S, BO10S_M;
wire [3:0] OUT_1S, OUT_10S, OUT_M;
reg CAN_START, IS_COUNTING;

// �{�^���̉��������C�y�сC�I����Ԃ́C������s��
// PSW[0]���X�^�[�g�{�^���CPSW[1]���A���[����~�{�^���Ƃ���
always @(posedge CLOCK or posedge RESET) begin
    if(RESET == 1'b1) begin
        CAN_START <= 1'b0;
        IS_COUNTING <= 1'b0;
        BZ <= 1'b0;
    end
    else if(OUT_M == RSW && OUT_10S == 4'd0 && OUT_1S == 4'd0) begin
        // �J�E���g�J�n��
        if(PSW[0] == 1'b1) begin
            CAN_START <= 1'b0;
            IS_COUNTING <= 1'b1;
        end
    end
    else if(OUT_M == 4'd0 && OUT_10S == 4'd0 && OUT_1S == 4'd0) begin
        // �A���[�����~����
        if(BZ == 1'b1 && PSW[1] == 1'b1) begin
            BZ <= 1'b0;
            CAN_START <= 1'b1;
        end
        // �J�E���g�I����
        else if(CAN_START == 1'b0) begin
            BZ <= ~BZ;
            IS_COUNTING <= 1'b0;
        end
        // �J�E���g�J�n��
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