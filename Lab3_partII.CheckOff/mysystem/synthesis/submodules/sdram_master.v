module sdram_master (
	input clk,
	output reg read_n =1 ,
	output reg write_n  = 1,
	output chipselect,
	input waitrequest,
	output reg [31:0] address = 0,
	output [1:0] byteenable,
	input readdatavalid,
	input [15:0] readdata,
	output reg [15:0] writedata,
	input reset_n
	
//	output [31:0] state_ex
);
parameter S0 = 6'b1, S1 = 6'b10, S2 = 6'b100, S3 = 6'b1000, S4 = 6'b10000, S5 = 6'b100000;

reg [15:0] max = 16'h0;
reg [15:0] min = 16'hFFFF;
reg [4:0] counter = 5'b0;
reg [4:0] rcv_counter = 5'b0;
reg [5:0] state = S0;

parameter SDRAM_BASE = 32'hC0000000;

assign byteenable = 2'b11;
assign chipselect = 1;
//assign state_ex = {max, min};

always @ (posedge clk) // state changes
begin
	if (!reset_n)
		state <= S0;
	else
	begin
		if (waitrequest == 0)
		begin
			case (state)
			S0:
			begin
				state <= (readdatavalid && readdata == 16'hFFFE) ? S2: S0; // 16'hffff <-- start signal
			end

			S1:
			begin	
				state <= (rcv_counter > 'd9) ? S3: S2;
			end

			S2:
			begin
				state <= (rcv_counter > 'd9) ? S3: S2; //
//				state <= (readdatavalid) ? S1: S2;
			end
			S3:
			begin
				state <= S4;	
			end
			S4:
			begin
				state <= S5;	
			end
			S5:
			begin
				state <= S0;	
			end
			endcase
		end
		else 
			state <= state;
	end
end

always @ (posedge clk) // change address/counter
begin
	case (state)
	S0:
	begin
		address <= (waitrequest == 0 && readdatavalid && readdata == 16'hFFFE) ? SDRAM_BASE: SDRAM_BASE + 'd20; //16'hFFFF <-- start signal
		counter <= 5'b0;
	end
	S1:
	begin
		address <= SDRAM_BASE + counter;
		counter <= counter;
	end
	S2:
	begin
		address <= (waitrequest == 0) ? SDRAM_BASE + counter + 2: SDRAM_BASE + counter;
		counter <= (waitrequest == 0) ? counter + 2: counter;
	end
	S3:
		address <= SDRAM_BASE + 'd2;
	S4:
		address <= SDRAM_BASE + 'd4;
	S5:
		address <= SDRAM_BASE + 'd20;
	endcase
end


always @ (posedge clk) // handle readdata and max/min
begin
	case (state)
	S0:
	begin
		max <= 16'h0;
		min <= 16'hFFFF;
		rcv_counter <= 5'b0;
	end
	S2:
	begin
		max <= (readdatavalid && readdata > max && readdata != 16'hFFFF && readdata != 16'hFFFE) ? readdata: max;
		min <= (readdatavalid && readdata < min) ? readdata: min;
		rcv_counter <= (readdatavalid) ? rcv_counter + 1: rcv_counter;
	end
	default:
	begin
		max <= max;
		min <= min;
	end
	endcase
end

always @ (posedge clk) // output logic
begin

	read_n <= 1;
	write_n <= 1;
	writedata <= 16'b0;

	case (state)
		S0: // idle state
		begin
			read_n <= 0;		
		end
		
		S1:
		begin
			if(counter < 'd20)
				read_n <= 0;
		end

		S2:
		begin				
			if(counter < 'd20)
				read_n <= 0;
		end
		
		S3:
		begin
			write_n <= 0;
			writedata <= max;
		end
		
		S4:
		begin
			write_n <= 0;
			writedata <= min;
		end
		S5:
		begin
			write_n <= 0;
			writedata <= 16'hFFFF; //16'h0 <-- DONE signal
		end
	endcase 
end


endmodule
