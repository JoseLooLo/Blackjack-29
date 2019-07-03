library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity DecodBCD is port (
	valor: in std_logic_vector(5 downto 0);
	saida: out std_logic_vector(7 downto 0)
);
end DecodBCD;

architecture decodB of DecodBCD is
	signal saidaLS: std_logic_vector(3 downto 0);
	signal saidaMS: std_logic_vector(3 downto 0);
Begin
	saidaLS <= "0000" when valor = "000000" else -- 0
				"0001" when valor = "000001" else -- 1
				"0010" when valor = "000010" else -- 2
				"0011" when valor = "000011" else -- 3
				"0100" when valor = "000100" else -- 4
				"0101" when valor = "000101" else -- 5
				"0110" when valor = "000110" else -- 6
				"0111" when valor = "000111" else -- 7
				"1000" when valor = "001000" else -- 8
				"1001" when valor = "001001" else -- 9
				
				"0000" when valor = "001010" else -- 0
				"0001" when valor = "001011" else -- 1
				"0010" when valor = "001100" else -- 2
				"0011" when valor = "001101" else -- 3
				"0100" when valor = "001110" else -- 4
				"0101" when valor = "001111" else -- 5
				"0110" when valor = "010000" else -- 6
				"0111" when valor = "010001" else -- 7
				"1000" when valor = "010010" else -- 8
				"1001" when valor = "010011" else -- 9
				
				"0000" when valor = "010100" else -- 0
				"0001" when valor = "010101" else -- 1
				"0010" when valor = "010110" else -- 2
				"0011" when valor = "010111" else -- 3
				"0100" when valor = "011000" else -- 4
				"0101" when valor = "011001" else -- 5
				"0110" when valor = "011010" else -- 6
				"0111" when valor = "011011" else -- 7
				"1000" when valor = "011100" else -- 8
				"1001" when valor = "011101" else -- 9
				
				"0000" when valor = "011110" else -- 0
				"0001" when valor = "011111" else -- 1
				"0010" when valor = "100000" else -- 2
				"0011" when valor = "100001" else -- 3
				"0100" when valor = "100010" else -- 4
				"0101" when valor = "100011" else -- 5
				"0110" when valor = "100100" else -- 6
				"0111" when valor = "100101" else -- 7
				"1000" when valor = "100110" else -- 8
				"1001" when valor = "100111" else -- 9
				
				"0000" when valor = "101000" else -- 0
				"0001" when valor = "101001" else -- 1
				"0010" when valor = "101010" else -- 2
				"0011" when valor = "101011" else -- 3
				"0100" when valor = "101100" else -- 4
				"0101" when valor = "101101" else -- 5
				"0110" when valor = "101110" else -- 6
				"0111" when valor = "101111" else -- 7
				"1000" when valor = "110000" else -- 8
				"1001" when valor = "110001" else -- 9
				
				"0000" when valor = "110010" else -- 0
				"0001" when valor = "110011" else -- 0
				"0010" when valor = "110100" else -- 0
				"0011" when valor = "110101" else -- 0
				"0100" when valor = "110110" else -- 0
				"0101" when valor = "110111"; -- 1
				
	saidaMS <= "0000" when valor = "000000" else -- 0
				"0000" when valor = "000001" else -- 1
				"0000" when valor = "000010" else -- 2
				"0000" when valor = "000011" else -- 3
				"0000" when valor = "000100" else -- 4
				"0000" when valor = "000101" else -- 5
				"0000" when valor = "000110" else -- 6
				"0000" when valor = "000111" else -- 7
				"0000" when valor = "001000" else -- 8
				"0000" when valor = "001001" else -- 9
				
				"0001" when valor = "001010" else -- 0
				"0001" when valor = "001011" else -- 1
				"0001" when valor = "001100" else -- 2
				"0001" when valor = "001101" else -- 3
				"0001" when valor = "001110" else -- 4
				"0001" when valor = "001111" else -- 5
				"0001" when valor = "010000" else -- 6
				"0001" when valor = "010001" else -- 7
				"0001" when valor = "010010" else -- 8
				"0001" when valor = "010011" else -- 9
				
				"0010" when valor = "010100" else -- 0
				"0010" when valor = "010101" else -- 1
				"0010" when valor = "010110" else -- 2
				"0010" when valor = "010111" else -- 3
				"0010" when valor = "011000" else -- 4
				"0010" when valor = "011001" else -- 5
				"0010" when valor = "011010" else -- 6
				"0010" when valor = "011011" else -- 7
				"0010" when valor = "011100" else -- 8
				"0010" when valor = "011101" else -- 9
				
				"0011" when valor = "011110" else -- 0
				"0011" when valor = "011111" else -- 1
				"0011" when valor = "100000" else -- 2
				"0011" when valor = "100001" else -- 3
				"0011" when valor = "100010" else -- 4
				"0011" when valor = "100011" else -- 5
				"0011" when valor = "100100" else -- 6
				"0011" when valor = "100101" else -- 7
				"0011" when valor = "100110" else -- 8
				"0011" when valor = "100111" else -- 9
				
				"0100" when valor = "101000" else -- 0
				"0100" when valor = "101001" else -- 1
				"0100" when valor = "101010" else -- 2
				"0100" when valor = "101011" else -- 3
				"0100" when valor = "101100" else -- 4
				"0100" when valor = "101101" else -- 5
				"0100" when valor = "101110" else -- 6
				"0100" when valor = "101111" else -- 7
				"0100" when valor = "110000" else -- 8
				"0100" when valor = "110001" else -- 9
				
				"0101" when valor = "110010" else -- 0
				"0101" when valor = "110011" else -- 0
				"0101" when valor = "110100" else -- 0
				"0101" when valor = "110101" else -- 0
				"0101" when valor = "110110" else -- 0
				"0101" when valor = "110111"; -- 1
				
	saida <= saidaMS & saidaLS;
				
end decodB;