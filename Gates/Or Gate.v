//Or gate behavioral modeling:

`timescale 1ns / 1ps
module or_gate(out,a,b);
input a,b;
output reg out;
always@(*)
begin
out = a|b;
end
endmodule

//Or gate dataflow modeling:

`timescale 1ns / 1ps
module or_gate(out,a,b);
input a,b;
output out;
assign out = a|b;
endmodule

//or gate structural modeling:

`timescale 1ns / 1ps
module or_gate(out,a,b);
input a,b;
output out;
or(out,a,b);
endmodule

//or gate testbench/test harness:

`timescale 1ns / 1ps
module or_gate_tb;
reg a1,b1;
wire out1;
or_gate dut(.a(a1),.b(b1),.out(out1));
initial
begin
$dumpfile("or_gate.vcd");
$dumpvars(0,or_gate_tb);
$monitor($time,"a1=%b,b1=%b,out1=%b",a1,b1,out1);
a1=0;b1=0;
#5 a1=0;b1=1;
#5 a1=1;b1=0;
#5 a1=1;b1=1;
#5 $finish;
end
endmodule
