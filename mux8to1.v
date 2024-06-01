module mux8to1 
(
    input wire m1,
	 input wire m2,
	 input wire m3,
	 input wire m4,
	 input wire m5,
	 input wire m6,
	 input wire m7,
	 input wire m8,
    input wire [2:0] sel,  // Las 3 señales de selección
    output wire out        // La salida
);

assign out = (sel == 3'b000) ? m1 :
             (sel == 3'b001) ? m2 :
             (sel == 3'b010) ? m3 :
             (sel == 3'b011) ? m4 :
             (sel == 3'b100) ? m5 :
             (sel == 3'b101) ? m6 :
             (sel == 3'b110) ? m7 :
                               m8;
endmodule
