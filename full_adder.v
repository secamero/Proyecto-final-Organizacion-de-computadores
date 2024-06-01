// Full_Adder
module full_adder(
	input wire a,
	input wire b,
	input wire cin,
	output wire cout,
	output wire s);
assign s 	= a ^ b ^ cin; // sum
assign cout = (a & b) | (a & cin) | (b & cin); // Carry out

endmodule
