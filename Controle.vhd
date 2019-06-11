library ieee;
use ieee.std_logic_1164.all;

entity Controle is port (
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
end Controle;

architecture control of Controle is
	type STATES is (Start, Setup, Play, Check, Result, Next_Round, Wait_C);
	signal EstadoAtual, ProximoEstado: STATES;
Begin
	process (clock, Reset)
	begin
		if Reset = '0' then
			EstadoAtual <= Start;
		elsif clock'event and clock = '1' then
			EstadoAtual <= ProximoEstado;
		end if;
	end process;
	
	process (EstadoAtual, Enter)
	begin
		case EstadoAtual is
			when Start =>
				--Saidas
				SEL_controle <= "00";
				R1_controle <= '1';
				R2_controle <= '1';
				E1_controle <= '0';
				E2_controle <= '0';
				E3_controle <= '0';
				E4_controle <= '0';
				if Enter = '0' then
					ProximoEstado <= Setup;
				end if;
				
			when Setup =>
				--Saidas
				SEL_controle <= "01";
				R1_controle <= '0';
				R2_controle <= '0';
				E1_controle <= '0';
				E2_controle <= '1';
				E3_controle <= '0';
				E4_controle <= '0';
				if Enter = '0' then
					ProximoEstado <= Play;
				end if;
			
			when Play =>
				--Saidas
				SEL_controle <= "10";
				R1_controle <= '0';
				R2_controle <= '0';
				E1_controle <= '1';
				E2_controle <= '0';
				E3_controle <= '0';
				E4_controle <= '1';
				if Stop = '0' and end_time_controle = '0' then
					ProximoEstado <= Check;
				elsif end_time_controle = '1' then
					ProximoEstado <= Result;
				end if;
				
			when Check =>
				--Saidas
				SEL_controle <= "10";
				R1_controle <= '0';
				R2_controle <= '0';
				E1_controle <= '1';
				E2_controle <= '0';
				E3_controle <= '0';
				E4_controle <= '0';
				if overflow_controle = '0' and end_game_controle = '0' and win0_controle = '0' and win1_controle = '0' then
					ProximoEstado <= Next_Round;
				elsif overflow_controle = '1' or end_game_controle = '1' or win0_controle = '1' or win1_controle = '1' then
					ProximoEstado <= Result;
				end if;
				
			when Next_Round =>
				--Saidas
				SEL_controle <= "10";
				R1_controle <= '0';
				R2_controle <= '1';
				E1_controle <= '1';
				E2_controle <= '0';
				E3_controle <= '1';
				E4_controle <= '0';
				ProximoEstado <= Wait_C;
				
			when Wait_C =>
				--Saidas
				SEL_controle <= "10";
				R1_controle <= '0';
				R2_controle <= '0';
				E1_controle <= '1';
				E2_controle <= '0';
				E3_controle <= '0';
				E4_controle <= '0';
				if Enter = '0' then
					ProximoEstado <= Play;
				end if;
				
			when Result =>
				--Saidas
				SEL_controle <= "11";
				R1_controle <= '0';
				R2_controle <= '0';
				E1_controle <= '0';
				E2_controle <= '0';
				E3_controle <= '0';
				E4_controle <= '0';
				if Enter = '0' then
					ProximoEstado <= Start;
				end if;
				
		end case;
	end process;		
	
end control;