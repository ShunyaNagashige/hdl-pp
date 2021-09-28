module BIT_TEST(DATA,HAO,LEP);
input [7:0] DATA;
output HAO,LEP;
assign HAO=&DATA;
assign LEP=^DATA[3:0];
endmodule