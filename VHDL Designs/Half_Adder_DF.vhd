-- Half Adder
-- Data-flow modelling
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity Decleration
entity Half_Adder_DF is
port(
	input1	: in std_logic;
	input2	: in std_logic;
	Sum	: out std_logic;
	C_out	: out std_logic);
end Half_Adder_DF;

-- Architecture Body
architecture H_A_Behavior of Half_Adder_DF is
begin
	Sum	<= input1 xor input2;
	C_out	<= input1 and input2;
end H_A_Behavior;
