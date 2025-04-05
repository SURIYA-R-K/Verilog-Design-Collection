//Nand gate behavioral modeling:

`timescale 1ns / 1ps
module nand_gate(out,a,b);
input a,b;
output reg out;
always@(*)
begin
out = ~(a&b);
end
endmodule

//nand gate dataflow modeling:

`timescale 1ns / 1ps
module nand_gate(out,a,b);
input a,b;
output out;
assign out = ~(a&b);
endmodule

//nand structural modeling

`timescale 1ns / 1ps
module nand_gate(out,a,b);
input a,b;
output out;
nand(out,a,b);
endmodule

//nand gate test bench/ test harness:

`timescale 1ns / 1ps
module nand_gate_tb;
reg a1,b1;
wire out1;
nand_gate dut(.a(a1),.b(b1),.out(out1));
initial
begin
$dumpfile("nand_gate.vcd");
$dumpvars(0,nand_gate_tb);
$monitor($time,"a1=%b,b1=%b,out1=%b",a1,b1,out1);
a1=0;b1=0;
#5 a1=0;b1=1;
#5 a1=1;b1=0;
#5 a1=1;b1=1;
#5 $finish;
end
endmodule
