`timescale 1ns/1ns
module C_1_tb;
  reg CLK;
  reg RESET;
  reg [1:0] t_select;
  
  reg [11:0] I0;
  reg [11:0] I1;
  reg [11:0] I2;
  reg [11:0] I3;
  reg [11:0] I4;
  reg [11:0] I5;
  reg [11:0] I6;
  reg [11:0] I7;
  
  wire[11:0] rO0;
  wire[11:0] rO1;
  wire[11:0] rO2;
  wire[11:0] rO3;
  wire[11:0] rO4;
  wire[11:0] rO5;
  wire[11:0] rO6;
  wire[11:0] rO7;
  
  /*wire[11:0] iO0;
  wire[11:0] iO1;
  wire[11:0] iO2;
  wire[11:0] iO3;
  wire[11:0] iO4;
  wire[11:0] iO5;
  wire[11:0] iO6;
  wire[11:0] iO7;*/
  
  
  
  initial CLK = 1'b0;
  always #10 CLK = ~CLK;
  
  initial begin 
    RESET = 1'b1;
    #20 RESET=1'b0;//t_select=2'b00;
    
    #40 I0=12'd22; I1=12'd3; I2=12'd4; I3[11]=1; I3[10:0]=11'd1; I4=12'd6; I5=12'd7; I6=12'd4; I7[11]=1; I7[10:0]=11'd2;
    
    
    
  end
  
C_1 CATxer(.CLK(CLK),.RESET(RESET),.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),
.O0(rO0),.O1(rO1),.O2(rO2),.O3(rO3),.O4(rO4),.O5(rO5),.O6(rO6),.O7(rO7));//,.iO0(iO0),.iO1(iO1),.iO2(iO2),.iO3(iO3),.iO4(iO4),.iO5(iO5),.iO6(iO6),.iO7(iO7));
endmodule

    
  