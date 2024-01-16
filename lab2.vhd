library ieee;
use ieee.std_logic_1164.all;

ENTITY lab2 IS
PORT(
	clk : IN std_logic;
	rst : IN std_logic;
	
	digit0 : OUT std_logic_vector(7 downto 0);
	digit1 : OUT std_logic_vector(7 downto 0);
	digit2 : OUT std_logic_vector(7 downto 0)
);
END lab2;

ARCHITECTURE archi OF lab2 IS

-- valeur des digits (chiffre)
signal digit0value : std_logic_vector(3 downto 0);
signal digit1value : std_logic_vector(3 downto 0);
signal digit2value : std_logic_vector(3 downto 0);

component lab2_qsys is
  port (
		clk_clk                           : in  std_logic                    := 'X'; -- clk
		reset_reset_n                     : in  std_logic                    := 'X'; -- reset_n
		digit0_external_connection_export : out std_logic_vector(3 downto 0);        -- export
		digit1_external_connection_export : out std_logic_vector(3 downto 0);        -- export
		digit2_external_connection_export : out std_logic_vector(3 downto 0)         -- export
  );
end component lab2_qsys;

BEGIN

u0 : component lab2_qsys
port map (
	clk_clk                           => clk,                           --                        clk.clk
	reset_reset_n                     => rst,                     --                      reset.reset_n
	digit0_external_connection_export => digit0value, -- digit0_external_connection.export
	digit1_external_connection_export => digit1value, -- digit1_external_connection.export
	digit2_external_connection_export => digit2value  -- digit2_external_connection.export
);

segdecod0 : entity work.segdecod(RTL)
	port map(Entree => digit0value, Sortie => digit0(6 downto 0));
	
segdecod1 : entity work.segdecod(RTL)
	port map(Entree => digit1value, Sortie => digit1(6 downto 0));
	
segdecod2 : entity work.segdecod(RTL)
	port map(Entree => digit2value, Sortie => digit2(6 downto 0));
	
digit0(7) <= '1';
digit1(7) <= '1';
digit2(7) <= '1';

END archi;
