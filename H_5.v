`timescale 1ns/1ns
module H_5(
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
  
  reg [11:0] n0,n1,n2,n3;
  reg [11:0] l1,l3;

 
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
 
 always@(*) begin
   if(n1[11]==1'b0) begin
   l1[11] = 1'b1;
   l1[10:0] = n1[10:0];
 end else begin
   l1[11] = 1'b0;
   l1[10:0] = n1[10:0];
 end
 end  
  
  
  always@(*) begin
   if(n3[11]==1'b0) begin
   l3[11] = 1'b1;
   l3[10:0] = n3[10:0];
 end else begin
   l3[11] = 1'b0;
   l3[10:0] = n3[10:0];
 end
 end  
  
  
always @(posedge CLK) begin
 if(RESET) begin
   O0<=0;
   O1<=0;
   O2<=0;
   O3<=0;
 end
 else begin
 O0<=n0;
 O1<=n2;
 O2<=l1;
 O3<=l3;
 end
end
endmodule