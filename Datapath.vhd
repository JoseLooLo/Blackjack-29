library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity Datapath is port (
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
end Datapath;

architecture path of Datapath is

component Led is port (
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
end component;

begin

end path;