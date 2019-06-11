library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity FSM_clock is port (
 valor_clock: in std_logic;
 reset: in std_logic;
 clock: in std_logic;
 clock_saida: out std_logic
);
end FSM_clock;

architecture topo_beh of FSM_clock is
	signal contador: std_logic_vector(27 downto 0);
Begin
	process(clock, reset, contador)
	begin
	 if reset= '1' then
		contador <= x"0000000";
	 elsif clock'event and clock= '1' then
		 contador <= contador + 1;
		 if contador = x"2FAF07F" then
			 contador <= x"0000000";
			 clock_saida <= '1';
		 else
			 clock_saida <= '0';
		 end if;
	 end if;
	end process;
end topo_beh;