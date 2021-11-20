module lpf(
	input clk,
	input[31:0] data,
	output reg[31:0] out,
	
	input[31:0] b0,
	input[31:0] b1,
	input[31:0] b2,
	input[31:0] a0,
	input[31:0] a1,
	input[31:0] a2);
	
	reg[31:0] z2,z1,z0;
initial {out,z2,z1,z0} = 4'b0000;
/*
always @ (*)
begin
	out = (z0*a0)/10000;
	z1 = z2 + (a1*out + b1*data);
	z0 = z1 + (data*b0);
end


always @ (posedge clk)
begin
	z0 <= z1;
	z1 <= z2;
	z2 <= (data*b2 + out*a2);
end


*/









always @ (posedge clk)
begin
	out = (z1 + ((b0*data) + (a0*out)))/100;
	z1 = z2 + ((b1*data) + (a1*out));
	z2 = ((data*b2) + (a2*out));

end

endmodule
