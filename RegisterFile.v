module RegisterFile #(parameter DATA_WIDTH = 8,
										  ADDR_WIDTH = 3)
(	input wire  clk,
	input wire  wr_en, // bank_wr_en
	input wire  [ADDR_WIDTH-1:0] w_addr, r_addr,   // BusC_addr y BusB_addr
	input wire  [DATA_WIDTH-1:0] w_data,
	output wire [DATA_WIDTH-1:0] r_data, r2_data); // BusA y BusB
reg [DATA_WIDTH-1:0] array_reg [2**ADDR_WIDTH-1:0];
wire [ADDR_WIDTH-1:0] r2_addr;	

initial begin
  array_reg[0] = 8'b00000000;
  array_reg[1] = 8'b00000000;
  array_reg[2] = 8'b00000000;
  array_reg[3] = 8'b00000000;
  array_reg[4] = 8'b00000000;
  array_reg[5] = 8'b00000000;
  array_reg[6] = 8'b11111111;
  array_reg[7] = 8'b00000000;
end  
	
always @(posedge clk) begin
	if (wr_en) begin
		array_reg[w_addr] <= w_data;
	end
end

assign r2_addr = 3'b111;
assign r_data = array_reg[r2_addr]; //Bus A
assign r2_data = array_reg[r_addr]; //Bus B

endmodule 