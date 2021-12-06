
module DEC3TO8 ( A, B, C, Y );
input A, B, C;
output [7:0] Y;
reg [7:0] Y;

always @(A or B or C) begin
  case({C, B, A})
  3'h0: Y<=8'b1000_0000;
  3'h1: Y<=8'b0100_0000;
  3'h2: Y<=8'b0010_0000;
  3'h3: Y<=8'b0001_0000;
  3'h4: Y<=8'b0000_1000;
  3'h5: Y<=8'b0000_0100;
  3'h6: Y<=8'b0000_0010;
  3'h7: Y<=8'b0000_0001;
  default: Y<=8'hxx;
  endcase
end

endmodule