// Add_Sub
module add_sub #(parameter N = 8)(
	input wire  [N-1:0] a,
	input wire  [N-1:0] b,
	input wire 	addn_sub,
	output wire [N-1:0] s,
	output wire cout);

wire [N-1:0] bxor;
wire [N-1:0] add_nsub_vector;

// Generate add_nsub_vector where all bits are equal to addn_sub
assign add_nsub_vector = {N{addn_sub}};

// XOR operation to prepare b for addition/substraction
assign bxor = b ^ add_nsub_vector;

// Instantiate the n-bit adder for the actual addition/substraction
nbit_adder #(.N(N)) adder_instance(
	.a(a),
	.b(bxor),
	.cin(addn_sub), // Use addn_sub as carry-in to control addition/substraction
	.s(s),
	.cout(cout));

endmodule 