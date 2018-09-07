`timescale 1ns/1ps 

module Controller(clock,
rst,                                     //RESET signal(Active Low) for the controller
strt,                                      
sel,                                    
count,                                     
cnt_en,dt_load,dl_en,hwt_en,dct_en,dft_en,in_data_valid,out_data_valid                               
);
 
//-----------INPUT PORTS------------
input clock,rst,strt,sel[1:0],count;
output reg cnt_en,dt_load,dl_en,hwt_en,dct_en,dft_en,in_data_valid,out_data_valid; 


//-----------INPUT PORTS DATA TYPE------------
wire clock,rst,strt;
wire [1:0] sel;
wire [3:0] count;

//reg cnt_en=1'b0,dt_load=1'b0,dl_en=1'b0,hwt_en=1'b0,dct_en=1'b0,dft_en=1'b0,in_data_valid=1'b0,out_data_valid=1'b0; 

//-----------INTERNAL CONSTANTS/DEFINING VARIOUS STATES---------------
parameter size = 3;
parameter RESET = 3'h0;                    
parameter START = 3'h1;                     
parameter data_load = 3'h2;        
parameter hwt = 3'h3;                    
parameter dft = 3'h4;                       
parameter dct = 3'h5;               
parameter hold_hwt = 3'h6;              
parameter hold_dft = 3'h7;          

//-----------INTERNAL VARIABLES---------------
reg[size-1:0]	state;                       //SEQ PART OF THE FSM
reg [3:0] Count = 3'd0;
reg index = 0;
wire[size-1:0]	nxtState;                  //COMBINATIONAL PART OF THE FSM
wire [71:0] buffer;
wire [8:0] dataset [7:0];
//-----------FUNCTIONAL DESCRIPTION-----------
assign nxtState = controller_function(state, rst, strt, sel, count);
assign count = Count;
assign {dataset[7],dataset[6],dataset[5],dataset[4],dataset[3],dataset[2],dataset[1],dataset[0]}=buffer;

//------------MODULE INIT---------------------
//delayline dl(.en(dl_en),.clk(clock),.rst(rst),.data_load(dt_load),.count(Count), .pong(buffer),.valid(in_data_valid));

//-----------FUNCTION FOR COMBINATIONAL LOGIC------------
function [size-1:0] controller_function;
input [size-1:0] state;
input rst;
input strt;
input [1:0] sel;
input [3:0] count;

case(state)
RESET: if  (rst==1'b1) begin
		controller_function = START;                     //IF RESET GOES HIGH, CONTROLLER JUMPS TO START STATE
	      end else begin
		controller_function = RESET;                    //IF RESET IS LOW, CONTROLLER RETAINS RESET STATE
	      end

START:  if (strt==1'b1) begin
		controller_function = data_load;                     //Go to data load state
	      end else begin
		controller_function = START;       //Retain the START state
	      end
	      
data_load: if (count==4'h8 && sel==2'b11) begin
		controller_function =  hwt;
	      end else if (count==4'h8 && sel==2'b00) begin
		controller_function =  dct;
	      end else if (count==4'h8 && sel==2'b10) begin
		controller_function =  dft;
	      end else if (count < 4'h8) begin
	        controller_function =  data_load;
	      end

hwt:  if (count==4'h6) begin
		controller_function = hold_hwt;                     
	      end else if (count<4'h6) begin
		controller_function = hwt;
	      end 
dct:  if (count<4'h8) begin
		controller_function = dct;
	      end 
dft:  if (count<4'h5) begin 
		controller_function = dft;
	      end else if (count==4'h5) begin 
	 	controller_function = hold_dft;
	      end
hold_hwt: if (count<4'h8) begin 
		controller_function = hold_hwt;
	      end
hold_dft: if (count<4'h8) begin 
		controller_function = hold_dft;
	      end
default: controller_function = RESET;
	endcase
	endfunction

//---------Sequential Logic----------
always@(posedge clock)
begin: Controller_Seq
if (rst == 1'b0) begin
	state <= RESET;
end else begin
	state <= nxtState;
end
end

always@(posedge clock) begin
if(state == data_load && cnt_en==1'b1)begin
  Count<=Count+1;
  end  
end

//----Output Logic----
always@(negedge clock)
begin: Output_Logic
if (rst == 1'b0) begin
	cnt_en <= 1'b0;
	dt_load <= 1'b0;
	dl_en <= 1'b0;
	hwt_en <= 1'b0;
	dct_en <= 1'b0;
	dft_en <= 1'b0;
	in_data_valid <= 1'b0;
	out_data_valid <= 1'b0;
	 end
else begin
  case(state)
RESET: begin
	cnt_en <= 1'b0;
	dt_load <= 1'b0;
	dl_en <= 1'b0;
	hwt_en <= 1'b0;
	dct_en <= 1'b0;
	dft_en <= 1'b0;
	in_data_valid <= 1'b0;
	out_data_valid <= 1'b0;
	 end
START: begin
	cnt_en <= 1'b1;
	 end
data_load: begin
	dt_load <= 1'b1;
	dl_en <= 1'b1;
	if(count==4'h8) begin
	  Count <=4'b0;
		in_data_valid <= 1'b1;
		index = ~index;
	      end
	
	 end
hwt: begin
	hwt_en <= 1'b1;
	 end
dct: begin
	dct_en <= 1'b1;
	if(count==4'h8) begin
		out_data_valid <= 1'b1;
	      end
	 end
dft: begin
	dft_en = 1'b1;
	 end
hold_hwt: if (count==4'h8) begin
		out_data_valid <= 1'b1;
	      end
hold_dft: if (count==4'h8) begin
		out_data_valid <= 1'b1;
	      end
endcase
end
end //End of Block Output Logic


endmodule
