library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY COUNTER_12BIT IS
	port(
		CLK,RST,Load : IN STD_LOGIC;
		DA : IN STD_LOGIC_VECTOR(11 downto 0);
		CNT_BCD : OUT STD_LOGIC_VECTOR(11 downto 0);
		
		SS_HEX_a : OUT STD_LOGIC_VECTOR(3 downto 1);          -- SS=7Segment
		SS_HEX_b : OUT STD_LOGIC_VECTOR(3 downto 1);
		SS_HEX_c : OUT STD_LOGIC_VECTOR(3 downto 1);
		SS_HEX_d : OUT STD_LOGIC_VECTOR(3 downto 1);
		SS_HEX_e : OUT STD_LOGIC_VECTOR(3 downto 1);
		SS_HEX_f : OUT STD_LOGIC_VECTOR(3 downto 1);
		SS_HEX_g : OUT STD_LOGIC_VECTOR(3 downto 1);
		
		SS_Decimal_a : OUT STD_LOGIC_VECTOR(3 downto 1);
		SS_Decimal_b : OUT STD_LOGIC_VECTOR(3 downto 1);
		SS_Decimal_c : OUT STD_LOGIC_VECTOR(3 downto 1);
		SS_Decimal_d : OUT STD_LOGIC_VECTOR(3 downto 1);
		SS_Decimal_e : OUT STD_LOGIC_VECTOR(3 downto 1);
		SS_Decimal_f : OUT STD_LOGIC_VECTOR(3 downto 1);
		SS_Decimal_g : OUT STD_LOGIC_VECTOR(3 downto 1));
		
END COUNTER_12BIT;

ARCHITECTURE Behavioral of COUNTER_12BIT is
	signal TMP1 : unsigned(11 downto 0);
	signal TMP2 : unsigned(11 downto 0);

	component  Binary_To_7S_HEX is
		port (Binary: in std_logic_vector (3 downto 0);
				a,b,c,d,e,f,g: out std_logic);
	end component;

	component BCD_To_7S_Decimal is
	port (bcd: in std_logic_vector (3 downto 0);
			a,b,c,d,e,f,g: out std_logic);
	end component;

begin

Counter_proc: process(CLK)
begin
if(CLK'event and CLK='1')then
	if(RST='1')then
		TMP1 <= (others => '0');
	elsif(Load='1')then
		TMP1 <= unsigned(DA);
	elsif(TMP1="001111100111")then
		TMP1 <= (others => '0');	
	else 
		TMP1 <= TMP1+"000000000001";	
	end if;
end if;
end process;


binary_to_bcd_proc: process(TMP1)
	variable bcd: unsigned(11 downto 0); --bcd vector, with 4 bits for each display
	variable TMP: unsigned(11 downto 0); --auxiliary vector, to copy the input and operate with It
        
	begin
		bcd := (others => '0');      -- ADDED for EVERY CONVERSION
		TMP := TMP1;                 -- ADDED for EVERY CONVERSION
    
		for i in 0 to 11 loop
        
			--bit shifting. Copy the bint MSB in the bcd LSB
			bcd(11 downto 0) := bcd(10 downto 0) & TMP(11);
			TMP(11 downto 0) := TMP(10 downto 0) & '0';

			if i < 11 and bcd(3 downto 0) > "0100" then
				bcd(3 downto 0) := bcd(3 downto 0) + 3;
			end if;
			if i < 11 and bcd(7 downto 4) > "0100" then
				bcd(7 downto 4) := bcd(7 downto 4) + 3;
			end if;
			if i < 11 and bcd(11 downto 8) > "0100" then
				bcd(11 downto 8) := bcd(11 downto 8) + 3;
			end if;
			
			TMP2 <= bcd;
        end loop;	
end process;

CNT_BCD <= std_logic_vector(TMP2);

Binary_To_7S_HEX_1 : Binary_To_7S_HEX port map(Binary=>std_logic_vector(TMP1(3 downto 0)), a=>SS_HEX_a(1), b=>SS_HEX_b(1) ,c=>SS_HEX_c(1) , d=>SS_HEX_d(1), e=>SS_HEX_e(1), f=>SS_HEX_f(1), g=>SS_HEX_g(1));
Binary_To_7S_HEX_2 : Binary_To_7S_HEX port map(Binary=>std_logic_vector(TMP1(7 downto 4)), a=>SS_HEX_a(2), b=>SS_HEX_b(2) ,c=>SS_HEX_c(2) , d=>SS_HEX_d(2), e=>SS_HEX_e(2), f=>SS_HEX_f(2), g=>SS_HEX_g(2));
Binary_To_7S_HEX_3 : Binary_To_7S_HEX port map(Binary=>std_logic_vector(TMP1(11 downto 8)), a=>SS_HEX_a(3), b=>SS_HEX_b(3) ,c=>SS_HEX_c(3) , d=>SS_HEX_d(3), e=>SS_HEX_e(3), f=>SS_HEX_f(3), g=>SS_HEX_g(3));

BCD_To_7S_Decimal_1 : BCD_To_7S_Decimal port map(BCD => std_logic_vector(TMP2(3 downto 0)), a=>SS_Decimal_a(1), b=>SS_Decimal_b(1), c=>SS_Decimal_c(1), d=>SS_Decimal_d(1), e=>SS_Decimal_e(1), f=>SS_Decimal_f(1), g=>SS_Decimal_g(1));
BCD_To_7S_Decimal_2 : BCD_To_7S_Decimal port map(BCD => std_logic_vector(TMP2(7 downto 4)), a=>SS_Decimal_a(2), b=>SS_Decimal_b(2), c=>SS_Decimal_c(2), d=>SS_Decimal_d(2), e=>SS_Decimal_e(2), f=>SS_Decimal_f(2), g=>SS_Decimal_g(2));
BCD_To_7S_Decimal_3 : BCD_To_7S_Decimal port map(BCD => std_logic_vector(TMP2(11 downto 8)), a=>SS_Decimal_a(3), b=>SS_Decimal_b(3), c=>SS_Decimal_c(3), d=>SS_Decimal_d(3), e=>SS_Decimal_e(3), f=>SS_Decimal_f(3), g=>SS_Decimal_g(3));

end Behavioral;