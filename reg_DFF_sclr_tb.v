`timescale 1 ns/10 ps

module reg_DFF_sclr_tb();
  //signal declaration
  localparam M = 8;
  reg  clk_tb;
  reg  rst_tb;
  reg  en_tb;
  reg  sclr_tb;
  reg  [M-1:0] d_tb;
  wire [M-1:0] q_tb;

  //instantiate DUT
  reg_DFF_sclr #(.MAX_WIDTH(8)) DUT(
	.clk(clk_tb),
	.rst(rst_tb),
	.en(en_tb),
	.sclr(sclr_tb),
	.d(d_tb),
	.q(q_tb));
  
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
	 rst_tb = 1'b0;
	 en_tb = 1'b1;
	 sclr_tb = 1'b0;
	 d_tb = 8'b11111111;
	 # 75;
	 
	 //test vector 1
	 rst_tb = 1'b0;
	 en_tb = 1'b1;
	 sclr_tb = 1'b0;
	 d_tb = 8'b00010100;
	 # 50;
	 
	 //test vector 2
	 rst_tb = 1'b0;
	 en_tb = 1'b1;
	 sclr_tb = 1'b1;
	 d_tb = 8'b00010100;
	 # 50;
	 
	 //test vector 3
	 rst_tb = 1'b0;
	 en_tb = 1'b1;
	 sclr_tb = 1'b0;
	 d_tb = 8'b00001111;
	 # 50;
	 
	 //test vector 4
	 rst_tb = 1'b0;
	 en_tb = 1'b0;
	 sclr_tb = 1'b0;
	 d_tb = 8'b10101010;
	 # 50;
	 
	 //test vector 5
	 rst_tb = 1'b1;
	 en_tb = 1'b0;
	 sclr_tb = 1'b0;
	 d_tb = 8'b10101010;
	 # 50;

	 //stop simulation
	 $stop;
   end
endmodule 