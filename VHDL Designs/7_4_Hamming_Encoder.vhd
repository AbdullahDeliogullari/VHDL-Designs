library IEEE;
use IEEE.std_logic_1164.all;

entity SF_hamming_encoder is
port(
		input_data	: in std_logic_vector(3 downto 0);
		hamming_out	: out std_logic_vector(6 downto 0));
end SF_hamming_encoder;

architecture hamming_behavior of SF_hamming_encoder is
signal p0,p1,p2	: std_logic;
begin
	p0 <= (input_data(3) xor input_data(2)) xor input_data(0);
	p1 <= (input_data(3) xor input_data(1)) xor input_data(0);
	p2 <= (input_data(2) xor input_data(1)) xor input_data(0);
	
	hamming_out(2 downto 0) <= (p2,p1,p0);
	hamming_out(6 downto 3) <= input_data(3 downto 0);
	
end hamming_behavior;