`timescale 1ns/1ns
module C_5(
  input CLK,
  input RESET,
  
  input [11:0] I0,
  input [11:0] I1,
  input [11:0] I2,
  input [11:0] I3,
  
  output reg[11:0] O0,
  output reg[11:0] O1,
  output reg[11:0] O2,
  output reg[11:0] O3
  );


reg [31:0] L0,L1,L2,L3;
reg[11:0] n0,n1,n2,n3;
wire [10:0] X0,X1,X2,X3;
reg[31:0] C1,C3,C5,C7;




always @(posedge CLK) begin
  if(RESET) begin
    C1=32'd0;
    C3=32'd0;
    C5=32'd0;
    C7=32'd0;
  end
else begin
  C1[31]=1'b0;
  C1[30:15]=16'd0;
  C1[14:0]=15'd9808;
  C3[31]=1'b0;
  C3[30:15]=16'd0;
  C3[14:0]=15'd8315;
  C5[31]=1'b0;
  C5[30:15]=16'd0;
  C5[14:0]=15'd5556;
  C7[31]=1'b0;
  C7[30:15]=16'd0;
  C7[14:0]=15'd1951;
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
    n0<=0;
    n1<=0;
    n2<=0;
    n3<=0;
  end
    else begin
    n0<=I0;
    n1<=I1;
    n2<=I2;
    n3<=I3;
  end  
end



FPM F10(.a(C1),.b(L0),.multout(X0));
FPM F11(.a(C3),.b(L1),.multout(X1));
FPM F12(.a(C5),.b(L2),.multout(X2));
FPM F13(.a(C7),.b(L3),.multout(X3));

always @(posedge CLK) begin
 if(RESET) begin
   O0<=0;
   O1<=0;
   O2<=0;
   O3<=0;
 end
 else begin
 O0[10:0]<=X0[10:0];
 O0[11]<=n0[11];
 O1[10:0]<=X1[10:0];
 O1[11]<=n1[11];
 O2[10:0]<=X2[10:0];
 O2[11]<=n2[11];
 O3[10:0]<=X3[10:0];
 O3[11]<=n3[11]; 
 end
end


endmodule