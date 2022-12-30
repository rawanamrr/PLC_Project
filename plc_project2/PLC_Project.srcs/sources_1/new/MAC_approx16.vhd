
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MAC_approx16 is
    Port ( x1,x2,x3,x4,x5 : in STD_LOGIC_VECTOR (15 downto 0);
           w1,w2,w3,w4,w5 : in STD_LOGIC_VECTOR (15 downto 0);
           bias : in STD_LOGIC_VECTOR (15 downto 0);
           macapproxout : out STD_LOGIC_VECTOR (34 downto 0));
end MAC_approx16;

architecture Behavioral of MAC_approx16 is

component approxMult_16x16 is
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

COMPONENT Adder_33Bits is
    Port ( x : in STD_LOGIC_VECTOR (32 downto 0);
           y : in STD_LOGIC_VECTOR (32 downto 0);
           cin : in STD_LOGIC;
           sum_out : out STD_LOGIC_VECTOR (32 downto 0);
           cout : out STD_LOGIC);
end COMPONENT;

COMPONENT Adder_34Bits is
    Port ( x : in STD_LOGIC_VECTOR (33 downto 0);
           y : in STD_LOGIC_VECTOR (33 downto 0);
           cin : in STD_LOGIC;
           sum_out : out STD_LOGIC_VECTOR (33 downto 0);
           cout : out STD_LOGIC);
end COMPONENT;

signal M1,M2,M3,M4,M5: std_logic_vector(31 downto 0);
signal sum1,sum2,sum3,sum4,sum5: std_logic_vector(31 downto 0);
signal cout,couttotal, temp2: std_logic;
signal c1,c2,c3,c4,c5,c331,c341: std_logic;
signal temp :std_logic_vector(31 downto 0);
signal sum331,temp1,temp3 :std_logic_vector(32 downto 0);
signal sum341,temp4,temp5 :std_logic_vector(33 downto 0);
signal sumtotal :std_logic_vector(34 downto 0);

begin
temp<="0000000000000000"&bias;
mult1: approxMult_16x16 port map(x1,w1,M1);
mult2: approxMult_16x16 port map(x2,w2,M2);
mult3: approxMult_16x16 port map(x3,w3,M3);
mult4: approxMult_16x16 port map(x4,w4,M4);
mult5: approxMult_16x16 port map(x5,w5,M5);




add1: Adder_32Bits port map(M1,M2,'0',sum1,c1);
add2: Adder_32Bits port map(M3,M4,'0',sum2,c2);
add3:Adder_32Bits port map(M5,temp,'0',sum3,c3);

temp1<=c1&sum1;
temp3<=c2&sum2;

add331: Adder_33bits port map(temp1,temp3,'0',sum331,c331);
temp4<='0'&c3&sum3;
temp5<=c331&sum331;
add341: Adder_34bits port map(temp4,temp5,'0',sum341,c341);

macapproxout<=c341&sum341;

end Behavioral;
