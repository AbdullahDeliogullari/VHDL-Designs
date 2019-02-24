-- Half Substractor
-- Data-flow modelling
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--Entity Decleration
entity Half_Subs_DF is
port(
		input1	: in std_logic;
		input2	: in std_logic;
		Diff	: out std_logic;
		Borrow	: out std_logic);
end Half_Subs_DF;

--Architecture Body
architecture H_S_Behavior of Half_Subs_DF is
begin
		Diff <= (input1 xor input2);
		Borrow <= (input1 and not input2);
end H_S_Behavior;
