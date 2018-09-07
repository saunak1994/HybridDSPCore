`timescale 1ns/1ns
module CFH_6(
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
  wire [11:0] X0,X1,X2,X3,X4,X5,X6,X7;
  
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

Adder A6(.in1(n0),.in2(n4),.out(X0));
Adder A7(.in1(n1),.in2(n5),.out(X1));
Adder A8(.in1(n2),.in2(n6),.out(X2));
Adder A9(.in1(n3),.in2(n7),.out(X3));

Subtractor S8(.in1(n0),.in2(n4),.out(X4));
Subtractor S9(.in1(n1),.in2(n5),.out(X5));
Subtractor S10(.in1(n2),.in2(n6),.out(X6));
Subtractor S11(.in1(n3),.in2(n7),.out(X7));

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
 O0<=X0;
 O1<=X1;
 O2<=X2;
 O3<=X3;
 O4<=X4;
 O5<=X5;
 O6<=X6;
 O7<=X7; 
 end
end
endmodule






