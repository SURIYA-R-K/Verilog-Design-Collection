//4x1 mux behavioral modeling:


module mux_4x1(out,sel,y);
input [0:3]y;
input [1:0]sel;
output reg out;
always@(*)
begin
case (sel)
2'b00 : out = y[0];
2'b01 : out = y[1];
2'b10 : out = y[2];
2'b11 : out = y[3];
default : out = 0;
endcase
end
endmodule

//4x1 mux dataflow modeling:

module mux_4x1(out,sel,y);
input [3:0]y;
input [1:0]sel;
output out;
assign out = y[sel];
endmodule

//4x1 mux structural modeling:

module mux_4x1(out,sel,y);
input [3:0]y;
input [1:0]sel;
output out;
wire [3:0]t;
and(t[0],y[0],~sel[0],~sel[1]);
and(t[1],y[1],~sel[0],sel[1]);
and(t[2],y[2],sel[0],~sel[1]);
and(t[3],y[3],sel[0],sel[1]);
or(out,t[0],t[1],t[2],t[3]);
endmodule

//4x1 mux testbench / test harness:

module mux_4x1_tb;
reg [3:0]y;
reg [1:0]sel;
wire out;
mux_4x1 dut(.y(y),.sel(sel),.out(out));
initial
begin
$monitor($time,"y=%b,sel=%b,out=%b",y,sel,out);
 y = 4'b0000; sel = 2'b00;
 #5 y = 4'b0001; sel = 2'b01;
 #5 y = 4'b0010; sel = 2'b10;
 #5 y = 4'b0101; sel = 2'b11;
 #5 y = 4'b1111; sel = 2'b11;
 #5 y = 4'b1000; sel = 2'b00;
 #5 y = 4'b1011; sel = 2'b01;
#5 $finish;
end
endmodule
