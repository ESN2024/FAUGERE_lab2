
module lab2_qsys (
	clk_clk,
	digit0_external_connection_export,
	digit1_external_connection_export,
	digit2_external_connection_export,
	reset_reset_n);	

	input		clk_clk;
	output	[3:0]	digit0_external_connection_export;
	output	[3:0]	digit1_external_connection_export;
	output	[3:0]	digit2_external_connection_export;
	input		reset_reset_n;
endmodule
