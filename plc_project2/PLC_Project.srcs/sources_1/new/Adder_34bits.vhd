

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder_34Bits is
    Port ( x : in STD_LOGIC_VECTOR (33 downto 0);
           y : in STD_LOGIC_VECTOR (33 downto 0);
           cin : in STD_LOGIC;
           sum_out : out STD_LOGIC_VECTOR (33 downto 0);
           cout : out STD_LOGIC);
end Adder_34Bits;

architecture Behavioral of Adder_34Bits is
component FA is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           c_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           c_out : out STD_LOGIC);
end component;
signal cin_sig : std_logic_vector(34 downto 0);
signal sum_sig : std_logic_vector(33 downto 0);
begin
cin_sig(0)<= cin;

addr:for i in 0 to 33 generate 

adder1: FA Port map(x(i),y(i),cin_sig(i),sum_sig(i),cin_sig(i+1));

end generate;
cout<=cin_sig(34);
sum_out<=sum_sig;

end Behavioral;