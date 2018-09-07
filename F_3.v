`timescale 1ns/1ns
module F_3(
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

reg [11:0] n0,n1,n2,n3,n4,n5,n6,n7;
wire[11:0] l2,l6,l3,l7; 
reg [31:0] L0,L1,L4,L5; 
reg [31:0] underR;
wire [10:0] X0,X1,X4,X5;

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
    L0=32'd0;
    L1=32'd0;
    L4=32'd0;
    L5=32'd0;
  end
else begin

  L0[31]=1'b0;
  L0[30:15]=n0[10:0];
  L0[14:0]=15'd0;
  L1[31]=1'b0;
  L1[30:15]=n1[10:0];
  L1[14:0]=15'd0;
  L4[31]=1'b0;
  L4[30:15]=n4[10:0];
  L4[14:0]=15'd0;
  L5[31]=1'b0;
  L5[30:15]=n5[10:0];
  L5[14:0]=15'd0;
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

Adder A13(.in1(n2),.in2(n3),.out(l2));
Adder A14(.in1(n6),.in2(n7),.out(l6));

Subtractor S16(.in1(n2),.in2(n3),.out(l3));
Subtractor S17(.in1(n6),.in2(n7),.out(l7));


FPM F10(.a(underR),.b(L0),.multout(X0));
FPM F11(.a(underR),.b(L1),.multout(X1));
FPM F12(.a(underR),.b(L4),.multout(X4));
FPM F13(.a(underR),.b(L5),.multout(X5));



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
 O0[11]<=n0[11];
 O0[10:0]<=X0+n0[10:0];
 O1[11]<=n1[11];
 O1[10:0]<=X1+n1[10:0];
 O2<=l2;
 O3<=l3;
 O4[11]<=n4[11];
 O4[10:0]<=X4+n4[10:0];
 O5[11]<=n5[11];
 O5[10:0]<=X5+n5[10:0];
 O6<=l6;
 O7<=l7; 
 end
end
endmodule
