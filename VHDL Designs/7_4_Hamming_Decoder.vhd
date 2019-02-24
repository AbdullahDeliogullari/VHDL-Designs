library IEEE;
use IEEE.std_logic_1164.all;

entity SF_hamming_decoder is
port(
		encoded_data	: in std_logic_vector(6 downto 0);
		decoded_data	: out std_logic_vector(6 downto 0));
end SF_hamming_decoder;

architecture hamming_behavior of SF_hamming_decoder is
signal s0,s1,s2	: std_logic;
begin
		s0 <= ((encoded_data(6) xor encoded_data(5)) xor encoded_data(4)) xor encoded_data(2);
		s1 <= ((encoded_data(6) xor encoded_data(4)) xor encoded_data(3)) xor encoded_data(1);
		s2 <= ((encoded_data(6) xor encoded_data(5)) xor encoded_data(3)) xor encoded_data(0);
		
		Decoder : process(s0,s1,s2)
			begin
					if(s0 = '1' and s1 = '0' and s2 = '0') then
						decoded_data(6 downto 3) <= encoded_data(6 downto 3);
						decoded_data(2)	<= not encoded_data(2);
						decoded_data(1 downto 0) <= encoded_data(1 downto 0);
						
					elsif(s0 = '0' and s1 = '1' and s2 = '0') then
						decoded_data(6 downto 2) <= encoded_data(6 downto 2);
						decoded_data(1)	<= not encoded_data(1);
						decoded_data(0) <= encoded_data(0);
					
					elsif(s0 = '0' and s1 = '0' and s2 = '1') then
						decoded_data(6 downto 1) <= encoded_data(6 downto 1);
						decoded_data(0)	<= not encoded_data(0);
					
					elsif(s0 = '1' and s1 = '1' and s2 = '0') then
						decoded_data(6 downto 5) <= encoded_data(6 downto 5);
						decoded_data(4) <= not encoded_data(4);
						decoded_data(3 downto 0) <= encoded_data(3 downto 0);
					
					elsif(s0 = '1' and s1 = '0' and s2 = '1') then
						decoded_data(6) <= encoded_data(6);
						decoded_data(5) <= not encoded_data(5);
						decoded_data(4 downto 0) <= encoded_data(4 downto 0);
					
					elsif(s0 = '0' and s1 = '1' and s2 = '1') then
						decoded_data(6 downto 4) <= encoded_data(6 downto 4);
						decoded_data(3) <= not encoded_data(3);
						decoded_data(2 downto 0) <= encoded_data(2 downto 0);
					elsif(s0 = '1' and s1 = '1' and s2 = '1') then
						decoded_data(6) <= encoded_data(6);
						decoded_data(5 downto 0) <= encoded_data(5 downto 0);
					else
						decoded_data(6 downto 0) <= encoded_data(6 downto 0);
					end if;
		end process Decoder;
end hamming_behavior;
						
						
	