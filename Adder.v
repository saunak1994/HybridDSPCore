`timescale 1ns/1ns 
module Adder(in1,in2,out);
  input wire [11:0] in1;
  input wire [11:0] in2;
  output reg [11:0] out;
  
  
  reg [10:0] n1;
  reg [10:0] n2;

  
always@(*)
begin
  n1[10:0] <= in1[10:0];
  n2[10:0] <= in2[10:0];
  
  if (in1[11]==1'b1 && in2[11]==1'b1) begin
       out[10:0] <= n1+n2;
       out[11] <= 1'b1;
    end else if (in1[11]==1'b0 && in2[11]==1'b1) begin
      if(n1>=n2) begin
        out[10:0] <= n1-n2;
        out[11] <= 1'b0;
      end else begin
        out[10:0] <= n2-n1;
        out[11] <= 1'b1;
       end 
       end else if (in1[11]==1'b1 && in2[11]==1'b0) begin
         if (n2>=n1) begin        
    out[10:0] <= n2-n1;
    out[11] <= 1'b0;
  end else begin
     out[10:0] <= n1-n2;
    out[11] <= 1'b1;
  end 
  end else if (in1[11]==1'b0 && in2[11]==1'b0) begin
    out[10:0] <= n1+n2;
    out[11] <= 1'b0;
  end
end
endmodule


    
    

