module mux2to1 
#(	parameter MAX_WIDTH = 3)
(
    input wire [MAX_WIDTH-1:0] m1,
	 input wire [MAX_WIDTH-1:0] m2,
    input wire sel,  // La señal de selección
    output wire [MAX_WIDTH-1:0] out        // La salida
);

assign out = sel ? m2 : m1;

endmodule
