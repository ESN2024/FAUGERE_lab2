	component lab2_qsys is
		port (
			clk_clk                           : in  std_logic                    := 'X'; -- clk
			reset_reset_n                     : in  std_logic                    := 'X'; -- reset_n
			digit0_external_connection_export : out std_logic_vector(3 downto 0);        -- export
			digit1_external_connection_export : out std_logic_vector(3 downto 0);        -- export
			digit2_external_connection_export : out std_logic_vector(3 downto 0)         -- export
		);
	end component lab2_qsys;

	u0 : component lab2_qsys
		port map (
			clk_clk                           => CONNECTED_TO_clk_clk,                           --                        clk.clk
			reset_reset_n                     => CONNECTED_TO_reset_reset_n,                     --                      reset.reset_n
			digit0_external_connection_export => CONNECTED_TO_digit0_external_connection_export, -- digit0_external_connection.export
			digit1_external_connection_export => CONNECTED_TO_digit1_external_connection_export, -- digit1_external_connection.export
			digit2_external_connection_export => CONNECTED_TO_digit2_external_connection_export  -- digit2_external_connection.export
		);

