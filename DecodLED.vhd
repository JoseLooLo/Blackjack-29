library ieee;
use ieee.std_logic_1164.all;

entity DecodLED is port (
	valor: in std_logic_vector(3 downto 0);
	saida: out std_logic_vector(9 downto 0)
);
end DecodLED;

architecture decodL of DecodLED is
Begin
	saida <= "0000000000" when valor = "0000" else --0
				"0000000001" when valor = "0001" else --1
				"0000000011" when valor = "0010" else --2
				"0000000111" when valor = "0011" else --3
				"0000001111" when valor = "0100" else --4
				"0000011111" when valor = "0101" else --5
				"0000111111" when valor = "0110" else --6
				"0001111111" when valor = "0111" else --7
				"0011111111" when valor = "1000" else --8
				"0111111111" when valor = "1001" else --9
				"1111111111" when valor = "1010";     --10
				
end decodL;