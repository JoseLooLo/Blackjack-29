library ieee;
use ieee.std_logic_1164.all;

entity Controle is port (
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
				SEL<= "00";
				R1 <= '1';
				R2 <= '1';
				E1 <= '0';
				E2 <= '0';
				E3 <= '0';
				E4 <= '0';
				if Enter = '0' then
					ProximoEstado <= Setup;
				else
					ProximoEstado <= Start;
				end if;
				
			when Setup =>
				--Saidas
				SEL <= "01";
				R1 <= '0';
				R2 <= '0';
				E1 <= '0';
				E2 <= '1';
				E3 <= '0';
				E4 <= '0';
				if Enter = '0' then
					ProximoEstado <= Play;
				else
					ProximoEstado <= Setup;
				end if;
			
			when Play =>
				--Saidas
				SEL <= "10";
				R1 <= '0';
				R2 <= '0';
				E1 <= '1';
				E2 <= '0';
				E3 <= '0';
				E4 <= '1';
				if Stop = '0' and end_time = '0' then
					ProximoEstado <= Check;
				elsif end_time= '1' then
					ProximoEstado <= Result;
				else
					ProximoEstado <= Play;
				end if;
				
			when Check =>
				--Saidas
				SEL <= "10";
				R1 <= '0';
				R2 <= '0';
				E1 <= '1';
				E2 <= '0';
				E3 <= '0';
				E4 <= '0';
				if overflow = '0' and end_game = '0' and win0 = '0' and win1 = '0' then
					ProximoEstado <= Next_Round;
				elsif overflow = '1' or end_game = '1' or win0 = '1' or win1 = '1' then
					ProximoEstado <= Result;
				else
					ProximoEstado <= Check;
				end if;
				
			when Next_Round =>
				--Saidas
				SEL <= "10";
				R1 <= '0';
				R2 <= '1';
				E1 <= '1';
				E2 <= '0';
				E3 <= '1';
				E4 <= '0';
				ProximoEstado <= Wait_C;
				
			when Wait_C =>
				--Saidas
				SEL <= "10";
				R1 <= '0';
				R2 <= '0';
				E1 <= '1';
				E2 <= '0';
				E3 <= '0';
				E4 <= '0';
				if Enter = '0' then
					ProximoEstado <= Play;
				else
					ProximoEstado <= Wait_C;
				end if;
				
			when Result =>
				--Saidas
				SEL <= "11";
				R1 <= '0';
				R2 <= '0';
				E1 <= '0';
				E2 <= '0';
				E3 <= '0';
				E4 <= '0';
				if Enter = '0' then
					ProximoEstado <= Start;
				else
					ProximoEstado <= Result;
				end if;
				
		end case;
	end process;		
	
end control;