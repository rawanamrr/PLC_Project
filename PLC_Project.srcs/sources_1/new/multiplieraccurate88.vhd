

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplieraccurate88 is
    Port ( X : in STD_LOGIC_VECTOR (7 downto 0);
           Y : in STD_LOGIC_VECTOR (7 downto 0);
           outm : out STD_LOGIC_VECTOR (15 downto 0));
end multiplieraccurate88;

architecture Behavioral of multiplieraccurate88 is

COMPONENT Accurate is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

COMPONENT Adder_16bit is
           Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           cin : in STD_LOGIC;
           sum_out : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
end COMPONENT;


signal outm1 :  STD_LOGIC_VECTOR (3 downto 0);
signal outm2 :  STD_LOGIC_VECTOR (3 downto 0);
signal temp1 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal temp2 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal sum1 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal cout1 :  STD_LOGIC;
-----------------------------------------------------------------------------
signal outm3 :  STD_LOGIC_VECTOR (3 downto 0);
signal outm4 :  STD_LOGIC_VECTOR (3 downto 0);
signal temp3 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal temp4 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal sum2 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal cout2 :  STD_LOGIC;
-------------------------------------------------------------------------------
signal sumt1 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal coutt1 :  STD_LOGIC;
------------------------------------------------------------------------------

signal outm5 :  STD_LOGIC_VECTOR (3 downto 0);
signal outm6 :  STD_LOGIC_VECTOR (3 downto 0);
signal temp5 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal temp6 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal sum3 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal cout3 :  STD_LOGIC;
-----------------------------------------------------------------------------
signal outm7 :  STD_LOGIC_VECTOR (3 downto 0);
signal outm8 :  STD_LOGIC_VECTOR (3 downto 0);
signal temp7 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal temp8 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal sum4 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal cout4 :  STD_LOGIC;
-------------------------------------------------------------------------------
signal sumt2 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal coutt2 :  STD_LOGIC;
signal sumtt1 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal couttt1 :  STD_LOGIC;

------------------------------------------------------------------------------

signal outm9 :  STD_LOGIC_VECTOR (3 downto 0);
signal outm10 :  STD_LOGIC_VECTOR (3 downto 0);
signal temp9 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal temp10 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal sum5 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal cout5 :  STD_LOGIC;
-----------------------------------------------------------------------------
signal outm11 :  STD_LOGIC_VECTOR (3 downto 0);
signal outm12 :  STD_LOGIC_VECTOR (3 downto 0);
signal temp11 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal temp12 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal sum6 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal cout6 :  STD_LOGIC;
-------------------------------------------------------------------------------
signal sumt3 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal coutt3 :  STD_LOGIC;
signal sumtt2 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal couttt2 :  STD_LOGIC;

------------------------------------------------------------------------------

signal outm13 :  STD_LOGIC_VECTOR (3 downto 0);
signal outm14 :  STD_LOGIC_VECTOR (3 downto 0);
signal temp13 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal temp14 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal sum7 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal cout7 :  STD_LOGIC;
-----------------------------------------------------------------------------
signal outm15 :  STD_LOGIC_VECTOR (3 downto 0);
signal outm16 :  STD_LOGIC_VECTOR (3 downto 0);
signal temp15 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal temp16 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal sum8 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal cout8 :  STD_LOGIC;
-------------------------------------------------------------------------------
signal sumt4 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal coutt4 :  STD_LOGIC;
signal sumtt3 :  STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
signal couttt3 :  STD_LOGIC;



begin

-------------------------------------------------------------------
a1: Accurate port map(X(1 downto 0),Y(1 downto 0), outm1);
a2: Accurate port map(X(3 downto 2),Y(1 downto 0), outm2);

temp1(3 downto 0)<= outm1;
temp2(5 downto 2)<= outm2;

add1: Adder_16bit port map(temp1,temp2,'0',sum1,cout1);

----------------------------------------------------------------------
a3: Accurate port map(X(5 downto 4),Y(1 downto 0), outm3);
a4: Accurate port map(X(7 downto 6),Y(1 downto 0), outm4);

temp3(7 downto 4)<= outm3;
temp4(9 downto 6)<= outm4;

add2: Adder_16bit port map(temp3,temp4,'0',sum2,cout2);
add3: Adder_16bit port map(sum1,sum2,'0',sumt1,coutt1);

-----------------------------------------------------------------------
a5: Accurate port map(X(1 downto 0),Y(3 downto 2), outm5);
a6: Accurate port map(X(3 downto 2),Y(3 downto 2), outm6);

temp5(5 downto 2)<= outm5;
temp6(7 downto 4)<= outm6;

add4: Adder_16bit port map(temp5,temp6,'0',sum3,cout3);

-----------------------------------------------------------------------
a7: Accurate port map(X(5 downto 4),Y(3 downto 2), outm7);
a8: Accurate port map(X(7 downto 6),Y(3 downto 2), outm8);

temp7(9 downto 6)<= outm7;
temp8(11 downto 8)<= outm8;

add5: Adder_16bit port map(temp7,temp8,'0',sum4,cout4);
add6: Adder_16bit port map(sum3,sum4,'0',sumt2,coutt2);

add7: Adder_16bit port map(sumt1,sumt2,'0',sumtt1,couttt1);

-----------------------------------------------------------------------
a9: Accurate port map(X(1 downto 0),Y(5 downto 4), outm9);
a10: Accurate port map(X(3 downto 2),Y(5 downto 4), outm10);

temp9(7 downto 4)<= outm9;
temp10(9 downto 6)<= outm10;

add8: Adder_16bit port map(temp9,temp10,'0',sum5,cout5);

-----------------------------------------------------------------------
a11: Accurate port map(X(5 downto 4),Y(5 downto 4), outm11);
a12: Accurate port map(X(7 downto 6),Y(5 downto 4), outm12);

temp11(11 downto 8)<= outm11;
temp12(13 downto 10)<= outm12;

add9: Adder_16bit port map(temp11,temp12,'0',sum6,cout6);
add10: Adder_16bit port map(sum5,sum6,'0',sumt3,coutt3);

add11: Adder_16bit port map(sumt3,sumtt1,'0',sumtt2,couttt2);

-----------------------------------------------------------------------
a13: Accurate port map(X(1 downto 0),Y(7 downto 6), outm13);
a14: Accurate port map(X(3 downto 2),Y(7 downto 6), outm14);

temp13(9 downto 6)<= outm13;
temp14(11 downto 8)<= outm14;

add12: Adder_16bit port map(temp13,temp14,'0',sum7,cout7);

-----------------------------------------------------------------------
a15: Accurate port map(X(5 downto 4),Y(7 downto 6), outm15);
a116: Accurate port map(X(7 downto 6),Y(7 downto 6), outm16);

temp15(13 downto 10)<= outm15;
temp16(15 downto 12)<= outm16;

add13: Adder_16bit port map(temp15,temp16,'0',sum8,cout8);
add14: Adder_16bit port map(sum7,sum8,'0',sumt4,coutt4);

add15: Adder_16bit port map(sumt4,sumtt2,'0',sumtt3,couttt3);

outm<=sumtt3;

end Behavioral;
