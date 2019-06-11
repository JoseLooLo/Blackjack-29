library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity DecodBCD is port (
	valor: in std_logic_vector(4 downto 0);
	saida: out std_logic_vector(7 downto 0)
);
end DecodBCD;

architecture decodB of DecodBCD is
	signal saidaLS: std_logic_vector(3 downto 0);
	signal saidaMS: std_logic_vector(3 downto 0);
Begin
	saidaLS <= "0000" when valor = "00000" else -- 0
				"0001" when valor = "00001" else -- 1
				"0010" when valor = "00010" else -- 2
				"0011" when valor = "00011" else -- 3
				"0100" when valor = "00100" else -- 4
				"0101" when valor = "00101" else -- 5
				"0110" when valor = "00110" else -- 6
				"0111" when valor = "00111" else -- 7
				"1000" when valor = "01000" else -- 8
				"1001" when valor = "01001" else -- 9
				
				"0000" when valor = "01010" else -- 0
				"0001" when valor = "01011" else -- 1
				"0010" when valor = "01100" else -- 2
				"0011" when valor = "01101" else -- 3
				"0100" when valor = "01110" else -- 4
				"0101" when valor = "01111" else -- 5
				"0110" when valor = "10000" else -- 6
				"0111" when valor = "10001" else -- 7
				"1000" when valor = "10010" else -- 8
				"1001" when valor = "10011" else -- 9
				
				"0000" when valor = "10100" else -- 0
				"0001" when valor = "10101" else -- 1
				"0010" when valor = "10110" else -- 2
				"0011" when valor = "10111" else -- 3
				"0100" when valor = "11000" else -- 4
				"0101" when valor = "11001" else -- 5
				"0110" when valor = "11010" else -- 6
				"0111" when valor = "11011" else -- 7
				"1000" when valor = "11100" else -- 8
				"1001" when valor = "11101" else -- 9
				
				"0000" when valor = "11110" else -- 0
				"0001" when valor = "11111"; -- 1
				
	saidaMS <= "0000" when valor = "00000" else -- 0
				"0000" when valor = "00001" else -- 1
				"0000" when valor = "00010" else -- 2
				"0000" when valor = "00011" else -- 3
				"0000" when valor = "00100" else -- 4
				"0000" when valor = "00101" else -- 5
				"0000" when valor = "00110" else -- 6
				"0000" when valor = "00111" else -- 7
				"0000" when valor = "01000" else -- 8
				"0000" when valor = "01001" else -- 9
				
				"0001" when valor = "01010" else -- 0
				"0001" when valor = "01011" else -- 1
				"0001" when valor = "01100" else -- 2
				"0001" when valor = "01101" else -- 3
				"0001" when valor = "01110" else -- 4
				"0001" when valor = "01111" else -- 5
				"0001" when valor = "10000" else -- 6
				"0001" when valor = "10001" else -- 7
				"0001" when valor = "10010" else -- 8
				"0001" when valor = "10011" else -- 9
				
				"0010" when valor = "10100" else -- 0
				"0010" when valor = "10101" else -- 1
				"0010" when valor = "10110" else -- 2
				"0010" when valor = "10111" else -- 3
				"0010" when valor = "11000" else -- 4
				"0010" when valor = "11001" else -- 5
				"0010" when valor = "11010" else -- 6
				"0010" when valor = "11011" else -- 7
				"0010" when valor = "11100" else -- 8
				"0010" when valor = "11101" else -- 9
				
				"0011" when valor = "11110" else -- 0
				"0011" when valor = "11111"; -- 1
				
	saida <= saidaMS & saidaLS;
				
end decodB;