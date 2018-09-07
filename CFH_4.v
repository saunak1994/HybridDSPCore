`timescale 1ns/1ns
module CFH_4(
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
  wire [11:0] X0,X1,X2,X3;
  
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

Adder A10(.in1(n0),.in2(n2),.out(X0));
Adder A11(.in1(n1),.in2(n3),.out(X1));

Subtractor S11(.in1(n0),.in2(n2),.out(X2));
Subtractor S12(.in1(n1),.in2(n3),.out(X3));

always @(posedge CLK) begin
 if(RESET) begin
   O0<=0;
   O1<=0;
   O2<=0;
   O3<=0;
 end
 else begin
 O0<=X0;
 O1<=X1;
 O2<=X2;
 O3<=X3; 
 end
end
endmodule

