`timescale 1ns/1ps  //DEFINING THE TIMESCALE AND PRECISION TIME

module Controller_tb();

reg clock,rst,strt;
reg [1:0]t_select;
reg [3:0]Count; 
reg[3:0] count;

wire cnt_en,dt_load,dl_en,hwt_en,dct_en,dft_en,in_data_valid,out_data_valid; 

Controller tb(clock,rst,strt,t_select,count,cnt_en,dt_load,dl_en,hwt_en,dct_en,dft_en,in_data_valid,out_data_valid);

//---DEFINING THE CLOCK PERIOD TO BE 10NS WITH A DUTY CYCLE OF 50%---
always 
    begin
       clock<=0;
	#5;
	     clock<=1;
	#5;
	end

initial 
begin

rst = 1'b0; //Stay in Reset State
//Count = 3'd0;

#7 rst = 1'b1; //Move to Start State

#7 rst = 1'b0; //Move to Reset State

#9 rst = 1'b1; //Move to Start State

#4 strt = 1'b0; //Stay in Start state

#5 strt = 1'b1; //Go to Data_Load State

//#6 count = 4'h4; //Stay in Data Load State

#4 t_select <= 2'b11; //Go to HWT

#5 count = 4'h6; //Go to Hold HWT

#10 count = 4'h7; // Should Stay in Hold state

#3 count = 4'h8;



end
endmodule




