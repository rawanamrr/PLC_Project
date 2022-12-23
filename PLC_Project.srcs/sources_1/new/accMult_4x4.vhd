----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/23/2022 03:41:42 PM
-- Design Name: 
-- Module Name: accMult_4x4 - Behavioral
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

entity accMult_4x4 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0));
end accMult_4x4;

architecture Behavioral of accMult_4x4 is
component accMult_2x2 is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           res : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Adder_4Bit is
    Port (x : in STD_LOGIC_VECTOR (7 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           cin: in std_logic;
           sum_out : out STD_LOGIC_VECTOR (7 downto 0);
           cout: out std_logic);
           
end component;

signal temp0,temp1,temp2,temp3 : std_logic_vector(3 downto 0);
signal p0,p1,p2,p3 : std_logic_vector(7 downto 0);
signal s1,s2,s3 : std_logic_vector(7 downto 0);
signal c1,c2,c3 : std_logic;

begin

mult_1: accMult_2x2 Port map(a(3 downto 2),b(3 downto 2),temp0);
mult_2: accMult_2x2 Port map(a(3 downto 2),b(1 downto 0),temp1);
mult_3: accMult_2x2 Port map(a(1 downto 0),b(3 downto 2),temp2);
mult_4: accMult_2x2 Port map(a(1 downto 0),b(1 downto 0),temp3);

p0<= temp0 & "0000";
p1<="00" & temp1 & "00";
p2<="00" & temp2 & "00";
p3<="0000" & temp3 ;

add_1: Adder_4Bit Port map(p0,p1,'0',s1,c1);
add_2: Adder_4Bit Port map(p2,s1,c1,s2,c2);
add_3: Adder_4bit Port map(p3,s2,c2,s3,c3);

res<=s3;

end Behavioral;
