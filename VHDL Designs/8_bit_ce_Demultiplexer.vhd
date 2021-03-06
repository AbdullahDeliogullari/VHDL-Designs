-- Demultiplexer with chip enable
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eight_bit_ce_demux is
port(
		input	: in std_logic;
		SEL	: in std_logic_vector(2 downto 0);
		CE	: in std_logic;
		output	: out std_logic_vector(7 downto 0));
end eight_bit_ce_demux;

architecture Demultiplexer_Behavior of eight_bit_ce_demux is
begin
		Demultiplexer	: process(input,SEL,CE)
			begin
				if (CE = '1') then
					if (SEL = "000") then output(7) <= input;
					elsif (SEL = "001") then output(6) <= input;
					elsif (SEL = "010") then output(5) <= input;
					elsif (SEL = "011") then output(4) <= input;
					elsif (SEL = "100") then output(3) <= input;
					elsif (SEL = "101") then output(2) <= input;
					elsif (SEL = "110") then output(1) <= input;
					elsif (SEL = "111") then output(0) <= input;
					else output(0) <= '0';
					end if;
				else output(0) <= '0';
				end if;
		end process Demultiplexer;
end Demultiplexer_Behavior;

				
					
		