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


entity Act_32bits is
    Port ( in1 : in STD_LOGIC_VECTOR (34 downto 0);
           out_act32 : out STD_LOGIC_VECTOR (31 downto 0));
end Act_32bits;

architecture Behavioral of Act_32bits is

begin

p1: process(in1)
begin
if in1< "000000000000000000010011100010000" then
out_act32<= "00000000000000000000000000000000";
 else
out_act32<= in1(34 downto 3);
end if;

end process;


end Behavioral;
