library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Counter_round is port (
	R1: in std_logic;
	E3: in std_logic;
	clock: in std_logic;
	end_game: out std_logic;
	round: out std_logic_vector(3 downto 0)
	);
end Counter_round;

architecture countR of Counter_round is

signal next_round: std_logic_vector(3 downto 0);

begin

process(R1, E3, clock)
begin
	if R1 = '1' then
		next_round <= "0000";
		end_game <= '0';
	elsif clock'event and clock = '1' then
		if E3 = '1' then
			next_round <= next_round + 1;
		end if;
		if next_round = "1000" then
			end_game <= '1';
		else
			end_game <= '0';
		end if;
	end if;
end process;

round <= next_round;

end countR;