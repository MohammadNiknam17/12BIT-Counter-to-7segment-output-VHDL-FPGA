library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- common cathode 7Segment

entity Binary_To_7S_HEX is
	port (Binary: in std_logic_vector (3 downto 0);
			a,b,c,d,e,f,g: out std_logic);
end Binary_To_7S_HEX;

architecture Behavioral of Binary_To_7S_HEX is
signal TMP: std_logic_vector(6 downto 0);

begin

process(Binary)
begin
	case Binary is
		when "0000" => 
				TMP <= "1111110" ;	-- 0 HEX
		when "0001" => 
				TMP <= "0110000" ;	-- 1 HEX
		when "0010" => 
				TMP <= "1101101" ;	-- 2 HEX
		when "0011" => 
				TMP <= "1111001" ;	-- 3 HEX
		when "0100" => 
				TMP <= "0110011" ;	-- 4 HEX
		when "0101" => 
				TMP <= "1011011" ;	-- 5 HEX
		when "0110" => 
				TMP <= "1011111" ;	-- 6 HEX
		when "0111" => 	
				TMP <= "1110001" ;	-- 7 HEX
		when "1000" => 
				TMP <= "1111111" ;	-- 8 HEX
		when "1001" => 
				TMP <= "1110011" ;	-- 9 HEX
		when "1010" => 
				TMP <= "1110111" ;	-- A HEX
		when "1011" => 
				TMP <= "0011111" ;	-- B HEX
		when "1100" => 
				TMP <= "1001110" ;	-- C HEX
		when "1101" => 
				TMP <= "0111101" ;	-- D HEX
		when "1110" => 
				TMP <= "1001111" ;	-- E HEX
		when "1111" => 
				TMP <= "1000111" ;	-- F HEX
		when others => 
				TMP <= "0000000" ;
	end case;
end process;

a <= TMP(6);
b <= TMP(5);
c <= TMP(4);
d <= TMP(3);
e <= TMP(2);
f <= TMP(1);
g <= TMP(0);

end Behavioral;


