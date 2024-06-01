`timescale 1 ns/10 ps

module mdr_tb();
  //signal declaration
  localparam M = 8;
  reg  clk_tb;
  reg  en_tb;
  reg  rst_tb;
  reg  sclr_tb;
  reg  mdr_alu_n_tb;
  reg  [M-1:0] busALU_tb;
  reg  [M-1:0] busRAM_tb;
  wire [M-1:0] busDATA_OUT_tb;
  wire [M-1:0] busC_tb;

  //instantiate DUT
  mdr #(.MAX_WIDTH(8)) DUT(
	.clk(clk_tb),
	.en(en_tb),
	.rst(rst_tb),
	.sclr(sclr_tb),
	.busALU(busALU_tb),
	.busRAM(busRAM_tb),
	.mdr_alu_n(mdr_alu_n_tb),
	.busDATA_OUT(busDATA_OUT_tb),
	.busC(busC_tb));
  
  //Clock generation
  always
  begin
    clk_tb = 1'b0;
	 # 25;
	 clk_tb = 1'b1;
	 # 25;
  end
  
  //test sigma generator
  initial
  begin
  
    //test vector 0
	 en_tb = 1'b0;
    rst_tb = 1'b0;
    sclr_tb = 1'b0;
    mdr_alu_n_tb = 1'b0;
	 busALU_tb = 8'b00001111;
    busRAM_tb = 8'b11110000;
	 # 75;
	 
	 //test vector 2
	 en_tb = 1'b1;
    rst_tb = 1'b0;
    sclr_tb = 1'b0;
    mdr_alu_n_tb = 1'b0;
	 busALU_tb = 8'b00001111;
    busRAM_tb = 8'b11110000;
	 # 50;
	 
	 //test vector 3
	 en_tb = 1'b1;
    rst_tb = 1'b0;
    sclr_tb = 1'b0;
    mdr_alu_n_tb = 1'b1;
	 busALU_tb = 8'b00001111;
    busRAM_tb = 8'b11110000;
	 # 50;
	 
	 //test vector 4
	 en_tb = 1'b1;
    rst_tb = 1'b1;
    sclr_tb = 1'b0;
    mdr_alu_n_tb = 1'b1;
	 busALU_tb = 8'b00001111;
    busRAM_tb = 8'b11110000;
	 # 50;
	 
	 //stop simulation
	 $stop;
   end
endmodule 