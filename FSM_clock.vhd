library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FSM_clock is port (
	R1: in std_logic;
	E1: in std_logic;
	clock: in std_logic;
	clock_saida0_5Hz: out std_logic;
	clock_saida1Hz: out std_logic;
	clock_saida2Hz: out std_logic;
	clock_saida4Hz: out std_logic;
	clock_saida10Hz: out std_logic
);
end FSM_clock;

architecture topo_beh of FSM_clock is
	signal contador0_5Hz: std_logic_vector(27 downto 0);
	signal contador1Hz: std_logic_vector(27 downto 0);
	signal contador2Hz: std_logic_vector(27 downto 0);
	signal contador4Hz: std_logic_vector(27 downto 0);
	signal contador10Hz: std_logic_vector(27 downto 0);
Begin
	--0.5Hz
	process(clock, R1, E1, contador0_5Hz)
	begin
		if R1 = '1' then
			contador0_5Hz <= x"0000000";
		elsif clock'event and clock = '1' and E1 = '1' then
			contador0_5Hz <= contador0_5Hz + 1;
			if contador0_5Hz = x"5F5E0FE" then --Valor de 0.5Hz 99999998
				contador0_5Hz <= x"0000000";
				clock_saida0_5Hz <= '1';
			else
				clock_saida0_5Hz <= '0';
			end if;
		end if;
	end process;
	
	--1Hz
	process(clock, R1, E1, contador1Hz)
	begin
		if R1 = '1' then
			contador1Hz <= x"0000000";
		elsif clock'event and clock = '1' and E1 = '1' then
			contador1Hz <= contador1Hz + 1;
			if contador1Hz = x"2FAF07F" then --Valor de 1Hz 49999999
				contador1Hz <= x"0000000";
				clock_saida1Hz <= '1';
			else
				clock_saida1Hz <= '0';
			end if;
		end if;
	end process;
	
	--2Hz
	process(clock, R1, E1, contador2Hz)
	begin
		if R1 = '1' then
			contador2Hz <= x"0000000";
		elsif clock'event and clock = '1' and E1 = '1' then
			contador2Hz <= contador2Hz + 1;
			if contador2Hz = x"17D783F" then --Valor de 2Hz 24999999
				contador2Hz <= x"0000000";
				clock_saida2Hz <= '1';
			else
				clock_saida2Hz <= '0';
			end if;
		end if;
	end process;
	
	--4Hz
	process(clock, R1, E1, contador4Hz)
	begin
		if R1 = '1' then
			contador4Hz <= x"0000000";
		elsif clock'event and clock = '1' and E1 = '1' then
			contador4Hz <= contador4Hz + 1;
			if contador4Hz = x"BEBC1F" then --Valor de 4Hz 12499999
				contador4Hz <= x"0000000";
				clock_saida4Hz <= '1';
			else
				clock_saida4Hz <= '0';
			end if;
		end if;
	end process;
	
	--10Hz
	process(clock, R1, E1, contador10Hz)
	begin
		if R1 = '1' then
			contador10Hz <= x"0000000";
		elsif clock'event and clock = '1' and E1 = '1' then
			contador10Hz <= contador10Hz + 1;
			if contador10Hz = x"4C4B3F" then --Valor de 10Hz 12499999
				contador10Hz <= x"0000000";
				clock_saida10Hz <= '1';
			else
				clock_saida10Hz <= '0';
			end if;
		end if;
	end process;
end topo_beh;