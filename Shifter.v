`timescale 1ns/1ns
module Shifter(
  input [11:0]in1,
  output reg[11:0]out
  );
  
  reg[10:0]inVal;
  
  always @(*) begin
    inVal=in1[10:0];
  end
  
  always @(*) begin
    out[10:0]=(inVal<<1);
    out[11]=in1[11];
  end
  
endmodule


    
    
