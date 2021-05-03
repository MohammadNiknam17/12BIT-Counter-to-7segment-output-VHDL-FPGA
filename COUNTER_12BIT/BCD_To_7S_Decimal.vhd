library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- common cathode 7Segment

entity BCD_To_7S_Decimal is
	port (bcd: in std_logic_vector (3 downto 0);
			a,b,c,d,e,f,g: out std_logic);
end BCD_To_7S_Decimal;

architecture Behavioral of BCD_To_7S_Decimal is
signal TMP: std_logic_vector(6 downto 0);

begin

process(bcd)
begin
	case bcd is
		when "0000" => 
				TMP <= "1111110" ;	-- 0 decimal
		when "0001" => 
				TMP <= "0110000" ;	-- 1 Decimal
		when "0010" => 
				TMP <= "1101101" ;	-- 2 Decimal
		when "0011" => 
				TMP <= "1111001" ;	-- 3 Decimal
		when "0100" => 
				TMP <= "0110011" ;	-- 4 Decimal
		when "0101" => 
				TMP <= "1011011" ;	-- 5 Decimal
		when "0110" => 
				TMP <= "1011111" ;	-- 6 Decimal
		when "0111" => 	
				TMP <= "1110001" ;	-- 7 Decimal
		when "1000" => 
				TMP <= "1111111" ;	-- 8 Decimal
		when "1001" => 
				TMP <= "1110011" ;	-- 9 Decimal
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


