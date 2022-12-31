----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/30/2022 12:47:30 AM
-- Design Name: 
-- Module Name: carrylook4bit - Behavioral
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

entity carrylook4bitGen is
    Port ( p : in STD_LOGIC_VECTOR (3 downto 0);
           g : in STD_LOGIC_VECTOR (3 downto 0);
           cin :in  std_logic;
           gout: out std_logic;
           pout: out std_logic;
           cout : out STD_LOGIC_VECTOR (3 downto 0));
end carrylook4bitGen;

architecture Behavioral of carrylook4bitGen is

signal cout2: std_logic;
begin

cout(0) <= g(0) or (p(0) and cin);
cout(1) <= g(1) or (p(1) and g(0)) or(p(1) and p(0) and cin);
--use signal as cout2 2 will be used as input
cout2 <= g(2) or (g(1) and p(2)) or (g(0) and p(1) and p(2)) or (cin and p(0) and p(1) and p(2));
cout(2) <= cout2;
cout(3) <= (cout2 and p(3)) or g(3);
gout <= g(3) or (g(2) and p(3)) or (g(1) and p(2) and p(3)) or (g(0) and p(1) and p(2) and p(3));
pout <= p(0) and p(1) and p(2) and p(3);


end Behavioral;
