

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

Component accMult_8x8v1 is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (15 downto 0));
end COMPONENT;

component CLA_16bit is
  port (
    x  : in std_logic_vector(15 downto 0);
    y  : in std_logic_vector(15 downto 0);
    cin : in std_logic;
    gout: out std_logic;
    pout: out std_logic;
    cout : out std_logic;
    res   : out std_logic_vector(15 downto 0));
end component;

component SkipADD_16bit is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           cin: in std_logic;
           res : out STD_LOGIC_VECTOR (15 downto 0);
           cout: out std_logic);
end component;

signal M1,M2: std_logic_vector(15 downto 0);
signal sum,sumtotal: std_logic_vector(15 downto 0);
signal cout,couttotal: std_logic;
signal temp :std_logic_vector(15 downto 0);
signal gout,pout,gout2,pout2: std_logic;
begin

temp<="00000000"&bias;
mult1: accMult_8x8v1 port map(x1,w1,M1);
mult2: accMult_8x8v1 port map(x2,w2,M2);

--sum1: CLA_16bit port map(M1,M2,'0',gout,pout,cout,sum);
--sum2: CLA_16bit port map(sum,temp,'0',gout,pout,couttotal,sumtotal);

sum1: SkipADD_16bit port map(M1,M2,'0',sum,cout);
sum2: SkipADD_16bit port map(sum,temp,'0',sumtotal,couttotal);

macaccout<=cout&sumtotal; 

end Behavioral;
