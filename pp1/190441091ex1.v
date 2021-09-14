module OR_G2(IN1,IN2,OUT);
input IN1,IN2;
output OUT;
assign OUT=IN1|IN2;
endmodule

module NOR_G3(IN1,IN2,IN3,OUT);
input IN1,IN2,IN3;
output OUT;
assign OUT=~(IN1|IN2|IN3);
endmodule

module AND_G3(IN1,IN2,IN3,OUT);
input IN1,IN2,IN3;
output OUT;
assign OUT=IN1&IN2&IN3;
endmodule