library ieee;
use ieee.std_logic_1164.all;

entity Decod7seg is port (
	valor: in std_logic_vector(3 downto 0);
	saida: out std_logic_vector(6 downto 0)
);
end Decod7seg;

architecture decod of Decod7seg is
Begin
	saida <= "1000000" when valor = "0000" else --0
				"1111001" when valor = "0001" else --1
				"0100100" when valor = "0010" else --2
				"0110000" when valor = "0011" else --3
				"0011001" when valor = "0100" else --4
				"0010010" when valor = "0101" else --5
				"0000010" when valor = "0110" else --6
				"1111000" when valor = "0111" else --7
				"0000000" when valor = "1000" else --8
				"0010000" when valor = "1001" else --9
				"0001000" when valor = "1010" else --A
				"0000011" when valor = "1011" else --b
				"1000110" when valor = "1100" else --C
				"0100001" when valor = "1101" else --d
				"0000110" when valor = "1110" else --E
				"0001110" when valor = "1111";     --F
				
end decod;