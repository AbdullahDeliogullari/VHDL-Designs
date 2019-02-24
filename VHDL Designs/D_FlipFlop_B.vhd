-- D Flip-Flop
-- Memory Element

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_FlipF is
port(
		input	: in std_logic;
		CLK	: in std_logic;
		RESET	: in std_logic;
		output	: out std_logic);
end D_FlipF;

architecture Behavior_FlipF of D_FlipF is
begin
		FlipF	: process(input,CLK,RESET)
		begin
			if (rising_edge(CLK)) then 
				if (RESET = '0') then output <= '1';
				else output <= input;
				end if;
			end if;
		end process FlipF;
end Behavior_FlipF;	
			