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
end component;
--Colocar o component do controle
component Controle is port (
	Enter: in std_logic; --Btn1
	Reset: in std_logic; --Btn0
	Stop: in std_logic;  --Btn2
	clock: in std_logic;
	--Variaveis vindo do datapath
	overflow: in std_logic;
	end_game: in std_logic;
	end_time: in std_logic;
	win0: in std_logic;
	win1: in std_logic;
	--Variaveis para o datapath
	R1: out std_logic;
	R2: out std_logic;
	E1: out std_logic;
	E2: out std_logic;
	E3: out std_logic;
	E4: out std_logic;
	SEL: out std_logic_vector(1 downto 0)
	);
end component;

Begin

BT: ButtonSync port map (KEY(0), KEY(1), KEY(2), KEY(3), CLOCK_50, bt0, bt1, bt2, bt3);
CONTROL: Controle port map (bt1, bt0, bt2, CLOCK_50, overflow, end_game, end_time, win0, win1, R1, R2, E1, E2, E3, E4, SEL);
DTPATH: Datapath port map (SW, bt2, CLOCK_50, R1, R2, E1, E2, E3, E4, SEL, overflow, end_game, end_time, win0, win1, LEDR, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);


end tp;