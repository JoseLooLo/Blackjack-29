library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Counter_time is port (
	R2: in std_logic;
	E4: in std_logic;
	clock: in std_logic;
	end_time: out std_logic;
	time_ct: out std_logic_vector(3 downto 0)
	);
end Counter_time;

architecture countT of Counter_time is

signal count_time: std_logic_vector(3 downto 0);

begin

process(R2, E4, clock)
begin
	if R2 = '1' then
		time_ct <= "0000";
		count_time <= "0000";
	elsif clock'event and clock = '1' and E4 = '1' then
		count_time <= count_time + 1;
		time_ct <= count_time;
		if count_time = "1010" then
			end_time <= '1';
		end if;
	end if;
end process;

end countT;