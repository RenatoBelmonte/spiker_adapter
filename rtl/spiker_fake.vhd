library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity spiker_fake is
	generic (
        N_SPIKES : integer := 784  -- Default width
    );
	Port (
		clk_i : in STD_LOGIC;
		rst_ni : in STD_LOGIC;
		data_in : in STD_LOGIC_VECTOR(N_SPIKES-1 downto 0);
		data_out : out STD_LOGIC_VECTOR(N_SPIKES-1 downto 0);
		-- TO READER
		ready_i: in STD_LOGIC
		-- FROM WRITER
		sample_ready_i: in STD_LOGIC;
		-- TO BOTH
		sample_o: out STD_LOGIC;
	);
end spiker_fake;

architecture Behavioral of spiker_fake is
begin
	data_out <= data_in;
    sample_out <= '1';  -- Set sample_out to always be true
end Behavioral;