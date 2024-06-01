module async_rom_case
  ( input wire [7:0] r_addr,
	 output reg [28:0] r_data
	);

//body
always @*
  case (r_addr)
     8'h00 : r_data = 29'b00000000100001000000010110101; //FETCH
	  8'h01 : r_data = 29'b00000000000001000000010000000;
	  8'h02 : r_data = 29'b01100000000010000000010000000;
	  8'h03 : r_data = 29'b00000000000000100000010000000;
	  8'h04 : r_data = 29'b00000000000000010001011000000;
	  8'h05 : r_data = 29'b00000000000000101000010000000;
	  8'h06 : r_data = 29'b01100000100110000010010000000;
	  8'h07 : r_data = 29'b00010010000010000001111000000;
	  8'h08 : r_data = 29'b10000001111110000001111000000; // MOV ACC,A
	  8'h09 : r_data = 29'b00000000000000000000000000000;
	  8'h0a : r_data = 29'b00000000000000000000000000000;
	  8'h0b : r_data = 29'b00000000000000000000000000000;
	  8'h0c : r_data = 29'b00000000000000000000000000000;
	  8'h0d : r_data = 29'b00000000000000000000000000000;
	  8'h0e : r_data = 29'b00000000000000000000000000000;
	  8'h0f : r_data = 29'b00000000000000000000000000000;
	  8'h10 : r_data = 29'b10000011101110000001111000000; // MOV A, ACC
	  8'h11 : r_data = 29'b00000000000000000000000000000;
	  8'h12 : r_data = 29'b00000000000000000000000000000;
	  8'h13 : r_data = 29'b00000000000000000000000000000;
	  8'h14 : r_data = 29'b00000000000000000000000000000;
	  8'h15 : r_data = 29'b00000000000000000000000000000;
	  8'h16 : r_data = 29'b00000000000000000000000000000;
	  8'h17 : r_data = 29'b00000000000000000000000000000;
	  8'h18 : r_data = 29'b00000000000001000000010000000; // MOV ACC, CTE
	  8'h19 : r_data = 29'b01100000000010000000010000000;
	  8'h1a : r_data = 29'b00000000000000100000010000000;
	  8'h1b : r_data = 29'b00000000011110010001111000000;
	  8'h1c : r_data = 29'b00000000000000000000000000000;
	  8'h1d : r_data = 29'b00000000000000000000000000000;
	  8'h1e : r_data = 29'b00000000000000000000000000000;
	  8'h1f : r_data = 29'b00000000000000000000000000000;
	  8'h20 : r_data = 29'b00000001000001000000010000000; // MOV ACC, [DPTR]
	  8'h21 : r_data = 29'b00000000000000000000010000000;
	  8'h22 : r_data = 29'b00000000000000100000010000000;
	  8'h23 : r_data = 29'b00000000011110010001111000000;
	  8'h24 : r_data = 29'b00000000000000000000000000000;
	  8'h25 : r_data = 29'b00000000000000000000000000000;
	  8'h26 : r_data = 29'b00000000000000000000000000000;
	  8'h27 : r_data = 29'b00000000000000000000000000000;
	  8'h28 : r_data = 29'b10000011101010000001111000000; // MOV DPTR, ACC
	  8'h29 : r_data = 29'b00000000000000000000000000000;
	  8'h2a : r_data = 29'b00000000000000000000000000000;
	  8'h2b : r_data = 29'b00000000000000000000000000000;
	  8'h2c : r_data = 29'b00000000000000000000000000000;
	  8'h2d : r_data = 29'b00000000000000000000000000000;
	  8'h2e : r_data = 29'b00000000000000000000000000000;
	  8'h2f : r_data = 29'b00000000000000000000000000000;
	  8'h30 : r_data = 29'b10000001000001000000010000000; // MOV [DPTR], ACC
	  8'h31 : r_data = 29'b10000011100000100000010000000;
	  8'h32 : r_data = 29'b10000000000000000011111000000;
	  8'h33 : r_data = 29'b00000000000000000000000000000;
	  8'h34 : r_data = 29'b00000000000000000000000000000;
	  8'h35 : r_data = 29'b00000000000000000000000000000;
	  8'h36 : r_data = 29'b00000000000000000000000000000;
	  8'h37 : r_data = 29'b00000000000000000000000000000;
	  8'h38 : r_data = 29'b10010011111110000001111000000; // INV ACC
	  8'h39 : r_data = 29'b00000000000000000000000000000;
	  8'h3a : r_data = 29'b00000000000000000000000000000;
	  8'h3b : r_data = 29'b00000000000000000000000000000;
	  8'h3c : r_data = 29'b00000000000000000000000000000;
	  8'h3d : r_data = 29'b00000000000000000000000000000;
	  8'h3e : r_data = 29'b00000000000000000000000000000;
	  8'h3f : r_data = 29'b00000000000000000000000000000;
	  8'h40 : r_data = 29'b10100001111110000001111000000; // AND ACC, A
	  8'h41 : r_data = 29'b00000000000000000000000000000;
	  8'h42 : r_data = 29'b00000000000000000000000000000;
	  8'h43 : r_data = 29'b00000000000000000000000000000;
	  8'h44 : r_data = 29'b00000000000000000000000000000;
	  8'h45 : r_data = 29'b00000000000000000000000000000;
	  8'h46 : r_data = 29'b00000000000000000000000000000;
	  8'h47 : r_data = 29'b00000000000000000000000000000;
	  8'h48 : r_data = 29'b11010001111110000001111000000; // ADD ACC, A
	  8'h49 : r_data = 29'b00000000000000000000000000000;
	  8'h4a : r_data = 29'b00000000000000000000000000000;
	  8'h4b : r_data = 29'b00000000000000000000000000000;
	  8'h4c : r_data = 29'b00000000000000000000000000000;
	  8'h4d : r_data = 29'b00000000000000000000000000000;
	  8'h4e : r_data = 29'b00000000000000000000000000000;
	  8'h4f : r_data = 29'b00000000000000000000000000000;
	  8'h50 : r_data = 29'b00000000000001000000010001010; // JMP CTE
	  8'h51 : r_data = 29'b01100000000010000001111000000;
	  8'h52 : r_data = 29'b00000000000000000000010000000;
	  8'h53 : r_data = 29'b00000000000000100000010000000;
	  8'h54 : r_data = 29'b00000000000010010001111000000;
	  8'h55 : r_data = 29'b00000000000000000000000000000;
	  8'h56 : r_data = 29'b00000000000000000000000000000;
	  8'h57 : r_data = 29'b00000000000000000000000000000;
	  8'h58 : r_data = 29'b00000000000001000000010010010; // JZ CTE
	  8'h59 : r_data = 29'b01100000000010000001111000000;
	  8'h5a : r_data = 29'b00000000000000000000010000000;
	  8'h5b : r_data = 29'b00000000000000100000010000000;
	  8'h5c : r_data = 29'b00000000000010010001111000000;
	  8'h5d : r_data = 29'b00000000000000000000000000000;
	  8'h5e : r_data = 29'b00000000000000000000000000000;
	  8'h5f : r_data = 29'b00000000000000000000000000000;
	  8'h60 : r_data = 29'b00000000000001000000010011010; // JN CTE
	  8'h61 : r_data = 29'b01100000000010000001111000000;
	  8'h62 : r_data = 29'b00000000000000000000010000000;
	  8'h63 : r_data = 29'b00000000000000100000010000000;
	  8'h64 : r_data = 29'b00000000000010010001111000000;
	  8'h65 : r_data = 29'b00000000000000000000000000000;
	  8'h66 : r_data = 29'b00000000000000000000000000000;
	  8'h67 : r_data = 29'b00000000000000000000000000000;
	  8'h68 : r_data = 29'b00000000000001000000010100010; // JC CTE
	  8'h69 : r_data = 29'b01100000000010000001111000000;
	  8'h6a : r_data = 29'b00000000000000000000010000000;
	  8'h6b : r_data = 29'b00000000000000100000010000000;
	  8'h6c : r_data = 29'b00000000000010010001111000000;
	  8'h6d : r_data = 29'b00000000000000000000000000000;
	  8'h6e : r_data = 29'b00000000000000000000000000000;
	  8'h6f : r_data = 29'b00000000000000000000000000000;
	  8'h70 : r_data = 29'b00000000000001000000010000000; // CALL DIR
	  8'h71 : r_data = 29'b00000000000000100000010000000;
	  8'h72 : r_data = 29'b00000000010110010000010000000;
	  8'h73 : r_data = 29'b01100000000000100000010000000;
	  8'h74 : r_data = 29'b00000000100001000010010000000;
	  8'h75 : r_data = 29'b00000000000000000000000000000; // revisar
	  8'h76 : r_data = 29'b00000010100010000001111000000;
	  8'h77 : r_data = 29'b00000000000000000000000000000;
	  8'h78 : r_data = 29'b01100000100111000000010000000; // RET
	  8'h79 : r_data = 29'b00000000000000000000010000000;
	  8'h7a : r_data = 29'b00000000000000100000010000000;
	  8'h7b : r_data = 29'b00000000000010010001111000000;
	  8'h7c : r_data = 29'b00000000000000000000000000000;
	  8'h7d : r_data = 29'b00000000000000000000000000000;
	  8'h7e : r_data = 29'b00000000000000000000000000000;
	  8'h7f : r_data = 29'b00000000000000000000000000000;
	  8'h80 : r_data = 29'b00000000000000000000000000000;
	  8'h81 : r_data = 29'b00000000000000000000000000000;
	  8'h82 : r_data = 29'b00000000000000000000000000000;
	  8'h83 : r_data = 29'b00000000000000000000000000000;
	  8'h84 : r_data = 29'b00000000000000000000000000000;
	  8'h85 : r_data = 29'b00000000000000000000000000000;
	  8'h86 : r_data = 29'b00000000000000000000000000000;
	  8'h87 : r_data = 29'b00000000000000000000000000000;
	  8'h88 : r_data = 29'b11110011111110000001111000000; // CA2 ACC
	  8'h89 : r_data = 29'b00000000000000000000000000000;
	  8'h8a : r_data = 29'b00000000000000000000000000000;
	  8'h8b : r_data = 29'b00000000000000000000000000000;
	  8'h8c : r_data = 29'b00000000000000000000000000000;
	  8'h8d : r_data = 29'b00000000000000000000000000000;
	  8'h8e : r_data = 29'b00000000000000000000000000000;
	  8'h8f : r_data = 29'b00000000000000000000000000000;
	  8'h90 : r_data = 29'b10000111111110000001111000000; // SLR ACC
	  8'h91 : r_data = 29'b00000000000000000000000000000;
	  8'h92 : r_data = 29'b00000000000000000000000000000;
	  8'h93 : r_data = 29'b00000000000000000000000000000;
	  8'h94 : r_data = 29'b00000000000000000000000000000;
	  8'h95 : r_data = 29'b00000000000000000000000000000;
	  8'h96 : r_data = 29'b00000000000000000000000000000;
	  8'h97 : r_data = 29'b00000000000000000000000000000;
	  8'h98 : r_data = 29'b10110001111110000001111000000; // OR ACC, A
	  8'h99 : r_data = 29'b00000000000000000000000000000;
	  8'h9a : r_data = 29'b00000000000000000000000000000;
	  8'h9b : r_data = 29'b00000000000000000000000000000;
	  8'h9c : r_data = 29'b00000000000000000000000000000;
	  8'h9d : r_data = 29'b00000000000000000000000000000;
	  8'h9e : r_data = 29'b00000000000000000000000000000;
	  8'h9f : r_data = 29'b00000000000000000000000000000;
	  8'ha0 : r_data = 29'b00000000000000000000000000000;
	  8'ha1 : r_data = 29'b00000000000000000000000000000;
	  8'ha2 : r_data = 29'b00000000000000000000000000000;
	  8'ha3 : r_data = 29'b00000000000000000000000000000;
	  8'ha4 : r_data = 29'b00000000000000000000000000000;
	  8'ha5 : r_data = 29'b00000000000000000000000000000;
	  8'ha6 : r_data = 29'b00000000000000000000000000000;
	  8'ha7 : r_data = 29'b00000000000000000000000000000;
	  8'ha8 : r_data = 29'b00000000000000000000000000000;
	  8'ha9 : r_data = 29'b00000000000000000000000000000;
	  8'haa : r_data = 29'b00000000000000000000000000000;
	  8'hab : r_data = 29'b00000000000000000000000000000;
	  8'hac : r_data = 29'b00000000000000000000000000000;
	  8'had : r_data = 29'b00000000000000000000000000000;
	  8'hae : r_data = 29'b00000000000000000000000000000;
	  8'haf : r_data = 29'b00000000000000000000000000000;
	  8'hb0 : r_data = 29'b00000000000000000000000000000;
	  8'hb1 : r_data = 29'b00000000000000000000000000000;
	  8'hb2 : r_data = 29'b00000000000000000000000000000;
	  8'hb3 : r_data = 29'b00000000000000000000000000000;
	  8'hb4 : r_data = 29'b00000000000000000000000000000;
	  8'hb5 : r_data = 29'b00000000000000000000000000000;
	  8'hb6 : r_data = 29'b00000000000000000000000000000;
	  8'hb7 : r_data = 29'b00000000000000000000000000000;
	  8'hb8 : r_data = 29'b00000000000000000000000000000;
	  8'hb9 : r_data = 29'b00000000000000000000000000000;
	  8'hba : r_data = 29'b00000000000000000000000000000;
	  8'hbb : r_data = 29'b00000000000000000000000000000;
	  8'hbc : r_data = 29'b00000000000000000000000000000;
	  8'hbd : r_data = 29'b00000000000000000000000000000;
	  8'hbe : r_data = 29'b00000000000000000000000000000;
	  8'hbf : r_data = 29'b00000000000000000000000000000;
	  8'hc0 : r_data = 29'b00000000000000000000000000000;
	  8'hc1 : r_data = 29'b00000000000000000000000000000;
	  8'hc2 : r_data = 29'b00000000000000000000000000000;
	  8'hc3 : r_data = 29'b00000000000000000000000000000;
	  8'hc4 : r_data = 29'b00000000000000000000000000000;
	  8'hc5 : r_data = 29'b00000000000000000000000000000;
	  8'hc6 : r_data = 29'b00000000000000000000000000000;
	  8'hc7 : r_data = 29'b00000000000000000000000000000;
	  8'hc8 : r_data = 29'b00000000000000000000000000000;
	  8'hc9 : r_data = 29'b00000000000000000000000000000;
	  8'hca : r_data = 29'b00000000000000000000000000000;
	  8'hcb : r_data = 29'b00000000000000000000000000000;
	  8'hcc : r_data = 29'b00000000000000000000000000000;
	  8'hcd : r_data = 29'b00000000000000000000000000000;
	  8'hce : r_data = 29'b00000000000000000000000000000;
	  8'hcf : r_data = 29'b00000000000000000000000000000;
	  8'hd0 : r_data = 29'b00000000000000000000000000000;
	  8'hd1 : r_data = 29'b00000000000000000000000000000;
	  8'hd2 : r_data = 29'b00000000000000000000000000000;
	  8'hd3 : r_data = 29'b00000000000000000000000000000;
	  8'hd4 : r_data = 29'b00000000000000000000000000000;
	  8'hd5 : r_data = 29'b00000000000000000000000000000;
	  8'hd6 : r_data = 29'b00000000000000000000000000000;
	  8'hd7 : r_data = 29'b00000000000000000000000000000;
	  8'hd8 : r_data = 29'b00000000000000000000000000000;
	  8'hd9 : r_data = 29'b00000000000000000000000000000;
	  8'hda : r_data = 29'b00000000000000000000000000000;
	  8'hdb : r_data = 29'b00000000000000000000000000000;
	  8'hdc : r_data = 29'b00000000000000000000000000000;
	  8'hdd : r_data = 29'b00000000000000000000000000000;
	  8'hde : r_data = 29'b00000000000000000000000000000;
	  8'hdf : r_data = 29'b00000000000000000000000000000;
	  8'he0 : r_data = 29'b00000000000000000000000000000;
	  8'he1 : r_data = 29'b00000000000000000000000000000;
	  8'he2 : r_data = 29'b00000000000000000000000000000;
	  8'he3 : r_data = 29'b00000000000000000000000000000;
	  8'he4 : r_data = 29'b00000000000000000000000000000;
	  8'he5 : r_data = 29'b00000000000000000000000000000;
	  8'he6 : r_data = 29'b00000000000000000000000000000;
	  8'he7 : r_data = 29'b00000000000000000000000000000;
	  8'he8 : r_data = 29'b00000000000000000000000000000;
	  8'he9 : r_data = 29'b00000000000000000000000000000;
	  8'hea : r_data = 29'b00000000000000000000000000000;
	  8'heb : r_data = 29'b00000000000000000000000000000;
	  8'hec : r_data = 29'b00000000000000000000000000000;
	  8'hed : r_data = 29'b00000000000000000000000000000;
	  8'hee : r_data = 29'b00000000000000000000000000000;
	  8'hef : r_data = 29'b00000000000000000000000000000;
	  8'hf0 : r_data = 29'b00000000000000000000000000000;
	  8'hf1 : r_data = 29'b00000000000000000000000000000;
	  8'hf2 : r_data = 29'b00000000000000000000000000000;
	  8'hf3 : r_data = 29'b00000000000000000000000000000;
	  8'hf4 : r_data = 29'b00000000000000000000000000000;
	  8'hf5 : r_data = 29'b00000000000000000000000000000;
	  8'hf6 : r_data = 29'b00000000000000000000000000000;
	  8'hf7 : r_data = 29'b00000000000000000000000000000;
	  8'hf8 : r_data = 29'b00000000000000000000000000000;
	  8'hf9 : r_data = 29'b00000000000000000000000000000;
	  8'hfa : r_data = 29'b00000000000000000000000000000;
	  8'hfb : r_data = 29'b00000000000000000000000000000;
	  8'hfc : r_data = 29'b00000000000000000000000000000;
	  8'hfd : r_data = 29'b00000000000000000000000000000;
	  8'hfe : r_data = 29'b00000000000000000000000000000;
	  8'hff : r_data = 29'b00000000000000000000000000000;
	  default : r_data = 29'b00000000000000000000000000000;
	 endcase

endmodule 
