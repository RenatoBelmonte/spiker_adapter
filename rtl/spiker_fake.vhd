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
		ready_i: in STD_LOGIC;
		-- FROM WRITER
		sample_ready_i: in STD_LOGIC;
		-- TO BOTH
		sample_o: out STD_LOGIC
	);
end spiker_fake;

architecture Behavioral of spiker_fake is

	-- Define the states
	type state_type is (IDLE, WORKING, DONE);
	signal current_state, next_state : state_type;

begin

	-- State transition process
	process(clk_i, rst_ni)
	begin
		if rst_ni = '0' then
			current_state <= IDLE;
			sample_o <= '0';
		elsif rising_edge(clk_i) then
			current_state <= next_state;
		end if;
	end process;

	-- Next state logic
	process(current_state, ready_i, sample_ready_i)
	begin
		case current_state is
			when IDLE =>
				if sample_ready_i = '1' then
					next_state <= WORKING;
				else
					next_state <= IDLE;
				end if;
			when WORKING =>
				if ready_i = '1' then
					next_state <= DONE;
				else
					next_state <= WORKING;
				end if;
			when DONE =>
				next_state <= IDLE;
			when others =>
				next_state <= IDLE;
		end case;
	end process;

	-- Output logic
	process(current_state)
	begin
		case current_state is
			when IDLE =>
				sample_o <= '1';
			when WORKING =>
				sample_o <= '0';
			when DONE =>
				sample_o <= '1';
			when others =>
				sample_o <= '0';
		end case;
	end process;

end Behavioral;