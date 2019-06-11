library ieee;
use ieee.std_logic_1164.all;

entity Led is port (
	SEL_Led: in std_logic_vector(1 downto 0);
	--Variaveis precisam passar pelo decodificador
	Time_Led: in std_logic_vector(3 downto 0);
	HexSeq: in std_logic_vector(3 downto 0);
	Round: in std_logic_vector(3 downto 0);
	Win1: in std_logic_vector(3 downto 0);
	Level: in std_logic_vector(3 downto 0);
	U0_Point: in std_logic_vector(4 downto 0);
	U1_Point: in std_logic_vector(4 downto 0);
	
	
	LEDR_Led: out std_logic_vector(9 downto 0);
	HEX5_Led: out std_logic_vector(6 downto 0);
	HEX4_Led: out std_logic_vector(6 downto 0);
	HEX3_Led: out std_logic_vector(6 downto 0);
	HEX2_Led: out std_logic_vector(6 downto 0);
	HEX1_Led: out std_logic_vector(6 downto 0);
	HEX0_Led: out std_logic_vector(6 downto 0)
);
end Led;

architecture led of Led is
	signal HexSeqLED: std_logic_vector(6 downto 0);
	signal RoundLED: std_logic_vector(6 downto 0);
	signal Win1LED: std_logic_vector(6 downto 0);
	signal LevelLED: std_logic_vector(6 downto 0);
	signal U0_PointBCD: std_logic_vector(7 downto 0);
	signal U1_PointBCD: std_logic_vector(7 downto 0);
	signal U0_PointLED_1: std_logic_vector(6 downto 0);
	signal U0_PointLED_2: std_logic_vector(6 downto 0);
	signal U1_PointLED_1: std_logic_vector(6 downto 0);
	signal U1_PointLED_2: std_logic_vector(6 downto 0);
	
	component Decod7seg is port (
		valor: in std_logic_vector(3 downto 0);
		saida: out std_logic_vector(6 downto 0)
		);
	end component;
	
	component DecodBCD is port (
		valor: in std_logic_vector(4 downto 0);
		saida: out std_logic_vector(7 downto 0)
		);
	end component;

Begin
	--Transforma as entradas BCD em valores validos para HEX
	U1BCD: DecodBCD port map (U0_Point, U0_PointBCD);
	U2BCD: DecodBCD port map (U1_Point, U1_PointBCD);
	
	--Transforma as entradas em valores validos para HEX
	H1: Decod7seg port map (HexSeq, HexSeqLED);
	R1: Decod7seg port map (Round, RoundLED);
	W1: Decod7seg port map (Win1, Win1LED);
	L1: Decod7seg port map (Level, LevelLED);
	U1L1: Decod7seg port map (U0_PointBCD(7 downto 4), U0_PointLED_1);
	U1L2: Decod7seg port map (U0_PointBCD(3 downto 0), U0_PointLED_2);
	U2L1: Decod7seg port map (U1_PointBCD(7 downto 4), U1_PointLED_1);
	U2L2: Decod7seg port map (U1_PointBCD(3 downto 0), U1_PointLED_2);

	--Atualiza o LEDR com o tempo
	LEDR_Led <= "00000"&Time_Led;
	
	--Atualiza os HEX
	HEX5_Led <= "1111111" when SEL_Led = "00" else
				"1000111" when SEL_Led = "01" else
				HexSeqLED when SEL_Led = "10" else
				"1100001" when SEL_Led = "11";
			
	HEX4_Led <= "0010010" when SEL_Led = "00" else
				"0000110" when SEL_Led = "01" else
				RoundLED when SEL_Led = "10" else
				Win1LED when SEL_Led = "11";
				
	HEX3_Led <= "0000111" when SEL_Led = "00" else
				"1100011" when SEL_Led = "01" else
				U0_PointLED_1;
				
	HEX2_Led <= "0001000" when SEL_Led = "00" else
				"0000110" when SEL_Led = "01" else
				U0_PointLED_2;
				
	HEX1_Led <= "0101111" when SEL_Led = "00" else
				"1000111" when SEL_Led = "01" else
				U1_PointLED_1;
				
	HEX0_Led <= "0000111" when SEL_Led = "00" else
				LevelLED when SEL_Led = "01" else
				U1_PointLED_2;
				
end led;