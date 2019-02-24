library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity simple_alu is
port(
		input1:	in signed(7 downto 0);
		input2:	in signed(7 downto 0);
		SEL:	in std_logic_vector(2 downto 0);
		output:	out signed(7 downto 0));
end simple_alu;

architecture behavior_alu of simple_alu is
		begin
			process(input1,input2,SEL)
				begin
					case SEL is
						when "000" => output <= input1 + input2;  -- addition
						when "001" => output <= input1 - input2;  -- substraction
						when "010" => output <= input1 - 1;       -- substraction 1
						when "011" => output <= input1 + 1;       -- addition 1
						when "100" => output <= input1 and input2;-- AND gate
						when "101" => output <= input1 or input2; -- OR gate
						when "110" => output <= not input1;       -- NOT gate
						when "111" => output <= input1 xor input2;-- XOR gate
						when others => NULL;
					end case;
			end process;		
end behavior_alu;
						
