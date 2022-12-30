----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/11/2022 11:39:27 AM
-- Design Name: 
-- Module Name: approxMult_2x2 - Behavioral
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

entity approxMult_2x2 is
    Port ( a : in STD_LOGIC_VECTOR (1 downto 0);
           b : in STD_LOGIC_VECTOR (1 downto 0);
           res : out STD_LOGIC_VECTOR (2 downto 0));
end approxMult_2x2;

architecture Behavioral of approxMult_2x2 is
signal p0,p1,p2,p3 : std_logic;
begin
p0 <= a(0) and b(0);
p1 <=a(1) and b(0);
p2 <= a(0) and b(1);
p3 <= a(1) and b(1);

res(0)<=p0;
res(1) <= p1 or p2;
res(2)<= p3;



end Behavioral;
