//Not gate behavioral modeling:

`timescale 1ns / 1ps
module not_gate(out,a);
input a;
output reg out;
always@(*)
begin
out = ~a;
end
endmodule

//Not gate dataflow modeling:

`timescale 1ns / 1ps
module not_gate(out,a);
input a;
output out;
assign out = ~a;
endmodule

//Not gate structural modeling:

`timescale 1ns / 1ps
module not_gate(out,a);
input a;
output out;
not(out,a);
endmodule

//Not gate test bench/test harness:

`timescale 1ns / 1ps
module not_gate_tb;
reg a1;
wire out1;
xnor_gate dut(.a(a1),.out(out1));
initial
begin
$dumpfile("not_gate.vcd");
$dumpvars(0,not_gate_tb);
$monitor($time,"a1=%b,out1=%b",a1,out1);
a1=0;
#5 a1=1;
#5 $finish;
end
endmodule
