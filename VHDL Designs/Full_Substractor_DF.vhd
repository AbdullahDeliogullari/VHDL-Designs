-- Half Substractor
-- Data-flow modelling
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity Decleration
entity Full_Subs_DF is
port(
		Borrow_in	: in std_logic;
		input1		: in std_logic;
		input2		: in std_logic;
		Diff		: out std_logic;
		Borrow_out	: out std_logic);
end Full_Subs_DF;

--Architecture Body
architecture F_S_Behavior of Full_Subs_DF is
begin
		Diff <= ((input1 xor input2) xor Borrow_in);
		Borrow_out <= ((input1 and Borrow_in) or (input1 and not input2) or (not input2 and Borrow_in));
end F_S_Behavior;