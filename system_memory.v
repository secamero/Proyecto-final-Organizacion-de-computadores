module system_memory #(parameter MAX_WIDTH = 8,
											ADDR_WIDTH = 3)
(		input wire  clk,
		input wire  rst,
		input wire  [MAX_WIDTH-1:0] data_in,  // BUS_DATA_IN
		output wire [MAX_WIDTH-1:0] data_out, // BUS_DATA_OUT
		output wire [MAX_WIDTH-1:0] addr_b,   // ADRESS_BUS
		// ALU wires
		input wire  enaf,
		input wire 	[2:0] selop,
		input wire  [1:0] shamt,
		output wire C,
		output wire N,
		output wire P,
		output wire Z,
		
		// Register Bank wires
		input wire  bank_wr_en,
		input wire  [ADDR_WIDTH-1:0] BusB_addr,
		input wire  [ADDR_WIDTH-1:0] BusC_addr,
		
		//Registers wires
		input wire	sclr,
		input wire  ir_en,
		input wire  mar_en,
		input wire  mdr_en,
		input wire  mdr_alu_n,
		output wire [4:0] out_IR);

wire [MAX_WIDTH-1:0] busA, busB, busALU, busC, IR_s;
assign out_IR = IR_s[7:3];

ALU #(.MAX_WIDTH(MAX_WIDTH)) ALU(
	.clk(clk),
	.rst(rst),
	.busA(busA),
	.busB(busB),
	.selop(selop),
	.shamt(shamt),
	.enaf(enaf),
	.busC(busALU),
	.C(C),
	.N(N),
	.P(P),
	.Z(Z));
	
RegisterFile #(.DATA_WIDTH(MAX_WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) RegisterBank (
	.clk(clk),
	.wr_en(bank_wr_en),
	.w_addr(BusC_addr),
	.r_addr(BusB_addr),
	.w_data(busC),
	.r_data(busA), //ACC
	.r2_data(busB));

reg_DFF_sclr #(.MAX_WIDTH(MAX_WIDTH)) IR(
	.clk(clk),
	.rst(rst),
	.en(ir_en),
	.sclr(sclr),
	.d(busC),
	.q(IR_s));
	
reg_DFF_sclr #(.MAX_WIDTH(MAX_WIDTH)) MAR(
	.clk(clk),
	.rst(rst),
	.en(mar_en),
	.sclr(1'b0),
	.d(busC),
	.q(addr_b));

mdr #(.MAX_WIDTH(MAX_WIDTH)) MDR(
	.clk(clk),
	.en(mdr_en),
	.rst(rst),
	.sclr(1'b0),
	.busALU(busALU),
	.busRAM(data_in),
	.mdr_alu_n(mdr_alu_n),
	.busDATA_OUT(data_out),
	.busC(busC));
endmodule	
										