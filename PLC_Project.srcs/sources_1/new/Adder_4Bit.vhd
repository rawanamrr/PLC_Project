
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;


entity Adder_4bit is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           cin: in std_logic;
           sum_out : out STD_LOGIC_VECTOR (3 downto 0);
           cout: out std_logic);
          
end Adder_4bit;

architecture Behavioral of Adder_4bit is
component FA is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           c_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           c_out : out STD_LOGIC);
end component;

signal cin_sig : std_logic_vector(4 downto 0);
signal sum_sig : std_logic_vector(3 downto 0);
begin
cin_sig(0)<= cin;

addr:for i in 0 to 3 generate 

adder1: FA Port map(x(i),y(i),cin_sig(i),sum_sig(i),cin_sig(i+1));

end generate;
cout<=cin_sig(4);
sum_out<=sum_sig;

end Behavioral;

