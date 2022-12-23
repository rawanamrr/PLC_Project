----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/11/2022 11:41:24 AM
-- Design Name: 
-- Module Name: latch - Behavioral
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

entity latch is
    Port ( D : in STD_LOGIC;
           CLK : in STD_LOGIC;
           rst: in STD_LOGIC;
           Q : out STD_LOGIC;
           notQ : out STD_LOGIC);
end latch;

architecture Behavioral of latch is

begin
process(CLK , rst)

begin 

if rst ='1' then 
     Q<='0';
  
     else 
     if rising_edge(CLK) then 
     Q<=D;
     notQ<= not D;
    
     end if ;
         
   end if ;
   
  end process;


end Behavioral;
