module demux1to2 
#(	parameter MAX_WIDTH = 8)
(
    input wire [MAX_WIDTH-1:0] in,      // Entrada única
    input wire sel,     // Señal de selección
    output wire [MAX_WIDTH-1:0] out0,   // Salida 0
    output wire [MAX_WIDTH-1:0] out1    // Salida 1
);

wire [MAX_WIDTH-1:0] zeros;
assign zeros = {MAX_WIDTH{1'b0}};

    assign out0 = (sel == 1'b0) ? in : zeros;
    assign out1 = (sel == 1'b1) ? in : zeros;
endmodule
