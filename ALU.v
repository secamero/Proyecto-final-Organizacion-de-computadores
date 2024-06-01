// ALU
`timescale 1ns / 1ps
module ALU
  #(parameter MAX_WIDTH = 8)
  (
    input wire clk,
	 input wire rst,
	 input wire [MAX_WIDTH-1:0] busA,
	 input wire [MAX_WIDTH-1:0] busB,
	 input wire [2:0] selop,
	 input wire [1:0] shamt,
	 input wire enaf,
	 output wire [MAX_WIDTH-1:0] busC,
	 output wire C,
	 output wire N,
	 output wire P,
	 output wire Z
  );
  
  wire[MAX_WIDTH-1:0] result, busShift;
  wire carry;
  
  assign busC = busShift;
  
  // Instantiate Processiing Unit
  processing_unit #(.N(MAX_WIDTH)) PU (
	.dataa(busA),
	.datab(busB),
	.selop(selop),
	.result(result),
	.cout(carry)
  );

  // Instantiate Flag Register
  flag_register #(.MAX_WIDTH(MAX_WIDTH)) FR (
	.clk(clk),
	.rst(rst),
	.enaf(enaf),
	.dataa(busShift),
	.carry(carry),
	.C(C),
	.N(N),
	.P(P),
	.Z(Z)
  );

  // Instantiate Shift Unit
  shift_unit #(.N(MAX_WIDTH)) SU (
	.shamt(shamt),
	.dataa(result),
	.dataout(busShift));
endmodule 