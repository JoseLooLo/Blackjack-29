library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Sequencer is port (
	R1: in std_logic;
	STOP: in std_logic;
	E4: in std_logic;
	clock: in std_logic;
	hexseq: out std_logic_vector(3 downto 0)
	);
end Sequencer;

architecture seq of Sequencer is

signal prox: std_logic_vector(3 downto 0);
signal count: std_logic_vector(4 downto 0);

begin

process (R1, STOP, E4, clock)
begin
	if R1 = '1' then
		hexseq <= "0000";
		count <= "00000";
	elsif clock'event and clock = '1' and STOP = '0' and E4 = '1' then
		hexseq <= prox;
		count <= count + 1;
		if count = "10100" then
			count <= "00000";
		end if;
	end if;
end process;

prox <= "0100" when count = "00000" else  --4
				"0101" when count = "00001" else --5
				"0001" when count = "00010" else --1
				"1111" when count = "00011" else --F
				"1100" when count = "00100" else --C
				"1000" when count = "00101" else --8
				"0010" when count = "00110" else --2
				"1101" when count = "00111" else --D
				"1010" when count = "01000" else --A
				"1001" when count = "01001" else --9
				"0110" when count = "01010" else --6
				"0011" when count = "01011" else --3
				"1110" when count = "01100" else --E
				"0111" when count = "01101" else --7
				"1011" when count = "01110" else --B
				"0000" when count = "01111" else --0
				"1111" when count = "10000" else --F
				"0100" when count = "10001" else --4
				"1001" when count = "10010" else --9
				"1100" when count = "10011";     --C

end seq;