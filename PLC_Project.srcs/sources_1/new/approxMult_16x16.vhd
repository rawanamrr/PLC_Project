

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity approxMult_16x16 is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           res : out STD_LOGIC_VECTOR (31 downto 0));
end approxMult_16x16;

architecture Behavioral of approxMult_16x16 is

component approxMult_8x8 is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component Adder_16bit is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           cin : in STD_LOGIC;
           sum_out : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
end component;

component FA is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           c_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           c_out : out STD_LOGIC);
end component;

signal P1,P2,P3,P4: std_logic_vector(15 downto 0);
signal subL1: std_logic_vector(24 downto 0);
signal subL2: std_logic_vector(25 downto 0);
signal temp1,temp2: std_logic_vector(15 downto 0);
signal cout1,coutthrow: std_logic;
signal res_sig: std_logic_vector(31 downto 0);

begin

--get partial products first
mult1: approxMult_8x8 port map(x(7 downto 0),y(7 downto 0),P1);
mult2: approxMult_8x8 port map(x(15 downto 8),y(7 downto 0),P2);
mult3: approxMult_8x8 port map(x(7 downto 0),y(15 downto 8),P3);
mult4: approxMult_8x8 port map(x(15 downto 8),y(15 downto 8),P4);


-----------------------sublevel1-------------------
--add P1 with p2
temp1 <= "00000000" & P1(15 downto 8);
ADDSUB1: Adder_16bit port map(temp1,P2,'0',subL1(23 downto 8),subL1(24));
--za7la2ny
subL1(7 downto 0) <= P1(7 downto 0);
--subL1 complete
-----------------------sublevel1-------------------

-----------------------sublevel2-------------------
--add p3 subL1
ADDSUB2: Adder_16bit port map(subL1(23 downto 8),P3,'0',subL2(23 downto 8),cout1);
--take cout and add with FA
KAMEL16ADD: FA port map(subL1(24),cout1,'0',subL2(24),subL2(25));
subL2(7 downto 0) <= subL1(7 downto 0);
--subL2 complete
-----------------------sublevel2-------------------

-----------------------res-------------------------
temp2 <= "000000" & subL2(25 downto 16);
ADDNOSRES: Adder_16bit port map(temp2,P4,'0',res_sig(31 downto 16),coutthrow);
--ignore coutthrow

--za7la2ny
res_sig(15 downto 0) <= subL2(15 downto 0);

res <= res_sig;







end Behavioral;
