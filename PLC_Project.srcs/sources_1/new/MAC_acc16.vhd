
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MAC_acc16 is
    Port ( x1,x2,x3,x4,x5 : in STD_LOGIC_VECTOR (15 downto 0);
           w1,w2,w3,w4,w5 : in STD_LOGIC_VECTOR (15 downto 0);
           bias : in STD_LOGIC_VECTOR (15 downto 0);
           macaccout : out STD_LOGIC_VECTOR (32 downto 0));
end MAC_acc16;

architecture Behavioral of MAC_acc16 is

component accMult_16x16 is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           res : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Adder_32Bits is
    Port ( x : in STD_LOGIC_VECTOR (31 downto 0);
           y : in STD_LOGIC_VECTOR (31 downto 0);
           cin : in STD_LOGIC;
           sum_out : out STD_LOGIC_VECTOR (31 downto 0);
           cout : out STD_LOGIC);
end component;
signal M1,M2,M3,M4,M5: std_logic_vector(31 downto 0);
signal sum1,sum2,sum3,sum4,sum5,sumtotal: std_logic_vector(31 downto 0);
signal cout,couttotal: std_logic;
signal c1,c2,c3,c4,c5: std_logic;
signal temp :std_logic_vector(31 downto 0);

begin
temp<="0000000000000000"&bias;
mult1: accMult_16x16 port map(x1,w1,M1);
mult2: accMult_16x16 port map(x2,w2,M2);
mult3: accMult_16x16 port map(x3,w3,M3);
mult4: accMult_16x16 port map(x4,w4,M4);
mult5: accMult_16x16 port map(x5,w5,M5);



add1: Adder_32Bits port map(M1,M2,'0',sum1,c1);
add2: Adder_32Bits port map(M3,sum1,c1,sum2,c2);
add3:Adder_32Bits port map(sum2,M4,c2,sum3,c3);
add4:Adder_32Bits port map(sum3,M5,c3,sum4,c4);
add5:Adder_32Bits port map(sum4,temp,c4,sum5,c5);
macaccout<=c5&sum5;

end Behavioral;
