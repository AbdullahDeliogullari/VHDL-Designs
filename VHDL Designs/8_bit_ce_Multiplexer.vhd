-- Multiplexer with cheap-enable

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eight_bit_ce_mux is
port(
		input	: in std_logic_vector(7 downto 0);
		SEL	: in std_logic_vector(2 downto 0);
		CE	: in std_logic;	-- Chip enable
		output	: out std_logic);
end eight_bit_ce_mux;

architecture Multiplexer_Behavior of eight_bit_ce_mux is
begin
	Multiplexer	: process(input,SEL,CE)
		begin
		if (CE = '1') then
			case(SEL) is
				when "000"	=> output <= input(7);
				when "001"	=> output <= input(6);
				when "010"	=> output <= input(5);
				when "011"	=> output <= input(4);
				when "100"	=> output <= input(3);
				when "101"	=> output <= input(2);
				when "110"	=> output <= input(1);
				when "111"	=> output <= input(0);
				when others	=> output <= '0';
			end case;
		else
			output <= '0';
		end if;
	end process Multiplexer;
end Multiplexer_Behavior;
		
		