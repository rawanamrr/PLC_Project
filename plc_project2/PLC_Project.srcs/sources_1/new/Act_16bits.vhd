----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/28/2022 06:16:49 PM
-- Design Name: 
-- Module Name: MAC_Approx_tb - Behavioral
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


entity Act_16bits is
    Port ( in1 : in STD_LOGIC_VECTOR (16 downto 0);
           out_act16 : out STD_LOGIC_VECTOR (15 downto 0));
end Act_16bits;

architecture Behavioral of Act_16bits is

begin

p1: process(in1)
begin
if in1< "00010011100010000" then
out_act16<= "0000000000000000";
 else
out_act16<= in1(16 downto 1);
end if;

end process;


end Behavioral;
