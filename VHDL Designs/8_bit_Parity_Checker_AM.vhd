library IEEE;
use IEEE.std_logic_1164.all;

entity Parity_Checker_AM is
port(
		input	: in std_logic_vector(7 downto 0);
		even	: out std_logic;
		odd		: out std_logic);	
end Parity_Checker_AM;

architecture Behavior_PC of Parity_Checker_AM is
begin
	process(input)
		variable sum,parity	: integer;
	begin
		sum := 0;
		for i in 7 downto 0 loop
			if input(i) = '1' then
				sum := sum + 1;
			end if;
		end loop;
		parity := sum mod 2;
		if(parity = 0) then
			even <= '1';
			odd	 <= '0';
		else
			even <= '0';
			odd  <= '1';
		end if;
	end process;
end Behavior_PC;

-- TestBench

library IEEE;
use ieee.std_logic_1164.all;

entity parity_checker_testbench is
end parity_checker_testbench;

architecture behavior_tb of parity_checker_testbench is
	component Parity_Checker_AM
		port(
			input	: in std_logic_vector(7 downto 0);
			even	: out std_logic;
			odd		: out std_logic);	
end component;

signal test_in	: std_logic_vector(7 downto 0);
signal test_out	: std_logic_vector(1 downto 0);

begin
	UNIT1	: Parity_Checker_AM
		port map(test_in,test_out(0),test_out(1));
	process
	begin
		test_in <= "00000000";
		wait for 200 ns;
		test_in <= "00000001";
		wait for 200 ns;
		test_in <= "00000011";
		wait for 200 ns;
		test_in <= "11111000";
		wait for 200 ns;
		test_in <= "10011111";
		wait for 200 ns;
	end process;
	
	process
		variable error_status : boolean;
	begin
		wait on test_in;
		wait for 100 ns;
		if(	(test_in = "00000000" and test_out(0) = '1' and test_out(1) = '0') or
			(test_in = "00000001" and test_out(0) = '0' and test_out(1) = '1') or
			(test_in = "00000011" and test_out(0) = '1' and test_out(1) = '0') or
			(test_in = "11111000" and test_out(0) = '0' and test_out(1) = '1') or
			(test_in = "10011111" and test_out(0) = '1' and test_out(1) = '0'))
		then
			error_status := false;
		else
			error_status := true;
		end if;
		
		assert not error_status
			report "testfailed" severity note;
	end process;
end behavior_tb;