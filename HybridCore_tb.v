`timescale 1ns/1ns
module HybridCore_tb;
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
  
  wire[11:0] iO0;
  wire[11:0] iO1;
  wire[11:0] iO2;
  wire[11:0] iO3;
  wire[11:0] iO4;
  wire[11:0] iO5;
  wire[11:0] iO6;
  wire[11:0] iO7;

  


initial CLK = 1'b0;
  always #10 CLK = ~CLK;
  
  initial begin 
    RESET = 1'b1;
    #20 RESET=1'b0;t_select=2'b01;
    
    #40 
    
    I0[11]=1;
    I0[10:0]=11'd3; 
    
    I1[11]=1;
    I1[10:0]=11'd7;
 
    I2[11]=0;
    I2[10:0]=11'd15;

    I3[11]=0;
    I3[10:0]=11'd2;

    I4[11]=0;
    I4[10:0]=11'd8;

    I5[11]=1;
    I5[10:0]=11'd4;

    I6[11]=1;
    I6[10:0]=11'd11;

    I7[11]=0;
    I7[10:0]=11'd1;


    
    
    
    #200 t_select=2'b10;
    
    #200 t_select=2'b00;
    
    
    
    
    
  end
  
HybridCore HC_1(.CLK(CLK),.RESET(RESET),.t_select(t_select),.I0(I0),.I1(I1),.I2(I2),.I3(I3),.I4(I4),.I5(I5),.I6(I6),.I7(I7),
.rO0(rO0),.rO1(rO1),.rO2(rO2),.rO3(rO3),.rO4(rO4),.rO5(rO5),.rO6(rO6),.rO7(rO7),.iO0(iO0),.iO1(iO1),.iO2(iO2),.iO3(iO3),.iO4(iO4),.iO5(iO5),.iO6(iO6),.iO7(iO7));
endmodule
