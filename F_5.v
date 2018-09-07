`timescale 1ns/1ns
module F_5(
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



reg[11:0] n0,n1,n2,n3;
wire [11:0] l1,l2,l3,l4,l5,l6;
wire [11:0] L3,L4,L5,L6;

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


Adder A14x(.in1(n0),.in2(n2),.out(l1));//I0+I2
Adder A15x(.in1(n1),.in2(n3),.out(l2));//I1+I3
Adder A14(.in1(l1),.in2(l2),.out(l3));//I0+I1+I2+I3
Subtractor S14x(.in1(l1),.in2(l2),.out(l4));//I0-I1+I2-I3
RightShifter RSHx(.in1(l3),.out(L3));//this is O0
RightShifter RSH1x(.in1(l4),.out(L4));//this is O2
Subtractor S15x(.in1(n0),.in2(n2),.out(l5));//I0-I2
Subtractor S16x(.in1(n1),.in2(n3),.out(l6));//I1-I3
RightShifter RSH2x(.in1(l5),.out(L5));//this is O1
RightShifter RSH22x(.in1(l6),.out(L6));//this is O3



always @(posedge CLK) begin
 if(RESET) begin
   O0<=0;
   O1<=0;
   O2<=0;
   O3<=0;
 end
 else begin
   O0<=L3;
   O1<=L5;
   O2<=L4;
   O3<=L6;
 end
end


endmodule




