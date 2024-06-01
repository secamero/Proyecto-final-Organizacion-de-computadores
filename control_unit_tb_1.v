`timescale 1 ns/10 ps

module control_unit_tb_1;
  //signal declaration
  //localparam M = 8;
  //localparam A = 3;
  reg  clk_tb;
  reg  rst_tb;
  
  reg int_tb;
  reg C_tb;
  reg N_tb;
  reg P_tb;
  reg Z_tb;
  reg [4:0] opcode_tb;
  
  wire [20:0] uinstruction_tb;

  //instantiate DUT
  control_unit #(.MAX_WIDTH(21)) DUT(
		.clk(clk_tb),
		.rst(rst_tb),
		.int(int_tb),
		.Z(Z_tb),
		.N(N_tb),
		.C(C_tb),
		.P(P_tb),
		.opcode(opcode_tb),
		.uinstruction(uinstruction_tb)		
		);
		
  //Clock generation
  
  always
  begin
    clk_tb = 1'b0;
	 # 10;
	 clk_tb = 1'b1;
	 # 10;
  end
  
  //test sigma generator
  initial
  begin
	 
	 rst_tb = 1'b1;
    # 5;
	 
	 //test vector 0
	 
	 rst_tb = 1'b0;
	 int_tb = 1'b0;
	 Z_tb = 1'b0;
	 N_tb = 1'b0;
	 C_tb = 1'b0;
	 P_tb = 1'b0;
	 opcode_tb = 5'b00010;
	 #200
	 
	 $stop;
   end
endmodule 