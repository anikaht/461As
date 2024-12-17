module mux(a,b,c,d,e,sel,out);
input a,b,c,d,e;
    input[2:0] sel;
    output out;
                            reg 	out;

always @(a, b, c, d, e, sel) begin
    case(sel)
        3'b000: out = a;
        3'b001: out = b;
        3'b010: out = c;
        3'b011: out = d;
        3'b100: out = e;
        default: out = 1'b0;  // Default case to prevent latch
    endcase
end

  endmodule