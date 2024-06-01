module dff_sclr (
	input wire d,
	input wire clk,
	input wire en,
	input wire sclr,
	input wire rst,
	output reg q
	);
	
	always @(posedge clk, posedge rst) begin
		if (rst)
			q <= 1'b0;
		else if (en)
			if (sclr)
				q <= 1'b0;
			else
				q <= d;
		end
endmodule
