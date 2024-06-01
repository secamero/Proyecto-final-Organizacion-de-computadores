// Nbit_Adder
module nbit_adder #(parameter N = 8)
	(
		input wire [N-1:0] a,
		input wire [N-1:0] b,
		input wire cin,
		output wire [N-1:0] s,
		output wire cout);
	wire [N-1:0] carry;
	
	genvar i;
	generate
		for (i = N-1; i >= 0; i = i-1) begin: Adder_Gen
			if (i == 0) begin: bit0
				full_adder Bit_0 (.a(a[i]), .b(b[i]), .cin(cin), .s(s[i]), .cout(carry[i]));
			end else begin: bitn
				full_adder Bit_N (.a(a[i]), .b(b[i]), .cin(carry[i-1]), .s(s[i]), .cout(carry[i]));
			end
		end
	endgenerate
	 assign cout = carry[N-1];
endmodule 