`timescale 1ns/1ns
module F_6(
  input CLK,
  input RESET,
  
  input [11:0] I0,
  
  output reg[11:0] O0,
  output reg[11:0] O1,
  output reg[11:0] O2,
  output reg[11:0] O3,
  output reg[11:0] O4,
  output reg[11:0] O5,
  output reg[11:0] O6,
  output reg[11:0] O7
  
  );


reg [11:0] L1,L2;

always @(posedge CLK) begin
 if (RESET) L1<=0;
 else L1<=I0;
end


always @(*) begin 
 if(L1[11]==0) begin
   L2[11]=1;
   L2[10:0]=L1[10:0];
 end
 else begin 
  L2[11]=0;
  L2[10:0]=L1[10:0];
 end
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

 O0<=0;
 O1<=L1;
 O2<=0;
 O3<=L2;
 O4<=0;
 O5<=L2;
 O6<=0;
 O7<=L1;

 end
end
endmodule
