`timescale 1 ns/10 ps

module sp_ram_tb();
  //signal declaration
  localparam M = 8;
  reg  clk_tb;
  reg  wr_rdn_tb;
  reg  [M-1:0] addr_tb;
  reg  [M-1:0] w_data_tb;
  wire [M-1:0] r_data_tb;

  //instantiate DUT
  sp_ram #(.DATA_WIDTH(8), .ADDR_WIDTH(3)) DUT(
		.clk(clk_tb),
		.wr_rdn(wr_rdn_tb),
		.addr(addr_tb),
		.w_data(w_data_tb),
		.r_data(r_data_tb));
		
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
    wr_rdn_tb = 1'b0;
    addr_tb = 3'b000;
    w_data_tb = 8'b00001111;
	 # 75;
	 
	 //test vector 1
    wr_rdn_tb = 1'b0;
    addr_tb = 3'b001;
    w_data_tb = 8'b00001111;
	 # 50;
	 
	 //test vector 2
    wr_rdn_tb = 1'b0;
    addr_tb = 3'b010;
    w_data_tb = 8'b00001111;
	 # 50;
	 
	 //test vector 3
    wr_rdn_tb = 1'b0;
    addr_tb = 3'b011;
    w_data_tb = 8'b00001111;
	 # 75;
	 
	 //test vector 4
    wr_rdn_tb = 1'b0;
    addr_tb = 3'b100;
    w_data_tb = 8'b00001111;
	 # 75;
	 
	 //test vector 5
    wr_rdn_tb = 1'b0;
    addr_tb = 3'b101;
    w_data_tb = 8'b00001111;
	 # 75;
	 
	 //test vector 6
    wr_rdn_tb = 1'b0;
    addr_tb = 3'b110;
    w_data_tb = 8'b00001111;
	 # 50;
	 
	 //test vector 7
    wr_rdn_tb = 1'b0;
    addr_tb = 3'b111;
    w_data_tb = 8'b00001111;
	 # 50;
	 
	 //test vector 8
    wr_rdn_tb = 1'b1;
    addr_tb = 3'b110;
    w_data_tb = 8'b00001111;
	 # 50;
	 
	 //test vector 9
    wr_rdn_tb = 1'b1;
    addr_tb = 3'b000;
    w_data_tb = 8'b00110010;
	 # 50;
	 
	 //stop simulation
	 $stop;
   end
endmodule 