
module reg32_master_avalon_interface(



input clk,
input reset_n,

output reg write,   //telling the salve to write or read

output reg [31:0] writedata, //writedata is output(outputing to the slave)
output reg read,

input  [31:0] readdata, //input or output

output[3:0] byteenable
);
parameter MAX_COUNT = 'd50_000_000;
assign byteenable=4'b1111;

reg [25:0] counter = 26'b0;
reg [1:0] state= 2'b0;
reg [2:0] nextstate = 3'b0;
reg [31:0] storage;

always @ (*)
begin
	nextstate = state;
	case (state)
	0:
	begin
		if (counter == MAX_COUNT)
			nextstate = 3'b1;
	end
	1:
	begin
		nextstate = 3'b10;	
	end
	2:
	begin
		nextstate = 3'b11;	
	end
	3:
	begin
		counter = 0;
		nextstate = 3'b0;	
	end
	endcase
end

always @(posedge clk )
begin
	if(!reset_n)
	begin
		state <= 0;
		counter <= 0;
	end
	else
	begin
		state <= nextstate;
		if (counter < MAX_COUNT)
			counter <= counter + 1;
	end
end

always @ (posedge clk)
begin
		case(state)
		 0: // idle state
		 begin 
		 	read <= 1'b0;
			write <= 1'b0;
		//	chipselect <= 1'b0;
			writedata <= 32'h0000;			
		 end
		 
		 1: 
		 begin
		 	read <= 1'b1;
			write <= 1'b0;
			//chipselect <= 1'b1;
			writedata <= 32'h0000;	
		 end
		 
		 2: 
		 begin
			storage <= readdata;
		 	read <= 1'b0;
			write <= 1'b0;
		//	chipselect <= 1'b0;
			writedata <= 32'h0000;
		 end
		 
		 3:		 
		 begin
		 	read <= 1'b0;
			write <= 1'b1;
			//chipselect <= 1'b1;
			if(storage != 32'b0)
				writedata <= storage + 1;
			else
				writedata <= storage;	
			//counter <= 26'b0;	
		end
	  endcase
	end	
endmodule










