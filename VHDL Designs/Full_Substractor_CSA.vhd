-- Full Substractor
-- Conditional Signal Assignment
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity Decleration
entity Full_Subs_CSA is
port(
		Borrow_in	: in std_logic;
		input1		: in std_logic;
		input2		: in std_logic;
		output_data	: out std_logic_vector(1 downto 0));
end Full_Subs_CSA;

--Architecture Body
architecture F_S_Behavior of Full_Subs_CSA is
signal input_data	: std_logic_vector(2 downto 0);
begin
input_data	<=	(Borrow_in & input1 & input2);
output_data	<=	"00" when (input_data = "000" or input_data = "011" or input_data = "101") else
			"10" when (input_data = "001") else
			"11" when (input_data = "010" or input_data = "100" or input_data = "111") else
			"01" when (input_data = "110") else
			"00";
end F_S_Behavior;