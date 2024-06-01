`timescale 1 ns/10 ps

module PDUA_tb();
  //signal declaration
//  localparam M = 8;
//  localparam A = 3;
  reg  clk_tb;
  reg  rst_tb;
  reg  int_en_tb;
  reg  [7:0] in_d_tb;
  
//  // ALU
//  reg  enaf_tb;
//  reg  [2:0] selop_tb;
//  reg  [1:0] shamt_tb;
//  wire C_tb;
//  wire N_tb;
//  wire P_tb;
//  wire Z_tb;
//  
//  //register bank
//  reg  bank_wr_en_tb;
//  reg  [A-1:0] BusB_addr_tb;
//  reg  [A-1:0] BusC_addr_tb;
//  
//  //Register wires
//  reg  sclr_tb;
//  reg  ir_en_tb;
//  reg  mar_en_tb;
//  reg  mdr_en_tb;
//  reg  mdr_alu_n_tb;
  wire out_d1_tb;
  wire [7:0] out_d2_tb;
  wire [7:0] out_d3_tb;

  //instantiate DUT
  PDUA #(.MAX_WIDTH(8), .ADDR_WIDTH(3)) DUT(
		.clk(clk_tb),
		.rst(rst_tb),
		.int_en(int_en_tb),
		.in_d(in_d_tb),
		.out_d1(out_d1_tb),
		.out_d3(out_d2_tb),
		.out_d2(out_d3_tb));
		
  //Clock generation
  
  always
  begin
    clk_tb = 1'b0;
	 # 10;
	 clk_tb = 1'b1;
	 # 10;
  end
  
  //en el register bank el PC inicia en 0
  
  //test sigma generator
  initial
  begin
  
  rst_tb = 1'b1;
  # 5;
  
  rst_tb = 1'b0;
  int_en_tb = 1'b0;
  in_d_tb = 8'b00000000;
  # 120000000;

  
//    //test vector 0
//    rst_tb = 1'b0;
//	 sclr_tb = 1'b0;
//	 enaf_tb = 1'b0;
//    selop_tb = 3'b000;
//    shamt_tb = 2'b00;
//	 mdr_en_tb = 1'b0;
//    mdr_alu_n_tb = 1'b0;
//	 ir_en_tb = 1'b0;
//    mar_en_tb = 1'b1;
//	 bank_wr_en_tb = 1'b0;
//	 BusB_addr_tb = 3'b000;
//    BusC_addr_tb = 3'b000;
//    wr_rdn_tb = 1'b0;
//	 # 60;
//	 
//	 //test vector 1
//    rst_tb = 1'b0;
//	 sclr_tb = 1'b0;
//	 enaf_tb = 1'b0;
//    selop_tb = 3'b110;
//    shamt_tb = 2'b00;
//	 mdr_en_tb = 1'b1;
//    mdr_alu_n_tb = 1'b0;
//	 ir_en_tb = 1'b0;
//    mar_en_tb = 1'b0;
//	 bank_wr_en_tb = 1'b1;
//	 BusB_addr_tb = 3'b000;
//    BusC_addr_tb = 3'b000;
//    wr_rdn_tb = 1'b0;
//	 # 50;
//	 
//	 //test vector 2
//    rst_tb = 1'b0;
//	 sclr_tb = 1'b0;
//	 enaf_tb = 1'b0;
//    selop_tb = 3'b000;
//    shamt_tb = 2'b00;
//	 mdr_en_tb = 1'b0;
//    mdr_alu_n_tb = 1'b1;
//	 ir_en_tb = 1'b1;
//    mar_en_tb = 1'b0;
//	 bank_wr_en_tb = 1'b0;
//	 BusB_addr_tb = 3'b000;
//    BusC_addr_tb = 3'b000;
//    wr_rdn_tb = 1'b0;
//	 # 50;
	 
	 //stop simulation
	 $stop;
   end
endmodule 