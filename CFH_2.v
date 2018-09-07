`timescale 1ns/1ns
module CFH_2(
  input CLK,
  input RESET,
  
  input[11:0] I0,
  input[11:0] I1,
  
  output reg[11:0] O0,
  output reg[11:0] O1
  );
  

  reg[31:0] r;
  reg[11:0] n0,n1;
  reg[31:0] L0,L1;
  reg[11:0] iO0,iO1;
  wire[11:0] X0,X1;
  wire [10:0]M0,M1;
  
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
    
    
  end
  else begin
    
  L0[31]=1'b0;
  L0[30:15]=iO0[10:0];
  L0[14:0]=15'd0; 
  L1[31]=1'b0;
  L1[30:15]=iO1[10:0];
  L1[14:0]=15'd0;
 
           
end
end



always @(posedge CLK) begin
  if(RESET) begin
    n0<=0;
    n1<=0;
  end
  else begin
    n0<=I0;
    n1<=I1;
  end
  end
  
  Adder A13(.in1(n0),.in2(n1),.out(X0));
  Subtractor S16(.in1(n0),.in2(n1),.out(X1));
  FPM Fx1(.a(r),.b(L0),.multout(M0));
  FPM Fx2(.a(r),.b(L1),.multout(M1));

always @(*) begin
 
 iO0<=X0;
 iO1<=X1;
 
 end

  
always @(posedge CLK) begin
 if(RESET) begin
  
   O0<=0;
   O1<=0;
 end
 else begin
   
 O0[11]<=iO0[11];
 O0[10:0]<=M0;
 O1[11]<=iO1[11];
 O1[10:0]<=M1; 
 end
end
endmodule
