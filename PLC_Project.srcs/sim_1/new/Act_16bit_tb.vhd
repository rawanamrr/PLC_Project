----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/28/2022 07:34:10 PM
-- Design Name: 
-- Module Name: Act_16bit_tb - Behavioral
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

entity Act_16bit_tb is
--  Port ( );
end Act_16bit_tb;

architecture Behavioral of Act_16bit_tb is

COMPONENT Act_16bits is
    Port ( in1 : in STD_LOGIC_VECTOR (16 downto 0);
           out_act16 : out STD_LOGIC_VECTOR (15 downto 0));
end COMPONENT;

signal in1 : STD_LOGIC_VECTOR (16 downto 0):= (others => '0');
signal out_act16 :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
           
begin
uut: Act_16bits port map(in1,out_act16);
stim_proc: process
    begin
in1<= "00000000100010000" ;wait for 10 ns; 
in1<= "11111111111111111" ;wait for 10 ns; 
in1<= "11111001111111111" ;wait for 10 ns; 
in1<= "00111111111111111" ;wait for 10 ns; 
in1<= "00111111111111010" ;wait for 10 ns; 

wait;   
    end process;
end Behavioral;
