LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY COUNTER_12BIT_TB IS
END COUNTER_12BIT_TB;
 
ARCHITECTURE behavior OF COUNTER_12BIT_TB IS 
 
    COMPONENT COUNTER_12BIT
    PORT(
		CLK,RST,Load : IN STD_LOGIC;
		DA : IN STD_LOGIC_VECTOR(11 downto 0);
		CNT_BCD : OUT STD_LOGIC_VECTOR(11 downto 0);
		
		SS_HEX_a : OUT STD_LOGIC_VECTOR(3 downto 1);
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
    END COMPONENT;
	 
   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal Load : std_logic := '0';
   signal DA : std_logic_vector(11 downto 0) := (others => '0');

 	--Outputs
	signal CNT_BCD : STD_LOGIC_VECTOR(11 downto 0);
		
	signal SS_HEX_a : STD_LOGIC_VECTOR(3 downto 1);
	signal SS_HEX_b : STD_LOGIC_VECTOR(3 downto 1);
	signal SS_HEX_c : STD_LOGIC_VECTOR(3 downto 1);
	signal SS_HEX_d : STD_LOGIC_VECTOR(3 downto 1);
	signal SS_HEX_e : STD_LOGIC_VECTOR(3 downto 1);
	signal SS_HEX_f : STD_LOGIC_VECTOR(3 downto 1);
	signal SS_HEX_g : STD_LOGIC_VECTOR(3 downto 1);

	signal SS_Decimal_a : STD_LOGIC_VECTOR(3 downto 1);
	signal SS_Decimal_b : STD_LOGIC_VECTOR(3 downto 1);
	signal SS_Decimal_c : STD_LOGIC_VECTOR(3 downto 1);
	signal SS_Decimal_d : STD_LOGIC_VECTOR(3 downto 1);
	signal SS_Decimal_e : STD_LOGIC_VECTOR(3 downto 1);
	signal SS_Decimal_f : STD_LOGIC_VECTOR(3 downto 1);
	signal SS_Decimal_g : STD_LOGIC_VECTOR(3 downto 1);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: COUNTER_12BIT PORT MAP (
          CLK => CLK,
			 RST => RST,
			 Load => Load,
			 DA => DA,
          CNT_BCD => CNT_BCD,
			 SS_HEX_a => SS_HEX_a,
			 SS_HEX_b => SS_HEX_b,
			 SS_HEX_c => SS_HEX_c,
			 SS_HEX_d => SS_HEX_d,
			 SS_HEX_e => SS_HEX_e,
			 SS_HEX_f => SS_HEX_f,
			 SS_HEX_g => SS_HEX_g,
			 SS_Decimal_a => SS_Decimal_a,
			 SS_Decimal_b => SS_Decimal_b,
			 SS_Decimal_c => SS_Decimal_c,
			 SS_Decimal_d => SS_Decimal_d,
			 SS_Decimal_e => SS_Decimal_e,
			 SS_Decimal_f => SS_Decimal_f,
			 SS_Decimal_g => SS_Decimal_g
        );
		  
	CLK <= not(CLK) after 10 ns;
	RST <= '1', '0' after 400 ns;
	DA <= x"000", x"02D" after 900 ns;
	Load <= '0', '1' after 920 ns, '0' after 1040 ns;


END;
