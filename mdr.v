module mdr #(parameter MAX_WIDTH = 8)
(		input wire  en,
		input wire  clk,
		input wire  rst,
		input wire  sclr,
		input wire  [MAX_WIDTH-1:0] busALU,
		input wire  [MAX_WIDTH-1:0] busRAM,
		input wire  mdr_alu_n,
		output wire [MAX_WIDTH-1:0] busDATA_OUT,
		output wire [MAX_WIDTH-1:0] busC);

wire [MAX_WIDTH-1:0] q1;
		
reg_DFF_sclr #(.MAX_WIDTH(MAX_WIDTH)) regiRAM(
	.clk(clk),
	.rst(rst),
	.en(en),
	.sclr(sclr),
	.d(busRAM),
	.q(q1));

reg_DFF_sclr #(.MAX_WIDTH(MAX_WIDTH)) regiOUT(
	.clk(clk),
	.rst(rst),
	.en(en),
	.sclr(sclr),
	.d(busALU),
	.q(busDATA_OUT));
	
assign busC = (mdr_alu_n == 1'b0) ? busALU : q1;
				  
endmodule
