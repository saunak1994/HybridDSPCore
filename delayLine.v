`timescale 1ns/1ps
module delayline(en,rst,clk,data_load,count,O0,O1,O2,O3,O4,O5,O6,O7,valid);


input clk,en,rst,valid;
input data_load;
input [3:0] count;


reg [71:0] ping;
reg [71:0] pong;

reg index = 1'b0;


//reg data[63:0] = 64'd10102578684236987456;
//reg [71:0] data = 72'd1031042578684236987456;
//reg [8:0] data [7:0];

 //data[0] = 9'b110100100;
//assign data[1] = 9'b011100110;
//assign data[2] = 9'b100111001;
//assign data[3] = 9'b011001110;
//assign data[4] = 9'b011110001;
//assign data[5] = 9'b110011110;
//assign data[6] = 9'b100111100;
//assign data[7] = 9'b111000110;

//reg [71:0] data = 72'd405122589636574899632;


wire [3:0] count;

wire valid;
wire en,rst;


  
  always@(posedge clk)
 begin 
  
  if(count <4'd8 && data_load==1)
    begin
      ping[9*count +:9]<= data[9*count +:9];
    end
  
  if(count == 4'd0)
    begin
     ping <= 72'd0;
     pong[71:0] <= ping[71:0];
     O0 <= pong[71:63];
     O1 <= pong[62:54];
     O2 <= pong[53:45];
     O3 <= pong[44:36];
     O4 <= pong[35:27];
     O5 <= pong[26:18];
     O6 <= pong[17:9];
     O7 <= pong[8:0];
     
     if(valid) begin
            
     data<= 64'd125789698574569863214;
     
    end
    
  
  end 
 end 
endmodule 


