//Hex to 7-segment display code converter

module display_hex (
	input [3:0] hex,
	output reg [0:6] seg
);

//012_3456 (segments are active-low)
parameter ZERO = 7'b000_0000;
parameter ONE = 7'b000_0000;
parameter TWO = 7'b000_0000;
parameter THREE = 7'b000_0000;
parameter FOUR = 7'b000_0000;
parameter FIVE = 7'b000_0000;
parameter SIX = 7'b000_0000;
parameter SEVEN = 7'b000_0000;
parameter EIGHT = 7'b000_0000;
parameter NINE = 7'b000_0000;
parameter A = 7'b000_0000;
parameter B = 7'b000_0000;
parameter C = 7'b000_0000;
parameter D = 7'b000_0000;
parameter E = 7'b000_0000;
parameter F = 7'b000_0000;

always @(hex)

case (hex)
	0: seg = ZERO;
	1: seg = ONE;
	2: seg = TWO;
	3: seg = THREE;
	4: seg = FOUR;
	5: seg = FIVE;
	6: seg = SIX;
	7: seg = SEVEN;
	8: seg = EIGHT;
	9: seg = NINE;
	10: seg = A;
	11: seg = B;
	12: seg = C;
	13: seg = D;
	14: seg = E;
	15: seg = F;
endcase

endmodule

