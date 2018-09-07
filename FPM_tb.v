`timescale 1ns/1ns
module FPM_tb;
  
  reg [31:0]a;
  reg [31:0]b;
  wire [31:0]multout;
  
  
  initial begin
  #0 a=0; b=0;
  #20 a[31] =0; a[30:15]=16'd0; a[14:0]=15'd19509; b[31]=0; b[30:15] = 16'd21; b[14:0] =15'd0;
  end
//wire [31:0] ans=c/100000;
FPM fpm0(.a(a),.b(b),.multout(multout));

endmodule
