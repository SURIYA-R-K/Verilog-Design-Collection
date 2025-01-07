//code for not gate:

module not_gate(in1,out);
input in1;
output out;
assign out = ~in1;
endmodule

//test bench code for not gate

module not_gate_tb;
  reg in1;
  wire out1;
  not_gate(.in1(in1), .out(out1));
  initial
  begin
    in1 = 0;
    $monitor($time, " in1=%b, out1=%b", in1, out1);
    #5 in1 = 0;  
    #5 in1 = 1;  
    #5 $finish;  
  end
endmodule
