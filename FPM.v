`timescale 1ns / 1ns

//Use 5 digit value for the fractional part of ROM Coefficient. Value should be less than 2^15 (32767)
/* Use the decimal part of input in b[30:15] and the fractional value of ROM in a[14:0] and the 
   the decimal value of a in a[30:15] if any. Use the signs of both in [31] part. */

module FPM(
    input [31:0] a,
    input [31:0] b,
    output reg [10:0] multout
    );
   
  wire [63:0] a_ext;
  wire [63:0] b_ext;
  wire [63:0] r_ext;
  
  reg [63:0] a_mult;
  reg [63:0] b_mult;
  reg [63:0] result;
  reg [63:0] retVal;
  wire [31:0] c;
  wire [10:0] multoutN;
  reg [30:0] remainder;
  wire [30:0] Quotient; 
  
  //Parameterized values
  parameter Q = 15;
  parameter N = 32;

  qtwosComp #(Q,N) comp_a (a[30:0], a_ext);

  qtwosComp #(Q,N) comp_b (b[30:0], b_ext);
  
  qtwosComp #(Q,N) comp_r (result[N-2+Q:Q], r_ext);
  
  assign c = retVal;
  assign multoutN = c[30:0]/10000;
  assign Quotient = multoutN*10000;
  always @(*) begin
    remainder = c[30:0]-Quotient;
    if (remainder>=5000) multout<=multoutN+1;
  else multout <=multoutN;
  end
  
  
  always @(a_ext,b_ext)
  begin
    if(a[N-1] == 1)
      a_mult <= a_ext;
    else
      a_mult <= a;
      
    if(b[N-1] == 1)
      b_mult <= b_ext;
    else
      b_mult <= b;		
  end 
  
  always @(a_mult,b_mult)
  begin
    result <= a_mult * b_mult;
  end;
  
  always @(result,r_ext)
  begin		
    //sign
    if((a[N-1] == 1 && b[N-1] == 0) || (a[N-1] == 0 && b[N-1] == 1)) begin
      retVal[N-1] <= 1;
      retVal[N-2:0] <= r_ext[N-2:0];
    end
    else begin
      retVal[N-1] <= 0;
      retVal[N-2:0] <= result[N-2+Q:Q];
    end
  end

endmodule

module qtwosComp(
    input [30:0] a,
    output [63:0] b
    );
  reg [63:0] data;
  reg [63:0] flip;
  reg [63:0] out;
  
  parameter Q=15;
  parameter N=32;
  
  assign b = out;
  
  always @(a)
  begin
    data <= a;		//if you dont put the value into a 64b register, when you flip the bits it wont work right
  end
  
  always @(data)
  begin
    flip <= ~a;
  end
  
  always @(flip)
  begin
    out <= flip + 1;
  end

endmodule