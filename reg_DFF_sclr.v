module reg_DFF_sclr
	#(	parameter MAX_WIDTH = 8)
	(	input wire 		clk,
		input wire 		rst,
		input wire 		en,
		input wire 		sclr,
		input wire 		[MAX_WIDTH-1:0] d,
		output wire 	[MAX_WIDTH-1:0] q);
		
	genvar i;
	generate
		for (i = 0; i < MAX_WIDTH; i = i+1) begin : DFF_gen
			dff_sclr DFFx (
				.d(d[i]),
				.clk(clk),
				.en(en),
				.sclr(sclr),
				.rst(rst),
				.q(q[i])
			);
		end
	endgenerate
endmodule	