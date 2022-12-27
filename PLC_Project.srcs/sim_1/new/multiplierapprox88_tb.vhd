

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity multiplierapprox88_tb is
--  Port ( );
end multiplierapprox88_tb;

architecture Behavioral of multiplierapprox88_tb is

COMPONENT multiplierapprox88 is
    Port ( X : in STD_LOGIC_VECTOR (7 downto 0);
           Y : in STD_LOGIC_VECTOR (7 downto 0);
           outm : out STD_LOGIC_VECTOR (15 downto 0));
end COMPONENT;

signal X : STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
signal Y :  STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
signal outm : STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
           
begin

uut: multiplierapprox88 
    Port map ( X,
           Y ,
           outm);
           
stim_proc: process
    begin
x<="11111111"; y<="11111111"; wait for 10 ns;  
x<="00000000"; y<="00000000"; wait for 10 ns; 
 wait;
end process;

end Behavioral;
