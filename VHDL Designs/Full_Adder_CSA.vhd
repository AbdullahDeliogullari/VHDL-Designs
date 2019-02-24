library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Decleration
entity Full_Adder_CSA is
port(
		input1	: in std_logic;
		input2	: in std_logic;
		C_in	: in std_logic;
		C_out	: out std_logic;
		output_data  : out std_logic_vector(1 downto 0));
end Full_Adder_CSA;

--Architecture Body
architecture F_A_Behavior of Full_Adder_CSA is
signal input_data : std_logic_vector(2 downto 0); -- local bundle

begin
input_data <= (input1 & input2 & C_in);

with input_data select
	output_data <=	"00" when "000",
			"01" when "001" | "010" | "100",
			"11" when "111",
			"10" when "011" | "101" | "110",
			"00" when others;
end F_A_Behavior;
