

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MAC_acc is
    Port ( x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           w1 : in STD_LOGIC_VECTOR (7 downto 0);
           w2 : in STD_LOGIC_VECTOR (7 downto 0);
           bias : in STD_LOGIC_VECTOR (7 downto 0);
           macaccout : out STD_LOGIC_VECTOR (16 downto 0));
end MAC_acc;

architecture Behavioral of MAC_acc is

COMPONENT multiplieraccurate88 is
    Port ( X : in STD_LOGIC_VECTOR (7 downto 0);
           Y : in STD_LOGIC_VECTOR (7 downto 0);
           outm : out STD_LOGIC_VECTOR (15 downto 0));
end COMPONENT;


COMPONENT Adder_16bit is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           cin : in STD_LOGIC;
           sum_out : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
end COMPONENT;

signal M1,M2: std_logic_vector(15 downto 0);
signal sum,sumtotal: std_logic_vector(15 downto 0);
signal cout,couttotal: std_logic;
signal temp :std_logic_vector(15 downto 0);
begin

temp<="00000000"&bias;
mult1: multiplieraccurate88 port map(x1,w1,M1);
mult2: multiplieraccurate88 port map(x2,w2,M2);

sum1: Adder_16bit port map(M1,M2,'0',sum,cout);
sum2: Adder_16bit port map(sum,temp,'0',sumtotal,couttotal);


macaccout<=cout&sumtotal; 

end Behavioral;
