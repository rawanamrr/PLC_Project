----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/28/2022 06:04:09 PM
-- Design Name: 
-- Module Name: CLA_4bit - Behavioral
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

entity CLA_4bit is
  port (
    i_add1  : in std_logic_vector(3 downto 0);
    i_add2  : in std_logic_vector(3 downto 0);
    res   : out std_logic_vector(4 downto 0)
    );
end CLA_4bit;

architecture Behavioral of CLA_4bit is

component FA is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           c_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           c_out : out STD_LOGIC);
end component;

signal w_G : std_logic_vector(3 downto 0); -- Generate
signal w_P : std_logic_vector(3 downto 0); -- Propagate
signal w_C : std_logic_vector(4 downto 0); -- Carry
signal w_SUM   : std_logic_vector(3 downto 0); 
   
begin
   
FULL_ADDER_BIT_0: FA
    port map (i_add1(0),i_add2(0),w_C(0),w_SUM(0),open);
 
FULL_ADDER_BIT_1: FA port map (i_add1(1),i_add2(1),w_C(1),w_SUM(1),open);

FULL_ADDER_BIT_2: FA port map (i_add1(2),i_add2(2),w_C(2),w_SUM(2),open);
   
FULL_ADDER_BIT_3: FA port map (i_add1(3),i_add2(3),w_C(3),w_SUM(3),open);
 
  -- Create the Generate (G) Terms:  Gi=Ai*Bi
  w_G(0) <= i_add1(0) and i_add2(0);
  w_G(1) <= i_add1(1) and i_add2(1);
  w_G(2) <= i_add1(2) and i_add2(2);
  w_G(3) <= i_add1(3) and i_add2(3);
 
  -- Create the Propagate Terms: Pi=Ai+Bi
  w_P(0) <= i_add1(0) or i_add2(0);
  w_P(1) <= i_add1(1) or i_add2(1);
  w_P(2) <= i_add1(2) or i_add2(2);
  w_P(3) <= i_add1(3) or i_add2(3);
 
  -- Create the Carry Terms:
  w_C(0) <= '0'; -- no carry input
  w_C(1) <= w_G(0) or (w_P(0) and w_C(0));
  w_C(2) <= w_G(1) or (w_P(1) and w_C(1));
  w_C(3) <= w_G(2) or (w_P(2) and w_C(2));
  w_C(4) <= w_G(3) or (w_P(3) and w_C(3));
 
  -- Final Answer
  res <= w_C(4) & w_SUM;
   
end Behavioral;
