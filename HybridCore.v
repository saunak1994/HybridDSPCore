`timescale 1ns/1ns
module HybridCore(
  
  input CLK,
  input RESET,
  input [1:0] t_select,
  input wire in_data_valid,
  
  
  input [11:0] I0,
  input [11:0] I1,
  input [11:0] I2,
  input [11:0] I3,
  input [11:0] I4,
  input [11:0] I5,
  input [11:0] I6,
  input [11:0] I7,


  output reg [11:0] rO0,
  output reg [11:0] rO1,
  output reg [11:0] rO2,
  output reg [11:0] rO3,
  output reg [11:0] rO4,
  output reg [11:0] rO5,
  output reg [11:0] rO6,
  output reg [11:0] rO7,
  
  output reg [11:0] iO0,
  output reg [11:0] iO1,
  output reg [11:0] iO2,
  output reg [11:0] iO3,
  output reg [11:0] iO4,
  output reg [11:0] iO5,
  output reg [11:0] iO6,
  output reg [11:0] iO7           

  );
  
 
  reg [11:0] C_1I0,C_1I1,C_1I2,C_1I3,C_1I4,C_1I5,C_1I6,C_1I7;
  wire [11:0] C_1O0,C_1O1,C_1O2,C_1O3,C_1O4,C_1O5,C_1O6,C_1O7;

  reg [11:0] CF_2I0,CF_2I1,CF_2I2,CF_2I3,CF_2I4,CF_2I5;
  wire [11:0] CF_2O0,CF_2O1,CF_2O2,CF_2O3,CF_2O4,CF_2O5;
  
  reg [11:0] CFH_2I0,CFH_2I1;
  wire [11:0] CFH_2O0,CFH_2O1;

  reg [11:0] C_3I0,C_3I1,C_3I2,C_3I3,C_3I4,C_3I5,C_3I6,C_3I7;
  wire [11:0] C_3O0,C_3O1,C_3O2,C_3O3,C_3O4,C_3O5,C_3O6,C_3O7;

  reg [11:0] CF_4I0,CF_4I1,CF_4I2,CF_4I3;
  wire [11:0] CF_4O0,CF_4O1,CF_4O2,CF_4O3;

  reg [11:0] CFH_4I0,CFH_4I1,CFH_4I2,CFH_4I3;
  wire [11:0] CFH_4O0,CFH_4O1,CFH_4O2,CFH_4O3;

  reg [11:0] F_3I0,F_3I1,F_3I2,F_3I3,F_3I4,F_3I5,F_3I6,F_3I7;
  wire [11:0] F_3O0,F_3O1,F_3O2,F_3O3,F_3O4,F_3O5,F_3O6,F_3O7;


  reg [11:0] C_5I0,C_5I1,C_5I2,C_5I3;//C_5I4,C_5I5,C_5I6,C_5I7;
  wire [11:0] C_5O0,C_5O1,C_5O2,C_5O3;//C_5O4,C_5O5,C_5O6,C_5O7;

  reg [11:0] CFH_6I0,CFH_6I1,CFH_6I2,CFH_6I3,CFH_6I4,CFH_6I5,CFH_6I6,CFH_6I7;
  wire [11:0] CFH_6O0,CFH_6O1,CFH_6O2,CFH_6O3,CFH_6O4,CFH_6O5,CFH_6O6,CFH_6O7;
 
  reg [11:0] F_5I0,F_5I1,F_5I2,F_5I3;
  wire [11:0] F_5O0,F_5O1,F_5O2,F_5O3;

  reg [11:0] F_6I0;
  wire [11:0] F_6O0,F_6O1,F_6O2,F_6O3,F_6O4,F_6O5,F_6O6,F_6O7;
 
  wire [11:0] H_1O0,H_1O1,H_1O2,H_1O3,H_1O4,H_1O5,H_1O6,H_1O7;
  reg [11:0] H_1I0,H_1I1,H_1I2,H_1I3,H_1I4,H_1I5,H_1I6,H_1I7;
  
  wire [11:0] H_5O0,H_5O1,H_5O2,H_5O3;
  reg [11:0] H_5I0,H_5I1,H_5I2,H_5I3;


  
  

  
  
  
  
    C_1 C_1x(.CLK(CLK),.RESET(RESET),.I0(C_1I0),.I1(C_1I1),.I2(C_1I2),.I3(C_1I3),.I4(C_1I4),.I5(C_1I5),.I6(C_1I6),.I7(C_1I7),.O0(C_1O0),.O1(C_1O1),.O2(C_1O2),.O3(C_1O3),.O4(C_1O4),.O5(C_1O5),.O6(C_1O6),.O7   (C_1O7)); //Done
    
    CF_2 CF_2x(.CLK(CLK),.RESET(RESET),.I0(CF_2I0),.I1(CF_2I1),.I2(CF_2I2),.I3(CF_2I3),.I4(CF_2I4),.I5(CF_2I5),.O0(CF_2O0),.O1(CF_2O1),.O2(CF_2O2),.O3(CF_2O3),.O4(CF_2O4),.O5(CF_2O5)); //Done
    
    CFH_2 CFH_2x(.CLK(CLK),.RESET(RESET),.I0(CFH_2I0),.I1(CFH_2I1),.O0(CFH_2O0),.O1(CFH_2O1));//Done

    C_3 C_3x(.CLK(CLK),.RESET(RESET),.I0(C_3I0),.I1(C_3I1),.I2(C_3I2),.I3(C_3I3),.I4(C_3I4),.I5(C_3I5),.I6(C_3I6),.I7(C_3I7),.O0(C_3O0),.O1(C_3O1),.O2(C_3O2),.O3(C_3O3),.O4(C_3O4),.O5(C_3O5),.O6(C_3O6),.O7(C_3O7));//Done

    CF_4 CF_4x(.CLK(CLK),.RESET(RESET),.I0(CF_4I0),.I1(CF_4I1),.I2(CF_4I2),.I3(CF_4I3),.O0(CF_4O0),.O1(CF_4O1),.O2(CF_4O2),.O3(CF_4O3));//Done

    CFH_4 CFH_4y(.CLK(CLK),.RESET(RESET),.I0(CFH_4I0),.I1(CFH_4I1),.I2(CFH_4I2),.I3(CFH_4I3),.O0(CFH_4O0),.O1(CFH_4O1),.O2(CFH_4O2),.O3(CFH_4O3));//Done

    C_5 C_5x1(.CLK(CLK),.RESET(RESET),.I0(C_5I0),.I1(C_5I1),.I2(C_5I2),.I3(C_5I3),.O0(C_5O0),.O1(C_5O1),.O2(C_5O2),.O3(C_5O3));//Done

    CFH_6 CFH_6x(.CLK(CLK),.RESET(RESET),.I0(CFH_6I0),.I1(CFH_6I1),.I2(CFH_6I2),.I3(CFH_6I3),.I4(CFH_6I4),.I5(CFH_6I5),.I6(CFH_6I6),.I7(CFH_6I7),.O0(CFH_6O0),.O1(CFH_6O1),.O2(CFH_6O2),.O3(CFH_6O3),.O4(CFH_6O4),.O5(CFH_6O5),.O6(CFH_6O6),.O7(CFH_6O7));//Done

    F_3 F_3jhh(.CLK(CLK),.RESET(RESET),.I0(F_3I0),.I1(F_3I1),.I2(F_3I2),.I3(F_3I3),.I4(F_3I4),.I5(F_3I5),.I6(F_3I6),.I7(F_3I7),.O0(F_3O0),.O1(F_3O1),.O2(F_3O2),.O3(F_3O3),.O4(F_3O4),.O5(F_3O5),.O6(F_3O6),.O7   (F_3O7)); 
    
    F_5 F_5xy(.CLK(CLK),.RESET(RESET),.I0(F_5I0),.I1(F_5I1),.I2(F_5I2),.I3(F_5I3),.O0(F_5O0),.O1(F_5O1),.O2(F_5O2),.O3(F_5O3));//Done

    F_6 F_6xyz(.CLK(CLK),.RESET(RESET),.I0(F_6I0),.O0(F_6O0),.O1(F_6O1),.O2(F_6O2),.O3(F_6O3),.O4(F_6O4),.O5(F_6O5),.O6(F_6O6),.O7(F_6O7));//Done
    
    
    H_1 H_1x(.CLK(CLK),.RESET(RESET),.I0(H_1I0),.I1(H_1I1),.I2(H_1I2),.I3(H_1I3),.I4(H_1I4),.I5(H_1I5),.I6(H_1I6),.I7(H_1I7),.O0(H_1O0),.O1(H_1O1),.O2(H_1O2),.O3(H_1O3),.O4(H_1O4),.O5(H_1O5),.O6(H_1O6),.O7(H_1O7));//Done

    H_5 H_5x(.CLK(CLK),.RESET(RESET),.I0(H_5I0),.I1(H_5I1),.I2(H_5I2),.I3(H_5I3),.O0(H_5O0),.O1(H_5O1),.O2(H_5O2),.O3(H_5O3));//Done


  
  

always @(*) begin
  
  case (t_select) 
    
    2'b00: begin
	   
     C_1I0=I0;
	   C_1I1=I1;
	   C_1I2=I2;
	   C_1I3=I3;
	   C_1I4=I4;
	   C_1I5=I5;
	   C_1I6=I6;
	   C_1I7=I7;

     CF_2I0=C_1O0;
     CF_2I1=C_1O1;
     CF_2I2=C_1O2;
     CF_2I3=C_1O3;
     CF_2I4=C_1O4;
     CF_2I5=C_1O5;
           
     CFH_2I0=C_1O6;
     CFH_2I1=C_1O7;
           
     C_3I0=CF_2O0;
	   C_3I1=CF_2O1;
	   C_3I2=CF_2O2;
	   C_3I3=CF_2O3;
	   C_3I4=CF_2O4;
	   C_3I5=CF_2O5;
	   
	   C_3I6=CFH_2O0;
	   C_3I7=CFH_2O1;
	   
	   CF_4I0=C_3O0;
	   CF_4I1=C_3O1;
	   CF_4I2=C_3O2;
	   CF_4I3=C_3O3;
	   
 	   CFH_4I0=C_3O4;
	   CFH_4I1=C_3O5;
	   CFH_4I2=C_3O6;
	   CFH_4I3=C_3O7;

	   C_5I0=CFH_4O0;
	   C_5I1=CFH_4O1;
	   C_5I2=CFH_4O2;
	   C_5I3=CFH_4O3;
	   
	  
	   CFH_6I0=CF_4O0;
	   CFH_6I1=CF_4O1;
	   CFH_6I2=CF_4O2;
	   CFH_6I3=CF_4O3;
	   CFH_6I4=C_5O0;
	   CFH_6I5=C_5O1;
	   CFH_6I6=C_5O2;
	   CFH_6I7=C_5O3;

	   rO0=CFH_6O0;
	   rO1=CFH_6O1;
	   rO2=CFH_6O2;
	   rO3=CFH_6O3;
	   rO4=CFH_6O4;
	   rO5=CFH_6O5;
	   rO6=CFH_6O6;
	   rO7=CFH_6O7;

	   iO0=0;
	   iO1=0;
	   iO2=0;
	   iO3=0;
	   iO4=0;
	   iO5=0;
	   iO6=0;
	   iO7=0;
	   
     end
	

  2'b01: begin
	
	       H_1I0 = I0;
         H_1I1 = I1;
         H_1I2 = I2;
         H_1I3 = I3;
         H_1I4 = I4;
         H_1I5 = I5;
         H_1I6 = I6;
         H_1I7 = I7;
                  
         CFH_2I0 = H_1O7;
         CFH_2I1 = H_1O6;
         
         CFH_4I2 = CFH_2O0;
         CFH_4I3 = CFH_2O1;
         CFH_4I0 = H_1O4;
         CFH_4I1 = H_1O5;
         
         H_5I0 = CFH_4O0; 
         H_5I1 = CFH_4O1; 
         H_5I2 = CFH_4O2; 
         H_5I3 = CFH_4O3;
         
         CFH_6I4 = H_5O0; 
         CFH_6I5 = H_5O1;
         CFH_6I6 = H_5O2;
         CFH_6I7 = H_5O3;
         CFH_6I0 = H_1O0;
         CFH_6I1 = H_1O1;
         CFH_6I2 = H_1O2;
         CFH_6I3 = H_1O3;
         
         rO0 = CFH_6O0;
         rO1 = CFH_6O1;
         rO2 = CFH_6O2;
         rO3 = CFH_6O3;
         rO4 = CFH_6O4;
         rO5 = CFH_6O5;
         rO6 = CFH_6O6;
         rO7 = CFH_6O7;
	
	       iO0=0;
	       iO1=0;
	       iO2=0;
	       iO3=0;
	       iO4=0;
	       iO5=0;
	       iO6=0;
	       iO7=0;
end




 2'b10: begin
	 
	 CF_2I0 = I0;
         CF_2I1 = I1;
         CF_2I2 = I2;
         CF_2I3 = I3;
         CF_2I4 = I4;
         CF_2I5 = I6;//Flip
         
         CFH_2I0 = I5;//Flip 
         CFH_2I1 = I7;
         
         F_3I0 = CF_2O0;
         F_3I1 = CF_2O1;
         F_3I2 = CF_2O2;
         F_3I3 = CF_2O3;
         F_3I4 = CF_2O4;
         F_3I5 = CF_2O5;
         F_3I6 = CFH_2O0;
         F_3I7 = CFH_2O1;
         
         CF_4I0 = F_3O0;
	 CF_4I1 = F_3O1;
	 CF_4I2 = F_3O2;
	 CF_4I3 = F_3O3;
	       
	 CFH_4I0 = F_3O4;
         CFH_4I1 = F_3O5;
         CFH_4I2 = F_3O6;
         CFH_4I3 = F_3O7;

	 CFH_6I0 = CF_4O0;
	 CFH_6I1 = CF_4O1;
	 CFH_6I2 = CF_4O2;
	 CFH_6I3 = CF_4O3;

	 F_5I0 = CFH_4O0;
	 F_5I1 = CFH_4O1;
	 F_5I2 = CFH_4O2;
 	 F_5I3 = CFH_4O3;

	 CFH_6I4 = F_5O0;
	 CFH_6I5 = F_5O1;
	 CFH_6I6 = F_5O2;
	 CFH_6I7 = F_5O1;

	 F_6I0 = F_5O3;
	    
	    
	    rO0 = CFH_6O0;
            rO1 = CFH_6O1;
            rO2 = CFH_6O2;
            rO3 = CFH_6O3;
            rO4 = CFH_6O4;
            rO5 = CFH_6O5;
            rO6 = CFH_6O6;
            rO7 = CFH_6O7;
     
            iO0=F_6O0;
            iO1=F_6O1;
            iO2=F_6O2;
            iO3=F_6O3;
            iO4=F_6O4;
            iO5=F_6O5;
            iO6=F_6O6;
            iO7=F_6O7;
   end
	 

     	   endcase
	   end
endmodule


  
  
  
  
  
  
  
  
  
  
  
