/* -- Start of CNT6 -- */
module CNT6(CLK, RST, Q, S);
input CLK, RST;
output [2:0] Q;
output [7:0] S;
reg [2:0] Q;
reg [7:0] S;

always @(posedge CLK or posedge RST) begin
  if(RST == 1'b1) begin
    Q <= 3'h0;
  end
  else begin
    if(Q == 3'h5)
      Q <= 3'h0;
    else
      Q <= Q + 3'h1;
  end
end

always @( Q ) begin
  case( Q )
    3'h0: S <= 8'b11111100;  // 0
    3'h1: S <= 8'b01100000;  // 1
    3'h2: S <= 8'b11011010;  // 2
    3'h3: S <= 8'b11110010;  // 3
    3'h4: S <= 8'b01100110;  // 4
    3'h5: S <= 8'b10110110;  // 5
    3'h6: S <= 8'b10111110;  // 6
    3'h7: S <= 8'b11100000;  // 7
    default: S <= 8'bxxxxxxxx;  // ?
  endcase
end

endmodule
/* -- End of CNT6 -- */
