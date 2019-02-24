-- Full Adder
-- Data-flow modelling
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity Decleration
entity Full_Adder_DF is
port(
		input1	: in std_logic;
		input2	: in std_logic;
		C_in	: in std_logic;
		Sum	: out std_logic;
		C_out	: out std_logic);
end Full_Adder_DF;

--Architecture Body
architecture F_A_Behavior of Full_Adder_DF is 
begin
		Sum		<= ((input1 xor input2) xor C_in);
		C_out	<= ((input1 and input2) xor (input1 and C_in) xor (input2 and C_in));
end F_A_Behavior;
		
		