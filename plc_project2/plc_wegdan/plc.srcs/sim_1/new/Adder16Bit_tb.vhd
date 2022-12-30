

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity adder16bit_tb is
--  Port ( );
end adder16bit_tb;

architecture Behavioral of adder16bit_tb is

COMPONENT Adder16Bit is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           cin : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
end COMPONENT;

signal x :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal y :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal cin :  STD_LOGIC := '0';
signal s :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal cout :  STD_LOGIC := '0';

begin
uut: Adder16Bit Port Map ( x, 
          y, 
          cin, 
          s, 
          cout);
stim_proc: process
          begin
x<="0000000000000000"; y<="0000000000000000"; Cin<='0' ; wait for 10 ns;   
x<="1111111111111111"; y<="0000000000000000"; Cin<='1' ; wait for 10 ns;   
x<="1111111111111111"; y<="0000000000000000"; Cin<='0' ; wait for 10 ns; 
x<="1111111111111111"; y<="1111111111111111"; Cin<='1' ; wait for 10 ns;       
x<="1111111111111111"; y<="1111111111111111"; Cin<='0' ; wait for 10 ns; 
 wait;
end process;

end Behavioral;
