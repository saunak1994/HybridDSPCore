`timescale 1ns/1ns
module H_1(
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
  reg [31:0] r;
  reg [31:0] L0,L1,L2,L3;
  wire [10:0] X0,X1,X2,X3;
  wire [11:0] X4,X5,X6,X7;
  
  
   
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
  
always @(*) begin
  if(RESET) begin
    L0=32'd0;
    L1=32'd0;
    L2=32'd0;
    L3=32'd0;
    
  end
else begin
  L0[31]=1'b0;
  L0[30:15]=n0[10:0];
  L0[14:0]=15'd0;

  L1[31]=1'b0;
  L1[30:15]=n1[10:0];
  L1[14:0]=15'd0;
  
  L2[31]=1'b0;
  L2[30:15]=n2[10:0];
  L2[14:0]=15'd0;
  
  L3[31]=1'b0;
  L3[30:15]=n3[10:0];
  L3[14:0]=15'd0;
   
end
end

always @(posedge CLK) begin
  if(RESET) begin
    r=32'd0;
  end
else begin
  r[31]=1'b0;
  r[30:15]=16'd0;
  r[14:0]=15'd7071;
end
end

 FPM F14(.a(r),.b(L0),.multout(X0));
 FPM F15(.a(r),.b(L1),.multout(X1));
 FPM F16(.a(r),.b(L2),.multout(X2));
 FPM F17(.a(r),.b(L3),.multout(X3));
 
 RightShifter RSH3x(.in1(n4),.out(X4));
 RightShifter RSH4x(.in1(n5),.out(X5));
 RightShifter RSH5x(.in1(n6),.out(X6));
 RightShifter RSH6x(.in1(n7),.out(X7));
 

 
 
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
 O0[10:0]<=X0;
 
 O1[11]<=n1[11];
 O1[10:0]<=X1;
 
 O2[11]<=n2[11];
 O2[10:0]<=X2;
 
 O3[11]<=n3[11];
 O3[10:0]<=X3;
 
 O4<=X6;
 O5<=X7;
 O6<=X5;
 O7<=X4;
 
 end
end
endmodule
