----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/27/2022 12:44:10 AM
-- Design Name: 
-- Module Name: accMult8x8from2x2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity accMult8x8from2x2 is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           result : out STD_LOGIC_VECTOR (15 downto 0));
end accMult8x8from2x2;

architecture Behavioral of accMult8x8from2x2 is

component accMult_2x2 is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           res : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component FA is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           c_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           c_out : out STD_LOGIC);
end component;

component Adder_4bit is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           cin: in std_logic;
           sum_out : out STD_LOGIC_VECTOR (3 downto 0);
           cout: out std_logic);
end component;

component Adder_8bit is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
       y : in STD_LOGIC_VECTOR (7 downto 0);
       cin: in std_logic;
       sum_out : out STD_LOGIC_VECTOR (7 downto 0);
       cout: out std_logic);
end component;

signal P1,P2,P3,P4: std_logic_vector (7 downto 0);
signal P11,P12,P13,P14 : std_logic_vector (3 downto 0);
signal subL11,subL21,subL31,subL41: std_logic_vector (6 downto 0);
signal subL12,subL22,subL32,subL42: std_logic_vector(7 downto 0);
signal cout12,cout22,cout32,cout42,coutthrow :std_logic;
signal P21,P22,P23,P24 : std_logic_vector (3 downto 0);
signal P31,P32,P33,P34 : std_logic_vector (3 downto 0);
signal P41,P42,P43,P44 : std_logic_vector (3 downto 0);
signal temp11,temp21,temp31,temp41: std_logic_vector (3 downto 0);
signal res_sig: std_logic_vector (15 downto 0);
--signals for wallace
signal walla1:std_logic_vector (7 downto 0);
signal walla2:std_logic_vector (11 downto 0);
signal coutwalla:std_logic_vector (3 downto 0);

begin

--First take AL x BL to get 1 partial from 7 downto 0

mult11: accMult_2x2 port map(x(1 downto 0),y(1 downto 0),P11);
mult12: accMult_2x2 port map(x(3 downto 2),y(1 downto 0),P12);
mult13: accMult_2x2 port map(x(1 downto 0),y(3 downto 2),P13);
mult14: accMult_2x2 port map(x(3 downto 2),y(3 downto 2),P14);

-------------------------- sublevel 1 of 1 -----------------------------
temp11 <= "00" & P11(3 downto 2);
ADDSUB11: Adder_4bit port map(temp11,P12,'0',subL11(5 downto 2),subL11(6));
subL11(1 downto 0) <= P11(1 downto 0);
-------------------------- sublevel 1 of 1 -----------------------------

-------------------------- sublevel 1 of 2-----------------------------
ADDSUB12: Adder_4bit port map(subL11(5 downto 2),P13,'0',subL12(5 downto 2),cout12);
KAMELADD12: FA port map(cout12,subL11(6),'0',subL12(6),subL12(7));
subL12(1 downto 0) <= subL11(1 downto 0);
-------------------------- sublevel 1 of 2-----------------------------

-------------------------- 1st 8 by 8 partial-----------------------------
ADDNOSP1: Adder_4bit port map(subL12(7 downto 4),P14,'0',P1(7 downto 4),coutthrow);
P1(3 downto 0) <= subL12(3 downto 0);
-------------------------- 1st 8 by 8 partial-----------------------------
--first partial is now ready


-------------------------------------------------------------------------------------------------------------------


--second take AH x BL to get 2 partial from 11 downto 4
mult21: accMult_2x2 port map(x(5 downto 4),y(1 downto 0),P21);
mult22: accMult_2x2 port map(x(7 downto 6),y(1 downto 0),P22);
mult23: accMult_2x2 port map(x(5 downto 4),y(3 downto 2),P23);
mult24: accMult_2x2 port map(x(7 downto 6),y(3 downto 2),P24);

-------------------------- sublevel 2 of 1 -----------------------------
temp21 <= "00" & P21(3 downto 2);
ADDSUB21: Adder_4bit port map(temp21,P22,'0',subL21(5 downto 2),subL21(6));
subL21(1 downto 0) <= P21(1 downto 0);
-------------------------- sublevel 2 of 1 -----------------------------

-------------------------- sublevel 2 of 2-----------------------------
ADDSUB22: Adder_4bit port map(subL21(5 downto 2),P23,'0',subL22(5 downto 2),cout22);
KAMELADD22: FA port map(cout22,subL21(6),'0',subL22(6),subL22(7));
subL22(1 downto 0) <= subL21(1 downto 0);
-------------------------- sublevel 2 of 2-----------------------------

-------------------------- 2nd 8 by 8 partial-----------------------------
ADDNOSP2: Adder_4bit port map(subL22(7 downto 4),P24,'0',P2(7 downto 4),coutthrow);
P2(3 downto 0) <= subL22(3 downto 0);
-------------------------- 2nd 8 by 8 partial-----------------------------

--second partial is now ready


-------------------------------------------------------------------------------------------------------------------

--third take AL by BH to get 3 partial from 11 downto 4
mult31: accMult_2x2 port map(x(1 downto 0),y(5 downto 4),P31);
mult32: accMult_2x2 port map(x(3 downto 2),y(5 downto 4),P32);
mult33: accMult_2x2 port map(x(1 downto 0),y(7 downto 6),P33);
mult34: accMult_2x2 port map(x(3 downto 2),y(7 downto 6),P34);

-------------------------- sublevel 3 of 1 -----------------------------
temp31 <= "00" & P31(3 downto 2);
ADDSUB31: Adder_4bit port map(temp31,P32,'0',subL31(5 downto 2),subL31(6));
subL31(1 downto 0) <= P31(1 downto 0);
-------------------------- sublevel 3 of 1 -----------------------------

-------------------------- sublevel 3 of 2-----------------------------
ADDSUB32: Adder_4bit port map(subL31(5 downto 2),P33,'0',subL32(5 downto 2),cout32);
KAMELADD32: FA port map(cout32,subL31(6),'0',subL32(6),subL32(7));
subL32(1 downto 0) <= subL31(1 downto 0);
-------------------------- sublevel 3 of 2-----------------------------

-------------------------- 3rd 8 by 8 partial-----------------------------
ADDNOSP3: Adder_4bit port map(subL32(7 downto 4),P34,'0',P3(7 downto 4),coutthrow);
P3(3 downto 0) <= subL32(3 downto 0);
-------------------------- 3rd 8 by 8 partial-----------------------------

--third partial is now ready


-------------------------------------------------------------------------------------------------------------------


--fourth take AL by BH to get 3 partial from 15 downto 8
mult41: accMult_2x2 port map(x(5 downto 4),y(5 downto 4),P41);
mult42: accMult_2x2 port map(x(7 downto 6),y(5 downto 4),P42);
mult43: accMult_2x2 port map(x(5 downto 4),y(7 downto 6),P43);
mult44: accMult_2x2 port map(x(7 downto 6),y(7 downto 6),P44);

-------------------------- sublevel 4 of 1 -----------------------------
temp41 <= "00" & P41(3 downto 2);
ADDSUB41: Adder_4bit port map(temp41,P42,'0',subL41(5 downto 2),subL41(6));
subL41(1 downto 0) <= P41(1 downto 0);
-------------------------- sublevel 4 of 1 -----------------------------

-------------------------- sublevel 4 of 2-----------------------------
ADDSUB42: Adder_4bit port map(subL41(5 downto 2),P43,'0',subL42(5 downto 2),cout42);
KAMELADD42: FA port map(cout42,subL41(6),'0',subL42(6),subL42(7));
subL42(1 downto 0) <= subL41(1 downto 0);
-------------------------- sublevel 4 of 2-----------------------------

-------------------------- 4th 8 by 8 partial-----------------------------
ADDNOSP4: Adder_4bit port map(subL42(7 downto 4),P44,'0',P4(7 downto 4),coutthrow);
P4(3 downto 0) <= subL42(3 downto 0);
-------------------------- 4th 8 by 8 partial-----------------------------

--fourth partial is now ready

--add P1,P2 4 shift,P3 4 shift and P4 8 shift to get 16 out
--I will try 4 generate to do same above
--most likely wont work due to partials port map


-------------------------------------------------------------------------------------------------------------------

--after getting all P we should add all P s using wallace or dadda
--drop the first 4
res_sig(3 downto 0) <= P1(3 downto 0);

--use wallace

--add first 4 using 4 FA
addfirstpart:for i in 0 to 3 generate 
Walgen1: FA port map(P1(i+4),P2(i),P3(i),walla2(i),walla1(i));
end generate;

--add second 4 using 4 FA
addsecondpart:for i in 4 to 7 generate 
Walgen2: FA port map(P2(i),P3(i),P4(i-4),walla2(i),walla1(i));
end generate;

--add carry of last FA to P4 4 bit and use carry in last addition
--Wallastadd: FA port map(walla1(7),P4(4),'0',walla2(8),coutthrow);

--drop the last 4 bits
walla2(11 downto 8) <= P4(7 downto 4);

--add the two numbers after simplyfing to only 2 numbers using 8 bit adder
--remember first 4 bits are already dropped

--first in walla without add
res_sig(4) <= walla2(0);

--8 bits after using 8 bit adder
addwallaces: Adder_8bit port map(walla1(7 downto 0),walla2(8 downto 1),'0',res_sig(12 downto 5),coutwalla(0));

--add carries in last part

addlastpart:for i in 0 to 2 generate 
Waladdcarry: FA port map(coutwalla(i),walla2(i+9),'0',res_sig(i+13),coutwalla(i+1));
end generate;

result <= res_sig;

end Behavioral;
