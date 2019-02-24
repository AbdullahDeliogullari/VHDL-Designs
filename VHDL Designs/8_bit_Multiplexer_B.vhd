-- 8 bit Multiplexer
-- Behavioral Modelling
-- foo <= '1'; -- single quotes mean single bit.
-- bar <= "1", -- double quote because it's a vector, even though it's only one bit wide
-- bletch <= "10010011"; -- double quotes. it's a vector, one digit per bit in the vector.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eight_bit_Mux is
port(
		input	: in std_logic_vector(7 downto 0);
		Sel	: in std_logic_vector(2 downto 0);
		output	: out std_logic);
end eight_bit_Mux;

architecture Multiplexer_Behavior of eight_bit_Mux is
begin
	Multiplexer_P	: process(input,Sel)
	begin
		if	(Sel = "000") then output <= input(7);
		elsif	(Sel = "001") then output <= input(6);
		elsif	(Sel = "010") then output <= input(5);
		elsif	(Sel = "011") then output <= input(4);
		elsif	(Sel = "100") then output <= input(3);
		elsif	(Sel = "101") then output <= input(2);
		elsif	(Sel = "110") then output <= input(1);
		elsif	(Sel = "111") then output <= input(0);
		else	 output <= '0';
		end if;
	end process Multiplexer_P;
end Multiplexer_Behavior;
		