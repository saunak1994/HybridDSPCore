`timescale 1ns/1ns
module C_3(
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
reg[31:0] C2,C6;

reg [31:0] L1,L2,L3,L4;
wire [10:0] X2,X3,X6,X7;

always @(posedge CLK) begin
  if(RESET) begin
    C2=32'd0;
    C6=32'd0;
  end
else begin
  C2[31]=1'b0;
  C2[30:15]=16'd0;
  C2[14:0]=15'd9239;
  C6[31]=1'b0;
  C6[30:15]=16'd0;
  C6[14:0]=15'd3827;
    
end
end



always @(*) begin
  if(RESET) begin
    L1=32'd0;
    L3=32'd0;
    L4=32'd0;
    L2=32'd0;
  end
  else begin
  L3[31]=1'b0;
  L3[30:15]=n6[10:0];
  L3[14:0]=15'd0;
  L4[31]=1'b0;
  L4[30:15]=n7[10:0];
  L4[14:0]=15'd0;
  L2[31]=1'b0;
  L2[30:15]=n3[10:0];
  L2[14:0]=15'd0;
  L1[31]=1'b0;
  L1[30:15]=n2[10:0];
  L1[14:0]=15'd0;
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


FPM F4(.a(C2),.b(L1),.multout(X2));
FPM F5(.a(C6),.b(L2),.multout(X3));
FPM F6(.a(C2),.b(L3),.multout(X6));
FPM F7(.a(C6),.b(L4),.multout(X7));

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
 O0<=n0;
 O1<=n1;
 O2[11]<=n2[11];
 O2[10:0]<=X2;
 O3[11]<=n3[11];
 O3[10:0]<=X3;
 O4<=n4;
 O5<=n5;
 O6[11]<=n6[11];
 O6[10:0]<=X6; 
 O7[11]<=n7[11];
 O7[10:0]<=X7; 
 end
end
endmodule

