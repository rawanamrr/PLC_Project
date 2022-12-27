----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/08/2022 09:04:41 PM
-- Design Name: 
-- Module Name: UDM - Behavioral
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


entity UDM is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           Output : out STD_LOGIC_VECTOR (2 downto 0));
end UDM;

architecture Behavioral of UDM is

begin
Output(2)<= (a(1) and b(1));
Output(1)<=(a(0)and b(1))OR(b(0)and a(1));
Output(0)<=a(0) and b(0);

end Behavioral;
