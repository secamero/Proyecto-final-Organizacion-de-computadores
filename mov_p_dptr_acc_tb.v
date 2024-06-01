`timescale 1 ns/10 ps

module mov_p_dptr_acc_tb();
  //signal declaration
  localparam M = 8;
  localparam A = 3;
  reg  clk_tb;
  reg  rst_tb;
  reg  wr_rdn_tb;
  
  // ALU
  reg  enaf_tb;
  reg  [2:0] selop_tb;
  reg  [1:0] shamt_tb;
  wire C_tb;
  wire N_tb;
  wire P_tb;
  wire Z_tb;
  
  //register bank
  reg  bank_wr_en_tb;
  reg  [A-1:0] BusB_addr_tb;
  reg  [A-1:0] BusC_addr_tb;
  
  //Register wires
  reg  sclr_tb;
  reg  ir_en_tb;
  reg  mar_en_tb;
  reg  mdr_en_tb;
  reg  mdr_alu_n_tb;
  wire [4:0] out_IR_tb;

  //instantiate DUT
  PDUA #(.MAX_WIDTH(8), .ADDR_WIDTH(3)) DUT(
		.clk(clk_tb),
		.rst(rst_tb),
		.wr_rdn(wr_rdn_tb),
		.enaf(enaf_tb),
		.selop(selop_tb),
		.shamt(shamt_tb),
		.C(C_tb),
		.N(N_tb),
		.P(P_tb),
		.Z(Z_tb),
		.bank_wr_en(bank_wr_en_tb),
		.BusB_addr(BusB_addr_tb),
		.BusC_addr(BusC_addr_tb),
		.sclr(sclr_tb),
		.ir_en(ir_en_tb),
		.mar_en(mar_en_tb),
		.mdr_en(mdr_en_tb),
		.mdr_alu_n(mdr_alu_n_tb),
		.out_IR(out_IR_tb));
		
  //Clock generation
  
  always
  begin
    clk_tb = 1'b0;
	 # 25;
	 clk_tb = 1'b1;
	 # 25;
  end
  
  //en el register bank el PC inicia en 1
  
  //test sigma generator
  initial
  begin
  
  rst_tb = 1'b1;
  # 5;
  
    //test vector 0
    rst_tb = 1'b0;
	 sclr_tb = 1'b0;
	 enaf_tb = 1'b0;
    selop_tb = 3'b000;
    shamt_tb = 2'b00;
	 mdr_en_tb = 1'b0;
    mdr_alu_n_tb = 1'b0;
	 ir_en_tb = 1'b0;
    mar_en_tb = 1'b1;
	 bank_wr_en_tb = 1'b0;
	 BusB_addr_tb = 3'b010;
    BusC_addr_tb = 3'b000;
    wr_rdn_tb = 1'b0;
	 # 60;
	 
	 //test vector 1
    rst_tb = 1'b0;
	 sclr_tb = 1'b0;
	 enaf_tb = 1'b1;
    selop_tb = 3'b000;
    shamt_tb = 2'b00;
	 mdr_en_tb = 1'b1;
    mdr_alu_n_tb = 1'b0;
	 ir_en_tb = 1'b0;
    mar_en_tb = 1'b0;
	 bank_wr_en_tb = 1'b0;
	 BusB_addr_tb = 3'b111;	
    BusC_addr_tb = 3'b000;
    wr_rdn_tb = 1'b1;
	 # 50;
	 
//	 //test vector 2
//    rst_tb = 1'b0;
//	 sclr_tb = 1'b0;
//	 enaf_tb = 1'b0;
//    selop_tb = 3'b000;
//    shamt_tb = 2'b00;
//	 mdr_en_tb = 1'b0;
//    mdr_alu_n_tb = 1'b1;
//	 ir_en_tb = 1'b0;
//    mar_en_tb = 1'b0;
//	 bank_wr_en_tb = 1'b1;
//	 BusB_addr_tb = 3'b000;
//    BusC_addr_tb = 3'b111;
//    wr_rdn_tb = 1'b0;
//	 # 50;
	 
	 //stop simulation
	 $stop;
   end
endmodule 