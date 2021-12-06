/* ----  EX9  ---- */
/* TODO: no., name */
// 190441091 �i�d�r��


/* -- Start of CNT6 -- */
module CNT6(CLK, RST, EN, Q, OVER);
input CLK, RST, EN;
output [2:0] Q;
reg [2:0] Q;
output OVER;

always @(posedge CLK or posedge RST) begin
  if(RST == 1'b1) begin
    // TODO: Enable�t��6�i�J�E���^�̖{�̂��L�q
    Q <= 3'h5;
  end
  else if(EN == 1'b1) begin
    // TODO: Enable�t��6�i�J�E���^�̖{�̂��L�q
    if(Q == 3'h0)
      Q <= 3'h5;
    else
      Q <= Q - 3'h1;
  end
end

// TODO: OVER�M���𐶐�����
assign OVER = (EN & ~Q);

endmodule
/* -- End of CNT6 -- */

/* -- Start of STAT2 -- */
module STAT2(CLK, RST, GO, FIN, OUT);
input CLK, RST, GO, FIN;
output OUT;

// TODO: 2��Ԃ̃X�e�[�g�}�V�����L�q

// �X�e�[�g�E���W�X�^�o��CUR, �X�e�[�g������H�o��NXT
reg CUR, NXT;

// �X�e�[�g����`
parameter S0 = 1'b0, S1 = 1'b1;

// �X�e�[�g�E���W�X�^�̏������ƍX�V
always @(posedge CLK or posedge RST) begin
    if(RST == 1'b1)
        CUR <= S0;
    else
        CUR <= NXT;
end

// �X�e�[�g������H(�g�ݍ��킹��H)
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

// ���݂̃X�e�[�g�}�V���̏�Ԃ���o�͐M���𐶐�����
assign OUT = CUR;

endmodule
/* -- End of STAT2 -- */


/* -- Start of EX9TOP -- */
module EX9TOP(CLK, RST, SW1, OUT);
input CLK, RST, SW1;
output [3:0] OUT;
wire [2:0] Q; // CNT6�̏o��Q������z��
wire OVER; // CNT6�̏o��OVER���󂯎��z��
wire EN; // STAT2�̏o��OUT���󂯎��z��

// TODO: �ŏ�ʃ��W���[�����L�q�i��ɉ��ʃ��W���[���Ăяo���j
// TODO: Q�ȊO�ɕK�v�Ȕz���͏������邱��
STAT2 STAT(CLK, RST, SW1, OVER, EN);
CNT6 CNT(CLK, RST, EN, Q, OVER);

assign OUT = {1'b0, Q};

endmodule
/* -- End of EX9TOP -- */