module control_unit
	#(	parameter MAX_WIDTH = 21)
	(	input wire 		clk,
		input wire 		rst,
		input wire 		int,
		input wire 		Z,
		input wire 		N,
		input wire 		C,
		input wire 		P,
		input wire 		[4:0] opcode,
		output wire 	[MAX_WIDTH-1:0] uinstruction
	);

wire [2:0] result;
wire [2:0] upc_out;
wire mux1_out;
wire [2:0] mux2_out;
wire [28:0] rom_out;
wire [7:0] rom_in;
wire [2:0] offset;
wire [2:0] jcond;

wire en_upc;
wire clr_upc;

assign rom_in = {opcode, upc_out};
	
// Instantiate add_sub
add_sub #(.N(3)) addsub (
	.a (upc_out),
	.b (3'b001),
	.addn_sub(1'b0),
	.s(result),
	.cout(c_add)
);

// Instantiate mux8to1
mux8to1 mux1 (
	.m1 (1'b0),
	.m2 (1'b1),
	.m3 (Z),
	.m4 (N),
	.m5 (C),
	.m6 (P),
	.m7 (int),
	.m8 (1'b0),
	.sel(jcond),
	.out(mux1_out)
);

// Instantiate mux2to1
mux2to1 #(.MAX_WIDTH(3)) mux2 (
	.m1 (result),
	.m2 (offset),
	.sel(mux1_out),
	.out(mux2_out)
);

// Instantiate reg_DFF_sclr
reg_DFF_sclr #(.MAX_WIDTH(3)) uPc (
	.clk(clk),
	.rst(rst),
	.en(en_upc),
	.sclr(clr_upc),
	.d(mux2_out),
	.q(upc_out)
);
	
// Instantiate async_rom_case
async_rom_case rom (
	.r_addr(rom_in),
	.r_data(rom_out)
);
	
assign en_upc = rom_out[7];
assign clr_upc = rom_out[6];

assign offset = {rom_out[2], rom_out[1], rom_out[0]};
assign jcond = {rom_out[5], rom_out[4], rom_out[3]};
assign uinstruction = rom_out[28:8];
		
endmodule
