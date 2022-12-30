----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/08/2022 09:15:17 PM
-- Design Name: 
-- Module Name: Accurate - Behavioral
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
entity Accurate is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           output : out STD_LOGIC_VECTOR (3 downto 0));
end Accurate;

architecture Behavioral of Accurate is
signal H : std_logic_vector (1 downto 0);
signal W : std_logic;
Signal dd: std_logic;
begin

output(0)<=a(0) and b(0);
H(0)<= (a(0)and b(1));
H(1)<=(a(1) and b(0));
output(1)<= H(1) xor H(0);
W<=H(0)and H(1);
dd<=a(1)and b(1);
Output(2)<=W xor dd;
Output(3)<= W and dd;
end Behavioral;
