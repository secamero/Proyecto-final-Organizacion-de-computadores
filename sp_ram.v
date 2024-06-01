module sp_ram #(parameter DATA_WIDTH = 8,
								  ADDR_WIDTH = 8)
(		input wire  wr_rdn,
		input wire  clk,
		input wire  [ADDR_WIDTH-1:0] addr,
		input wire  [DATA_WIDTH-1:0] w_data,
		output wire [DATA_WIDTH-1:0] r_data);
		
reg  [DATA_WIDTH-1:0] ram [2**ADDR_WIDTH-1:0];
reg  [ADDR_WIDTH-1:0] addr_reg;

//always @(posedge clk, addr, w_data) begin
always @(posedge clk) begin
	if (wr_rdn) begin
		ram[addr] <= w_data;
	end
	addr_reg <= addr;
end

assign r_data = ram[addr_reg];

endmodule 