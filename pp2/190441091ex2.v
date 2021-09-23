module CNT16(CLK,RST,Q);
input CLK,RST;
output [15:0] Q;
wire [15:0] CA;

assign Q[0]=1'b0;
CNT1 cnt1(CLK,RST,1'b1,Q[1],CA[1]);
CNT1 cnt2(CLK,RST,CA[1],Q[2],CA[2]);
CNT1 cnt3(CLK,RST,CA[2],Q[3],CA[3]);
CNT1 cnt4(CLK,RST,CA[3],Q[4],CA[4]);
CNT1 cnt5(CLK,RST,CA[4],Q[5],CA[5]);
CNT1 cnt6(CLK,RST,CA[5],Q[6],CA[6]);
CNT1 cnt7(CLK,RST,CA[6],Q[7],CA[7]);
CNT1 cnt8(CLK,RST,CA[7],Q[8],CA[8]);
CNT1 cnt9(CLK,RST,CA[8],Q[9],CA[9]);
CNT1 cnt10(CLK,RST,CA[9],Q[10],CA[10]);
CNT1 cnt11(CLK,RST,CA[10],Q[11],CA[11]);
CNT1 cnt12(CLK,RST,CA[11],Q[12],CA[12]);
CNT1 cnt13(CLK,RST,CA[12],Q[13],CA[13]);
CNT1 cnt14(CLK,RST,CA[13],Q[14],CA[14]);
CNT1 cnt15(CLK,RST,CA[14],Q[15],CA[15]);

endmodule

module CNT1(CLK,RST,EN,Q,CA);
input CLK,RST,EN;
output Q,CA;
reg Q;

always @(posedge CLK or posedge RST)begin
    if(RST==1'b1)
        Q<=1'b0;
    else if(EN==1'b1)
        Q<=~Q; 
end

assign CA=EN&Q;
endmodule