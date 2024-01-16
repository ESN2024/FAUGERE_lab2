
module lab2_qsys (
	clk_clk,
	reset_reset_n,
	digit0_external_connection_export,
	digit1_external_connection_export,
	digit2_external_connection_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[3:0]	digit0_external_connection_export;
	output	[3:0]	digit1_external_connection_export;
	output	[3:0]	digit2_external_connection_export;
endmodule
