library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Datapath is port (
	SW: in std_logic_vector(1 downto 0);
	BT2: in std_logic;
	clock: in std_logic;
	--Variaveis do controle
	R1: in std_logic;
	R2: in std_logic;
	E1: in std_logic;
	E2: in std_logic;
	E3: in std_logic;
	E4: in std_logic;
	SEL: in std_logic_vector(1 downto 0);
	--Variaveis para o controle
	overflow: out std_logic;
	end_game: out std_logic;
	end_time: out std_logic;
	win0: out std_logic;
	win1: out std_logic;
	--Variaveis para o Topo
	LEDR: out std_logic_vector(9 downto 0);
	HEX5: out std_logic_vector(6 downto 0);
	HEX4: out std_logic_vector(6 downto 0);
	HEX3: out std_logic_vector(6 downto 0);
	HEX2: out std_logic_vector(6 downto 0);
	HEX1: out std_logic_vector(6 downto 0);
	HEX0: out std_logic_vector(6 downto 0)
	);
end Datapath;

architecture path of Datapath is

signal CLKHZ, CLKT: std_logic; --clocks
signal Round: std_logic_vector (3 downto 0);
signal User: std_logic; --User
signal Level: std_logic_vector (1 downto 0); --Velocidade
signal U0_Point, U1_Point: std_logic_vector(5 downto 0); --pontuaçao
signal HEXSEQ: std_logic_vector(3 downto 0); --Sequencia de numeros
signal Time_DP: std_logic_vector(3 downto 0); --Temporizador para o usuario clicar STOP
signal OverF0, OverF1: std_logic;
signal Win_Point0, Win_Point1: std_logic;
signal clock1Hz, clock2Hz, clock4Hz, clock10Hz: std_logic;
signal win1_dp, win0_dp, win1_led: std_logic;
signal signal_end_game: std_logic;
signal led_u0_point, led_u1_point: std_logic_vector(4 downto 0);

component Led is port (
	SEL: in std_logic_vector(1 downto 0);
	--Variaveis precisam passar pelo decodificador
	Time_Led: in std_logic_vector(3 downto 0);
	HexSeq: in std_logic_vector(3 downto 0);
	Round: in std_logic_vector(3 downto 0);
	Win1: in std_logic_vector(3 downto 0);
	Level: in std_logic_vector(3 downto 0);
	U0_Point: in std_logic_vector(4 downto 0);
	U1_Point: in std_logic_vector(4 downto 0);
	
	
	LEDR: out std_logic_vector(9 downto 0);
	HEX5: out std_logic_vector(6 downto 0);
	HEX4: out std_logic_vector(6 downto 0);
	HEX3: out std_logic_vector(6 downto 0);
	HEX2: out std_logic_vector(6 downto 0);
	HEX1: out std_logic_vector(6 downto 0);
	HEX0: out std_logic_vector(6 downto 0)
);
end component;

component FSM_clock is port (
	R1: in std_logic;
	E1: in std_logic;
	clock: in std_logic;
	clock_saida0_5Hz: out std_logic;
	clock_saida1Hz: out std_logic;
	clock_saida2Hz: out std_logic;
	clock_saida4Hz: out std_logic;
	clock_saida10Hz: out std_logic
);
end component;

component Sequencer is port (
	R1: in std_logic;
	STOP: in std_logic;
	E4: in std_logic;
	clock: in std_logic;
	hexseq: out std_logic_vector(3 downto 0)
	);
end component;

component Counter_round is port (
	R1: in std_logic;
	E3: in std_logic;
	clock: in std_logic;
	end_game: out std_logic;
	round: out std_logic_vector(3 downto 0)
	);
end component;

component Counter_time is port (
	R2: in std_logic;
	E4: in std_logic;
	clock: in std_logic;
	end_time: out std_logic;
	time_ct: out std_logic_vector(3 downto 0)
	);
end component;

component Counter_point is port (
	HexSeq: in std_logic_vector(3 downto 0);
	R1: in std_logic;
	OverF: in std_logic;
	User: in std_logic;
	E3: in std_logic;
	clock: in std_logic;
	win: out std_logic;
	U_Point: out std_logic_vector(5 downto 0) 
	);
end component;

begin

--Registrador Level | ele eh apenas ativo durante o estado Setup (2)
process (R1, E2, clock)
begin
	if R1 = '1' then
		Level <= "00";
	elsif clock'event and clock = '1' and E2 = '1' then
		Level <= SEL;
	end if;
end process;

--Port map para o FMS_clock para buscar todos os clocks possiveis
--E preenche os clocks CLKT(0.5Hz/Contagem) e CLKHZ(Level)
C1: FSM_clock port map (R1, E1, clock, CLKT, clock1Hz, clock2Hz, clock4Hz, clock10Hz);
CLKHZ <= clock1Hz when Level = "00" else
			clock2Hz when Level = "01" else
			clock4Hz when Level = "10" else
			clock10Hz when Level = "11";
			
--Obtem a sequencia de numeros
S1: Sequencer port map (R1, BT2, E4, CLKHZ, HEXSEQ);

--Obtem o numero do round e o numero do jogador atual
CR1: Counter_round port map (R1, E3, clock, signal_end_game, Round);
User <= Round(0);

--Obtem a contagem de tempo e o end_time
CT1: Counter_time port map (R2, E4, CLKT, end_time, Time_DP);

--Contagem de pontos do player0
CP0: Counter_point port map (HEXSEQ, R1, '1', OverF0, E3, clock, win0_dp, U0_Point);

--Contagem de pontos do player1
CP1: Counter_point port map (HEXSEQ, R1, '1', OverF1, E3, clock, win1_dp, U1_Point);

--Verifica o overflow dos players
OverF0 <= '1' when (U0_Point > "011101") else
				'0';
OverF1 <= '1' when (U1_Point > "011101") else
				'0';
				
--Comparaçao dos pontos
Win_Point0 <= '1' when signal_end_game = '1' and (U0_Point > U1_Point) else
					'0';
Win_Point1 <= '1' when signal_end_game = '1' and (U1_Point > U0_Point) else
					'0';

end_game <= signal_end_game;

--Verifica condiçao de vitoria
win0 <= Win_Point0 or OverF1 or win0_dp;
win1 <= Win_Point1 or OverF0 or win1_dp;
win1_led <= Win_Point1 or OverF0 or win1_dp;
			
--Check se houve overflow
overflow <= OverF0 or OverF1;

--LEDS
led_u0_point <= U0_Point(4 downto 0);
led_u1_point <= U1_Point(4 downto 0);
L1: Led port map (SEL, Time_DP, HEXSEQ, Round, "000"&win1_led, "00"&Level, led_u0_point, led_u1_point, LEDR, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);

end path;