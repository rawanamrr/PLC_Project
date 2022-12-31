----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/28/2022 07:12:21 PM
-- Design Name: 
-- Module Name: SkipADD_16bit - Behavioral
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

entity SkipADD_16bit is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           cin: in std_logic;
           res : out STD_LOGIC_VECTOR (15 downto 0);
           cout: out std_logic);
end SkipADD_16bit;

architecture Behavioral of SkipADD_16bit is

component Adder_4bit is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           cin: in std_logic;
           sum_out : out STD_LOGIC_VECTOR (3 downto 0);
           cout: out std_logic);
end component;

signal prop,res_sig: std_logic_vector(15 downto 0);
signal cin_sig,cout_ripple,and_sig: std_logic_vector(3 downto 0);


begin

--create propagate terms
MakeProp:for i in 0 to 15 generate 
prop(i) <= x(i) or y(i);
end generate;

--
cin_sig(0) <= cin;

--first stage
and_sig(0) <= prop(0) and prop(1) and prop(2) and prop(3);
ADDWithSkip1: Adder_4bit port map(x(3 downto 0),y(3 downto 0),cin_sig(0),res_sig(3 downto 0),cout_ripple(0));
cin_sig(1) <= cout_ripple(0) or and_sig(0);

--second stage
and_sig(1) <= prop(4) and prop(5) and prop(6) and prop(7);
ADDWithSkip2: Adder_4bit port map(x(7 downto 4),y(7 downto 4),cin_sig(1),res_sig(7 downto 4),cout_ripple(1));
cin_sig(2) <= cout_ripple(1) or and_sig(1);

--third stage
and_sig(2) <= prop(8) and prop(9) and prop(10) and prop(11);
ADDWithSkip3: Adder_4bit port map(x(11 downto 8),y(11 downto 8),cin_sig(2),res_sig(11 downto 8),cout_ripple(2));
cin_sig(3) <= cout_ripple(2) or and_sig(2);

--fourth stage
and_sig(3) <= prop(12) and prop(13) and prop(14) and prop(15);
ADDWithSkip4: Adder_4bit port map(x(15 downto 12),y(15 downto 12),cin_sig(3),res_sig(15 downto 12),cout_ripple(3));

cout <= cout_ripple(3) or and_sig(3);
res<= res_sig;

end Behavioral;
