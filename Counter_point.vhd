library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_Std.all;
use IEEE.std_logic_unsigned.all;

entity Counter_point is port (
	HexSeq: in std_logic_vector(3 downto 0);
	R1: in std_logic;
	OverF: in std_logic;
	User: in std_logic;
	E3: in std_logic;
	clock: in std_logic;
	win: out std_logic;
	U_Point: out std_logic_vector(5 downto 0) 
	);
end Counter_point;

architecture countP of Counter_point is

signal count: std_logic_vector(5 downto 0);
signal int : integer;

begin

process(R1, OverF, User, E3, clock)
begin
	int <= to_integer(unsigned(HexSeq));
	if R1 = '1' or OverF = '1' then
		U_Point <= "000000";
		count <= "000000";
	elsif clock'event and clock = '1' and User = '1' and E3 = '1' then
		count <= count + int;
		U_Point <= count;
		if count = "011101" then
			win <= '1';
		end if;
	end if;

end process;

end countP;