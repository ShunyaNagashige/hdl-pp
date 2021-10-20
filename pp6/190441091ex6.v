/* ----  EX6  ---- */
// 190441091 �i�d�r��
// CNT16�̏o�͂��A���̏o�͂�ROM16�ɒʂ����o�͂��A��I������(�S�̂Ƃ��Ă͏���)��H

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
// TODO: �S�̓I��always�ɂ��L�q����ROM�ɕK�v�ȋL�q������D

input [3:0] ADDR;
output [3:0] DATA;
// always�̏o�͂�reg�ɂ���K�v������
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
// TODO: �S�̓I��EX6TOP�ɕK�v�ȋL�q������D

input CLK, RESET, SEL_IN;
output [3:0] OUTDATA;
wire [3:0] IN0;
wire [3:0] IN1;

// FIXME: �������Z�q�ɂ��4�r�b�g2���͂̃Z���N�^�ɕK�v�ȋL�q������D

// SEL��0�ł�1�ł��Ȃ��ꍇ�A�������̒l��0(false)�ɂȂ�B���̂Ƃ��AOUTDATA�ɂ�IN0������B
assign OUTDATA = (SEL_IN) ? IN1 : IN0 ;

// FIXME: CNT16�̉��ʃ��W���[���Ăяo���̃|�[�g��ڑ�����D(�C���X�^���X���͕ύX�s��)
CNT16 CNT(CLK,RESET,IN1);

// ROM16�̉��ʃ��W���[���Ăяo���̃|�[�g��ڑ�����B
ROM16 ROM(IN1,IN0);

endmodule
/* -- End of EX6TOP -- */
