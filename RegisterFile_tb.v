`timescale 1 ns/10 ps

module RegisterFile_tb();
  //signal declaration
  localparam M = 8;
  localparam D = 3;
  reg  clk_tb;
  reg  wr_en_tb;
  reg  [D-1:0] w_addr_tb;
  reg  [D-1:0] r_addr_tb;
  reg  [M-1:0] w_data_tb;
  wire [M-1:0] r_data_tb;
  wire [M-1:0] r2_data_tb;

  //instantiate DUT
  RegisterFile #(.DATA_WIDTH(8), .ADDR_WIDTH(3)) DUT (.clk(clk_tb), .wr_en(wr_en_tb), .w_addr(w_addr_tb), 
                              .r_addr(r_addr_tb), .w_data(w_data_tb), .r_data(r_data_tb),
										.r2_data(r2_data_tb));
  
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
	 wr_en_tb = 1'b1;
//	 wr_en_tb = 1'b0;
	 w_addr_tb = 3'b000;
	 w_data_tb = 8'b01000101;
	 r_addr_tb = 3'b001;
	 # 75;
	 
	 //test vector 1
	 wr_en_tb = 1'b1;
//    wr_en_tb = 1'b0;
	 w_addr_tb = 3'b001;
	 w_data_tb = 8'b00000011;
	 r_addr_tb = 3'b000;
	 # 50;
	 
	 //test vector 2
	 wr_en_tb = 1'b1;
//	 wr_en_tb = 1'b0;
	 w_addr_tb = 3'b010;
	 w_data_tb = 8'b00000011;
	 r_addr_tb = 3'b001;
	 # 50;
	 
	 //test vector 3
	 wr_en_tb = 1'b1;
//	 wr_en_tb = 1'b0;
	 w_addr_tb = 3'b011;
	 w_data_tb = 8'b01001011;
	 r_addr_tb = 3'b010;
	 # 50;
	 
	 //test vector 4
	 wr_en_tb = 1'b1;
//	 wr_en_tb = 1'b0;
	 w_addr_tb = 3'b100;
	 w_data_tb = 8'b00001000;
	 r_addr_tb = 3'b011;
	 # 50;
	 
	 //test vector 5
	 wr_en_tb = 1'b1;
//	 wr_en_tb = 1'b0;
	 w_addr_tb = 3'b101;
	 w_data_tb = 8'b00001111;
	 r_addr_tb = 3'b100;
	 # 50;
	 
	 //test vector 6
	 wr_en_tb = 1'b1;
//	 wr_en_tb = 1'b0;
	 w_addr_tb = 3'b110;
	 w_data_tb = 8'b11110000;
	 r_addr_tb = 3'b101;
	 # 50;
	 
	 //test vector 7
	 wr_en_tb = 1'b1;
//	 wr_en_tb = 1'b0;
	 w_addr_tb = 3'b111;
	 w_data_tb = 8'b00111000;
	 r_addr_tb = 3'b110;
	 # 50;
	 
	 //test vector 8
	 wr_en_tb = 1'b1;
//	 wr_en_tb = 1'b0;
	 w_addr_tb = 3'b111;
	 w_data_tb = 8'b01101000;
	 r_addr_tb = 3'b111;
	 # 50;
	 
	 //test vector 9
	 wr_en_tb = 1'b1;
//	 wr_en_tb = 1'b0;
	 w_addr_tb = 3'b000;
	 w_data_tb = 8'b00001111;
	 r_addr_tb = 3'b000;
	 # 50;
	 
	 //test vector 10
	 wr_en_tb = 1'b1;
//	 wr_en_tb = 1'b0;
	 w_addr_tb = 3'b011;
	 w_data_tb = 8'b11110000;
	 r_addr_tb = 3'b011;
	 # 50;
	 
	 //test vector 11
	 wr_en_tb = 1'b1;
//	 wr_en_tb = 1'b0;
	 w_addr_tb = 3'b111;
	 w_data_tb = 8'b00000000;
	 r_addr_tb = 3'b111;
	 # 50;
	 
	 //stop simulation
	 $stop;
   end
endmodule 