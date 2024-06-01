// Processing Unit
`timescale 1 ns/10 ps
module processing_unit #(parameter N = 8) // Generic N
(
	input wire [N-1:0] dataa,
	input wire [N-1:0] datab,
	input wire [2:0] selop,
	output reg [N-1:0] result,
	output wire cout
);
	
wire [N-1:0] not_b;
wire [N-1:0] a_and_b;
wire [N-1:0] a_or_b;
wire [N-1:0] a_xor_b;
wire [N-1:0] a_plus_b;
wire [N-1:0] b_plus_one;
wire [N-1:0] neg_b;
wire c_add, c_plus1, c_negB;
wire [N-1:0] zeros;

assign zeros = {N{1'b0}};

assign not_b = ~datab;
assign a_and_b = dataa & datab;
assign a_or_b = dataa | datab;
assign a_xor_b = dataa ^ datab;

// Instantiate add_sub for A+B
add_sub #(.N(N)) AplusB (
	.a (dataa),
	.b (datab),
	.addn_sub(1'b0),
	.s(a_plus_b),
	.cout(c_add)
);

// Instantiate add_sub for B+1
add_sub #(.N(N)) Bplus1 (
	.a(datab),
	.b({zeros[N-1:1],1'b1}),
	.addn_sub(1'b0),
	.s(b_plus_one),
	.cout(c_plus1)
);

// Instantiate add_sub for -B (two´s complement negation)
add_sub #(.N(N)) negB (
	.a({N{1'b0}}),
	.b(datab),
	.addn_sub(1'b1),
	.s(neg_b),
	.cout(c_negB)
);

// Result Mux
always @(*) begin 
	case (selop)
		3'b000: result = datab;
		3'b001: result = not_b;
		3'b010: result = a_and_b;
		3'b011: result = a_or_b;
		3'b100: result = a_xor_b;
		3'b101: result = a_plus_b;
		3'b110: result = b_plus_one;
		default: result = neg_b;
	endcase
end

// Carry Mux
assign cout = (selop[2:0] == 3'b101) ? c_add :
				  (selop[2:0] == 3'b010) ? c_plus1:
				  (selop[2:0] == 3'b111) ? c_negB : 1'b0;
endmodule 