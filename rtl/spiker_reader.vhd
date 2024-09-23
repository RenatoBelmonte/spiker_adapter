library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity spiker_reader is
	generic (
        N_SPIKES : integer := 784  -- Default width
    );
	Port (
		clk_i : in STD_LOGIC;
		rst_ni : in STD_LOGIC;
		data_in : in STD_LOGIC_VECTOR(DATA_WIDTHt downto 0);
		data_out : out STD_LOGIC_VECTOR(DATA_WIDTH downto 0);
	);
end spiker_reader;

architecture Behavioral of spiker_reader is
begin
	data_out <= data_in;
end Behavioral;