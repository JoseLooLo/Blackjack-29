library ieee;
use ieee.std_logic_1164.all;

entity Topo is port (
	--Pinos
	LEDR: out std_logic_vector(9 downto 0);
	HEX5: out std_logic_vector(6 downto 0);
	HEX4: out std_logic_vector(6 downto 0);
	HEX3: out std_logic_vector(6 downto 0);
	HEX2: out std_logic_vector(6 downto 0);
	HEX1: out std_logic_vector(6 downto 0);
	HEX0: out std_logic_vector(6 downto 0);
	KEY: in std_logic_vector(3 downto 0);
	SW: in std_logic_vector(1 downto 0);
	
	--clock
	CLOCK_50: in std_logic
	);
end Topo;

architecture tp of Topo is
--Signal
	signal R1, R2, E1, E2, E3, E4: std_logic;
	signal SEL: std_logic_vector(1 downto 0);
	signal overflow, end_game, end_time, win0, win1: std_logic;
	signal bt0, bt1, bt2, bt3: std_logic;

--ButtonSync
component ButtonSync is port (
	KEY0, KEY1, KEY2, KEY3, CLK: in std_logic;
	BTN0, BTN1, BTN2, BTN3: out std_logic
	);
end component;

--Colocar o component do datapth
component Datapath is port (
	SW_Datapath: in std_logic_vector(1 downto 0);
	BT2_Datapath: in std_logic;
	clock: in std_logic;
	--Variaveis do controle
	R1_Datapath: in std_logic;
	R2_Datapath: in std_logic;
	E1_Datapath: in std_logic;
	E2_Datapath: in std_logic;
	E3_Datapath: in std_logic;
	E4_Datapath: in std_logic;
	SEL_Datapath: in std_logic_vector(1 downto 0);
	--Variaveis para o controle
	overflow_Datapath: out std_logic;
	end_game_Datapath: out std_logic;
	end_time_Datapath: out std_logic;
	win0_Datapath: out std_logic;
	win1_Datapath: out std_logic;
	--Variaveis para o Topo
	LEDR_Datapath: out std_logic_vector(9 downto 0);
	HEX5_Datapath: out std_logic_vector(6 downto 0);
	HEX4_Datapath: out std_logic_vector(6 downto 0);
	HEX3_Datapath: out std_logic_vector(6 downto 0);
	HEX2_Datapath: out std_logic_vector(6 downto 0);
	HEX1_Datapath: out std_logic_vector(6 downto 0);
	HEX0_Datapath: out std_logic_vector(6 downto 0)
	);
end component;
--Colocar o component do controle
component Controle is port (
	Enter: in std_logic; --Btn1
	Reset: in std_logic; --Btn0
	Stop: in std_logic;  --Btn2
	clock: in std_logic;
	--Variaveis vindo do datapath
	overflow_controle: in std_logic;
	end_game_controle: in std_logic;
	end_time_controle: in std_logic;
	win0_controle: in std_logic;
	win1_controle: in std_logic;
	--Variaveis para o datapath
	R1_controle: out std_logic;
	R2_controle: out std_logic;
	E1_controle: out std_logic;
	E2_controle: out std_logic;
	E3_controle: out std_logic;
	E4_controle: out std_logic;
	SEL_controle: out std_logic_vector(1 downto 0)
	);
end component;

Begin

BT: ButtonSync port map (KEY(0), KEY(1), KEY(2), KEY(3), CLOCK_50, bt0, bt1, bt2, bt3);
CONTROL: Controle port map (bt1, bt0, bt2, CLOCK_50, overflow, end_game, end_time, win0, win1, R1, R2, E1, E2, E3, E4, SEL);
DTPATH: Datapath port map (SW, bt2, CLOCK_50, R1, R2, E1, E2, E3, E4, SEL, overflow, end_game, end_time, win0, win1, LEDR, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);


end tp;