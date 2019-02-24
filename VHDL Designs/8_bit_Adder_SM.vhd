-- 8 bit Adder
-- Structural Model
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Entity Decleration
entity Full_Adder_DF is
port(
		input1	: in std_logic;
		input2	: in std_logic;
		C_in	: in std_logic;
		Sum		: out std_logic;
		C_out	: out std_logic);
end Full_Adder_DF;

--Architecture Body
architecture F_A_Behavior of Full_Adder_DF is 
begin
		Sum 		<= ((input1 xor input2) xor C_in);
		C_out		<= ((input1 and input2) xor (input1 and C_in) xor (input2 and C_in));
end F_A_Behavior;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RC_Adder is
port(
		A_in	: in std_logic_vector(7 downto 0);
		B_in	: in std_logic_vector(7 downto 0);
		Carry_in: in std_logic;
		Sum_out	: out std_logic_vector(7 downto 0);
		Carry_out: out std_logic);
end RC_Adder;


architecture B_A_Behavior of RC_Adder is
	component Full_Adder_DF is
	port(
			input1	: in std_logic;
			input2	: in std_logic;
			C_in	: in std_logic;
			Sum	    : out std_logic;
			C_out	: out std_logic);
	end component;
signal Carry	: std_logic_vector(6 downto 0);
begin

U1:	Full_Adder_DF port map(A_in(0),B_in(0),Carry_in,Sum_out(0),Carry(0));
U2: for i in 1 to 6 generate
U3: Full_Adder_DF port map(A_in(i),B_in(i),Carry(i-1),Sum_out(i),Carry(i));
end generate;
U4: Full_Adder_DF port map(A_in(7),B_in(7),Carry(6),Sum_out(7),Carry_out);

end B_A_Behavior;
								 