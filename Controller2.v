module Controller2(
	input START.
	input CLK,
	input RESET,
	input [1:0] t_select,
	
	output inputBuffer_en,
	//output outputBuffer_en,
	//output DataValid,
	//output CoreReady,
	output wire [15:0]int_cnt;
	);




reg cnt_en;

up_counter UC1(.out(int_cnt),.enable(cnt_en),.clk(CLK),.reset(RESET));


 always @(posedge CLK) begin
	if(RESET) begin	
	inputBuffer_en<=0; end
	else if(START) begin
	inputBuffer_en<=1;
	cnt_en<=1
	end
	else if(int_cnt%8==0) begin
	cnt_en<=0;
	inputBuffer_en<=0;
	else begin
	cnt_en<=cnt_en;
	end
end
	
	

	
	

/*always @(posedge CLK) begin
	if(RESET) begin
	inputBuffer_en<=0;
	//outputBuffer_en<=0;
	//DataValid<=0;
	//CoreReady<=0;
	end
	else begin*/

	



module up_counter(					                  
out,  
enable,  
clk,  
reset     
);

output reg [15:0] out;
input enable,reset,clk;


always @(posedge clk)
if (reset) begin
  out <= 8'b0 ;
end 
else if (enable) begin
  out <= out + 1;
end
endmodule
