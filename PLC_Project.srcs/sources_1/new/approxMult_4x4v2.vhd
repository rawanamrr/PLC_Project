----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/26/2022 04:14:03 PM
-- Design Name: 
-- Module Name: approxMult_4x4 - Behavioral
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

entity approxMult_4x4v2 is
  Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
         y : in STD_LOGIC_VECTOR (3 downto 0);
         res : out STD_LOGIC_VECTOR (6 downto 0));
end approxMult_4x4v2;

architecture Behavioral of approxMult_4x4v2 is
component approxMult_2x2 is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           res : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component FA is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           c_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           c_out : out STD_LOGIC);
end component;

component Adder_3bit is
    Port ( x : in STD_LOGIC_VECTOR (2 downto 0);
           y : in STD_LOGIC_VECTOR (2 downto 0);
           cin: in std_logic;
           sum_out : out STD_LOGIC_VECTOR (2 downto 0);
           cout: out std_logic);
          
end component;

component Adder_4bit is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           cin: in std_logic;
           sum_out : out STD_LOGIC_VECTOR (3 downto 0);
           cout: out std_logic);
          
end component;

signal P1,P2,P3,P4: std_logic_vector(2 downto 0);--partial products 
signal subL1: std_logic_vector(4 downto 0);--sublevel 1 result
signal subL2: std_logic_vector(5 downto 0);--sublevel 2 result
signal temp1: std_logic_vector(2 downto 0);
signal res_sig: std_logic_vector(6 downto 0);
signal temp2: std_logic_vector(3 downto 0); 
signal temp3: std_logic_vector(3 downto 0); 
begin

mult1: approxMult_2x2 port map(x(1 downto 0),y(1 downto 0),P1);
mult2: approxMult_2x2 port map(x(3 downto 2),y(1 downto 0),P2);
mult3: approxMult_2x2 port map(x(1 downto 0),y(3 downto 2),P3);
mult4: approxMult_2x2 port map(x(3 downto 2),y(3 downto 2),P4);

temp1<='0'&P1(2 downto 1);
Adder3Bit_1: Adder_3bit port map(P2,temp1,'0',subL1(3 downto 1),subL1(4));
subL1(0)<=P1(0);

temp2<='0'&P3;
Adder4Bit_1: Adder_4bit port map(temp2,subL1(4 downto 1),'0',subL2(4 downto 1),subL2(5));
subL2(0)<=subL1(0);

temp3<='0'&P4;
Adder4Bit_2: Adder_4bit port map(temp3,subL2(5 downto 2),'0',res_sig(5 downto 2),res_sig(6));
res_sig(1 downto 0)<=subL2(1 downto 0);

res<=res_sig;


end Behavioral;
