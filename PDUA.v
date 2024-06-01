module PDUA #(parameter MAX_WIDTH = 8,
								ADDR_WIDTH = 3)
(		input wire  clk,
		input wire  rst,
		input wire  int_en,
		input wire  [7:0] in_d,
//		input wire  wr_rdn,
		// ALU wires
//		input wire  enaf,
//		input wire 	[2:0] selop,
//		input wire  [1:0] shamt,
//		output wire C,
//		output wire N,
//		output wire P,
//		output wire Z,
		
		// Register Bank wires
//		input wire  bank_wr_en,
//		input wire  [ADDR_WIDTH-1:0] BusB_addr,
//		input wire  [ADDR_WIDTH-1:0] BusC_addr,
		
		//Registers wires
//		input wire	sclr,
//		input wire  ir_en,
//		input wire  mar_en,
//		input wire  mdr_en,
//		input wire  mdr_alu_n,
		output wire out_d1,
		output wire [7:0] out_d2,
		output wire [7:0] out_d3);

wire [MAX_WIDTH-1:0] bus_addr, data_out, data_ram;
wire int_reg_out;
wire Z_out;
wire N_out;
wire C_out;
wire P_out;
wire [4:0] out_IR;
wire enaf;
wire [2:0] selop;
wire [1:0] shamt;
wire bank_wr_en;
wire [ADDR_WIDTH-1:0] BusB_addr;
wire [ADDR_WIDTH-1:0] BusC_addr;
wire ir_clr;
wire ir_en;
wire mar_en;
wire mdr_en;
wire mdr_alu_n;
wire [20:0] uinstruction_out;
wire int_clr;
wire iom;
wire wr_rdn_1;
wire [7:0] bus_addr_1;
wire [7:0] data_out_1;
wire [7:0] mux2_out_ram;

system_memory #(.MAX_WIDTH(MAX_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) SM(
		.clk(clk),
		.rst(rst),
		.data_in(mux2_out_ram),
		.data_out(data_out),
		.addr_b(bus_addr),
		.enaf(enaf),
		.selop(selop),
		.shamt(shamt),
		.C(C_out),
		.N(N_out),
		.P(P_out),
		.Z(Z_out),
		.bank_wr_en(bank_wr_en),
		.BusB_addr(BusB_addr),
		.BusC_addr(BusC_addr),
		.sclr(ir_clr),
		.ir_en(ir_en),
		.mar_en(mar_en),
		.mdr_en(mdr_en),
		.mdr_alu_n(mdr_alu_n),
		.out_IR(out_IR));

sp_ram #(.DATA_WIDTH(MAX_WIDTH), .ADDR_WIDTH(MAX_WIDTH)) RAM(
		.clk(clk),
		.wr_rdn(wr_rdn_1),
		.addr(bus_addr_1),
		.w_data(data_out_1),
		.r_data(data_ram));

control_unit #(.MAX_WIDTH(21)) CU(
      .clk(clk),
		.rst(rst),
		.int(int_reg_out),
		.Z(Z_out),
		.N(N_out),
		.C(C_out),
		.P(P_out),
		.opcode(out_IR),
		.uinstruction(uinstruction_out));
		
reg_DFF_sclr #(.MAX_WIDTH(1)) INT(
	.clk(clk),
	.rst(rst),
	.en(int_en),
	.sclr(int_clr),
	.d(1'b1),
	.q(int_reg_out));
	
demux1to2 #(.MAX_WIDTH(1)) demx1(
	.in(wr_rdn),
	.sel(iom),
	.out0(wr_rdn_1),
	.out1(out_d1));
	
demux1to2 #(.MAX_WIDTH(8)) demx2(
	.in(bus_addr),
	.sel(iom),
	.out0(bus_addr_1),
	.out1(out_d2));
	
demux1to2 #(.MAX_WIDTH(8)) demx3(
	.in(data_out),
	.sel(iom),
	.out0(data_out_1),
	.out1(out_d3));
	
mux2to1 #(.MAX_WIDTH(8)) mux3 (
	.m1 (data_ram),
	.m2 (in_d),
	.sel(iom),
	.out(mux2_out_ram));
	
assign enaf = uinstruction_out[20];
assign selop = {uinstruction_out[19], uinstruction_out[18], uinstruction_out[17]};
assign shamt = {uinstruction_out[16], uinstruction_out[15]};
assign BusB_addr = {uinstruction_out[14], uinstruction_out[13], uinstruction_out[12]};
assign BusC_addr = {uinstruction_out[11], uinstruction_out[10], uinstruction_out[9]};
assign bank_wr_en = uinstruction_out[8];
assign mar_en = uinstruction_out[7];
assign mdr_en = uinstruction_out[6];
assign mdr_alu_n = uinstruction_out[5];
assign int_clr = uinstruction_out[4];
assign iom = uinstruction_out[3];
assign wr_rdn = uinstruction_out[2];
assign ir_en = uinstruction_out[1];
assign ir_clr = uinstruction_out[0];

endmodule

