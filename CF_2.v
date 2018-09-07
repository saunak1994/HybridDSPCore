`timescale 1ns/1ns
module CF_2(
  input CLK,
  input RESET,
  
  input [11:0] I0,
  input [11:0] I1,
  input [11:0] I2,
  input [11:0] I3,
  input [11:0] I4,
  input [11:0] I5,
  
  output reg[11:0] O0,
  output reg[11:0] O1,
  output reg[11:0] O2,
  output reg[11:0] O3,
  output reg[11:0] O4,
  output reg[11:0] O5 
  );
  
  reg [31:0] r;
  reg[31:0] L0,L1,L2,L3,L4,L5;
  reg [11:0] n0,n1,n2,n3,n4,n5;
  reg [11:0] iO0,iO1,iO2,iO3,iO4,iO5;
  wire [11:0] X0,X1,X2,X3,X4,X5;
  wire [10:0] M0,M1,M2,M3,M4,M5;
  
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
 
 always @(*) begin
  if(RESET) begin
    L0=32'd0;
    L1=32'd0;
    L2=32'd0;
    L3=32'd0;
    L4=32'd0;
    L5=32'd0;
    
  end
  else begin
    
  L0[31]=1'b0;
  L0[30:15]=iO0[10:0];
  L0[14:0]=15'd0; 
  L1[31]=1'b0;
  L1[30:15]=iO1[10:0];
  L1[14:0]=15'd0;
  L2[31]=1'b0;
  L2[30:15]=iO2[10:0];
  L2[14:0]=15'd0;
  L3[31]=1'b0;
  L3[30:15]=iO3[10:0];
  L3[14:0]=15'd0;
  L4[31]=1'b0;
  L4[30:15]=iO4[10:0];
  L4[14:0]=15'd0;
  L5[31]=1'b0;
  L5[30:15]=iO5[10:0];
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
  end
   else begin
    n0<=I0;
    n1<=I1;
    n2<=I2;
    n3<=I3;
    n4<=I4;
    n5<=I5;
  end 
end

Adder A3 (.in1(n0),.in2(n1),.out(X0));
Adder A4 (.in1(n2),.in2(n3),.out(X2));
Adder A5 (.in1(n4),.in2(n5),.out(X4));

Subtractor S5(.in1(n0),.in2(n1),.out(X1));
Subtractor S6(.in1(n2),.in2(n3),.out(X3));
Subtractor S7(.in1(n4),.in2(n5),.out(X5));

FPM Fx1(.a(r),.b(L0),.multout(M0));
FPM Fx2(.a(r),.b(L1),.multout(M1));
FPM Fx3(.a(r),.b(L2),.multout(M2));
FPM Fx4(.a(r),.b(L3),.multout(M3));
FPM Fx5(.a(r),.b(L4),.multout(M4));
FPM Fx6(.a(r),.b(L5),.multout(M5));


always @(*) begin
 
 iO0<=X0;
 iO1<=X1;
 iO2<=X2;
 iO3<=X3;
 iO4<=X4;
 iO5<=X5;
 end

always @(posedge CLK) begin
  if(RESET) begin
   O0<=0;
   O1<=0;
   O2<=0;
   O3<=0;
   O4<=0;
   O5<=0;
   end
   
   else begin
   O0[11]<=iO0[11];
   O0[10:0]<=M0;
   O1[11]<=iO1[11];
   O1[10:0]<=M1;
   O2[11]<=iO2[11];
   O2[10:0]<=M2;
   O3[11]<=iO3[11];
   O3[10:0]<=M3;
   O4[11]<=iO4[11];
   O4[10:0]<=M4;
   O5[11]<=iO5[11];
   O5[10:0]<=M5; 
   end 
 end


endmodule

