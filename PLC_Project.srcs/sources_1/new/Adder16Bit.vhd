

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Adder16Bit is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           cin : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
end Adder16Bit;


architecture Behavioral of Adder16Bit is
component fulladder is
port (  A,B,Cin : in STD_LOGIC;
S : out STD_LOGIC;
Cout : out STD_LOGIC);
end component;
signal c: std_logic_vector(16 downto 0);
begin

Adding: for i in 0 to 15 generate
uut: fulladder port map(A=>x(i),B=>y(i),Cin=>c(i),S=>s(i),Cout=>c(i+1));
end generate;

c(0)<=cin;
cout<= c(15);

end Behavioral;
