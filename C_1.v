`timescale 1ns/1ns
module C_1(
  input CLK,
  input RESET,
  
  input [11:0] I0,
  input [11:0] I1,
  input [11:0] I2,
  input [11:0] I3,
  input [11:0] I4,
  input [11:0] I5,
  input [11:0] I6,
  input [11:0] I7,
  
  output reg[11:0] O0,
  output reg[11:0] O1,
  output reg[11:0] O2,
  output reg[11:0] O3,
  output reg[11:0] O4,
  output reg[11:0] O5,
  output reg[11:0] O6,
  output reg[11:0] O7
  
  );


reg[11:0] n0,n1,n2,n3,n4,n5,n6,n7;
wire[11:0] l1,l3,l5,l61,l62,l63,l71,l72,l4x,l69,n62,l555,l5x,l59,l4s,l99,LLx,LLy,n61,l91,l66;
reg [11:0] l2,l4,l6,l55;
reg [31:0] L2,L4,L6,L5;
reg [31:0] underR;
wire [10:0] X2,X4,X6,XL5;
wire [11:0] X3,X5,X67,X7;


always @(posedge CLK) begin
  if(RESET) begin
    underR=32'd0;
  end
else begin
  underR[31]=1'b0;
  underR[30:15]=16'd0;
  underR[14:0]=15'd4142;
end
end


always @(*) begin
  if(RESET) begin
    L2=32'd0;
    
    L4=32'd0;
    
    L6=32'd0;
    
  end
else begin
  L2[31]=1'b0;
  L2[30:15]=n2[10:0];
  L2[14:0]=15'd0;
  
  L4[31]=1'b0;
  L4[30:15]=n4[10:0];
  L4[14:0]=15'd0;
  
  L5[31]=1'b0;
  L5[30:15]=n5[10:0];
  L5[14:0]=15'd0;
  
  L6[31]=1'b0;
  L6[30:15]=n6[10:0];
  L6[14:0]=15'd0;
    
end
end





always @(posedge CLK) begin
  if(RESET) begin
    n0<=0;
    n1<=0;
    n2<=0;
    n3<=0;
    n4<=0;
    n5<=0;
    n6<=0;
    n7<=0;
  end
  
  else begin
    n0<=I0;
    n1<=I1;
    n2<=I2;
    n3<=I3;
    n4<=I4;
    n5<=I5;
    n6<=I6;
    n7<=I7;
  end
  
end




FPM F1(.a(underR),.b(L2),.multout(X2));//Okay
FPM F2(.a(underR),.b(L4),.multout(X4));//OKay
FPM F3(.a(underR),.b(L6),.multout(X6));//Okay
FPM F3xs(.a(underR),.b(L5),.multout(XL5));//Okay

//Adder A1d(.in1(l62),.in2(l4x),.out(X66));//OKay
Adder A2d(.in1(n62),.in2(l61),.out(l69));//Okay
Adder A3d(.in1(l555),.in2(l5x),.out(l59));//Okay
Adder A34(.in1(l4x),.in2(l4s),.out(l99));//OKay

Adder AA7(.in1(l4x),.in2(l61),.out(l91));
Subtractor S45(.in1(l91),.in2(l5x),.out(l66));



Adder AA(.in1(l72),.in2(l59),.out(LLx));
Adder BB(.in1(l69),.in2(l99),.out(LLy));

Subtractor S1(.in1(l3),.in2(l2),.out(X3));///Okay
Subtractor S2(.in1(l5),.in2(l4),.out(X5));//Okay
Subtractor S3(.in1(l61),.in2(l5x),.out(l62));//Okay

Subtractor S4(.in1(LLx),.in2(LLy),.out(X7));


Shifter SH1(.in1(n3),.out(l3));//Okay
Shifter SH2(.in1(n5),.out(l5));//OKay

Shifter SH06(.in1(n4),.out(l4x));//Okay
Shifter SH07(.in1(l55),.out(l5x));//Okay

Shifter SH2a(.in1(l6),.out(l61));//Okay

Shifter SH2b(.in1(l61),.out(l63));

Shifter SH3(.in1(n7),.out(l71));
Shifter SH4(.in1(l71),.out(l72));

Shifter SH6a(.in1(n6),.out(n61));
Shifter SH6b(.in1(n61),.out(n62));

Shifter SH5b(.in1(l5),.out(l555));//Okay
Shifter SH7c(.in1(l4),.out(l4s));//OKay






always @(*) begin
   l2[11]<=n2[11];
   l2[10:0]<=X2+n2[10:0];//Okay
   
   l4[11]<=n4[11];
   l4[10:0]<=X4+n4[10:0];
   
   l6[11]<=n6[11];
   l6[10:0]<=X6+n6[10:0];

   l55[11]<=n5[11];
   l55[10:0]<=XL5+n5[10:0];
 end
 
   
   


always @(posedge CLK) begin
 if(RESET) begin
   O0<=0;
   O1<=0;
   O2<=0;
   O3<=0;
   O4<=0;
   O5<=0;
   O6<=0;
   O7<=0;
 end
 else begin
 O0<=n0;//Okay
 O1<=n1;//Okay
 O2<=l2;//Okay
 O3<=X3;//Okay
 O4<=l4;//Okay
 O5<=X5;//Okay
 O6<=l66;//Okay
 O7<=X7;//Okay
 end
end
endmodule



