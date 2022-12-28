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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MAC_Approx_tb is
--  Port ( );
end MAC_Approx_tb;

architecture Behavioral of MAC_Approx_tb is

COMPONENT MAC_Aprrox is
    Port ( x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           w1 : in STD_LOGIC_VECTOR (7 downto 0);
           w2 : in STD_LOGIC_VECTOR (7 downto 0);
           bias : in STD_LOGIC_VECTOR (7 downto 0);
           macapproxout : out STD_LOGIC_VECTOR (16 downto 0));
end COMPONENT;

signal x1 :  STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
signal x2 :  STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
signal w1 :  STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
signal w2 :  STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
signal bias :  STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
signal macapproxout :  STD_LOGIC_VECTOR (16 downto 0):= (others => '0');
           
begin
uut: MAC_Aprrox port map(x1,x2,w1,w2,bias,macapproxout);
stim_proc: process
    begin
 x1<="11111111"; x2<="11111111"; w1<="11111111"; w2<="11111111"; bias<="00000001"; wait for 10 ns;  
 x1<="00000000"; x2<="00000000"; w1<="00000000"; w2<="00000000"; bias<="00000000"; wait for 10 ns; 
wait;
    end process;

end Behavioral;
