module filter_test;
reg[31:0] data;
wire[31:0] out;
reg clk;
reg[31:0] a2,a1,a0,b2,b1,b0;
    
lpf filter(clk,data,out,b0,b1,b2,a0,a1,a2);
initial begin
	clk = 0;
	a0 = 1;//4294967196;
	a1 = -74;//74;
	a2 = 27;//4294967269;
	b0 = 13;
	b1 = 26;
	b2 = 13;
	#10
	forever #10 clk=~clk;
end


initial begin
	$display(b0," ",b1," ",b2," ",a0," ",a1," ",a2);
	$monitor(data,"\t",out);
	$display("x(n)\ty(n)");
	data = 10000;
	#10 data = 20000;
	#10 data = 10000;
	#10 data = 24000;
	#10 data = 12000;
	#10 data = 2000;
	#10 data = 20000;
	#10 data = 15000;
	#10 data = 38000;
	#10 data = 20000;
	#10
	$finish;
end



endmodule
