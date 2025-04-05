//Half adder behavioral modeling:

`timescale 1ns / 1ps
module half_adder(sum,carry,a,b);
input a,b;
output reg sum,carry;
always@(*)
begin
sum = a^b;
carry = a&b;
end
endmodule

//Half adder dataflow modeling:

`timescale 1ns / 1ps
module half_adder(sum,carry,a,b);
input a,b;
output sum,carry;
assign sum = a^b;
assign carry = a&b;
endmodule

//Half adder structural modeling:

`timescale 1ns / 1ps
module half_adder(sum,carry,a,b);
input a,b;
output sum,carry;
xor(sum,a,b);
and(carry,a,b);
endmodule

//Half adder testbench / testharness:

`timescale 1ns / 1ps
module half_adder_tb;
reg a1,b1;
wire sum1,carry1;
half_adder dut(.a(a1),.b(b1),.sum(sum1),.carry(carry1));
initial
begin
$dumpfile("half_adder.vcd");
$dumpvars(0,half_adder_tb);
$monitor($time,"a1=%b,b1=%b,sum1=%b,carry1=%b",a1,b1,sum1,carry1);
a1=0;b1=0;
#5 a1=0;b1=1;
#5 a1=1;b1=0;
#5 a1=1;b1=1;
#5 $finish;
end
endmodule
