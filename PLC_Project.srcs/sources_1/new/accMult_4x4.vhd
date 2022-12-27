

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity accMult_4x4 is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0));
end accMult_4x4;

architecture Behavioral of accMult_4x4 is
component accMult_2x2 is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           res : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Adder_4bit is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           cin: in std_logic;
           sum_out : out STD_LOGIC_VECTOR (3 downto 0);
           cout: out std_logic);
end component;


component FA is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           c_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           c_out : out STD_LOGIC);
end component;

signal P1,P2,P3,P4: std_logic_vector(3 downto 0);
signal subL1: std_logic_vector(6 downto 0);
signal subL2: std_logic_vector(7 downto 0);
signal temp1,temp2: std_logic_vector(3 downto 0);
signal sum1,sum2: std_logic_vector(3 downto 0);
signal cout1,cout2,cout3: std_logic;
signal res_sig: std_logic_vector(7 downto 0);

begin

mult1: accMult_2x2 port map(x(1 downto 0),y(1 downto 0),P1);
mult2: accMult_2x2 port map(x(3 downto 2),y(1 downto 0),P2);
mult3: accMult_2x2 port map(x(1 downto 0),y(3 downto 2),P3);
mult4: accMult_2x2 port map(x(3 downto 2),y(3 downto 2),P4);
-----------------------sublevel1-------------------
temp1<="00"&P1(3 downto 2);
Adder4Bit_1: Adder_4bit port map(P2,temp1,'0',sum1,cout1);--could be optimized by usuing two FAs only
subL1(1 downto 0)<=P1(1 downto 0);
subL1(5 downto 2)<=sum1;
subL1(6)<=cout1;
-------------------------------------------------------

---------------------sublevel2----------------------
Adder4Bit_2: Adder_4bit port map(subL1(5 downto 2),P3,'0',sum2,cout2);
FA1: FA port map(cout2,subL1(6),'0',subL2(6),subL2(7));
subL2(5 downto 2)<=sum2;
subL2(1 downto 0)<=subL1(1 downto 0);
----------------------------------------------------

Adder4Bit_3: Adder_4bit port map(subL2(7 downto 4),P4,'0',res_sig(7 downto 4),cout3);
res_sig(3 downto 0)<= subL2(3 downto 0);

res<=res_sig;

end Behavioral;
