----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/28/2022 08:54:20 PM
-- Design Name: 
-- Module Name: tb_HiddenNeuron - Behavioral
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

entity tb_HiddenNeuron is
--  Port ( );
end tb_HiddenNeuron;

architecture Behavioral of tb_HiddenNeuron is
component HiddenNeuron_acc is
Port ( x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           w1 : in STD_LOGIC_VECTOR (7 downto 0);
           w2 : in STD_LOGIC_VECTOR (7 downto 0);
           bias : in STD_LOGIC_VECTOR (7 downto 0);
           Neuron_OUT : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component HiddenNeuron_approx is
Port ( x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           w1 : in STD_LOGIC_VECTOR (7 downto 0);
           w2 : in STD_LOGIC_VECTOR (7 downto 0);
           bias : in STD_LOGIC_VECTOR (7 downto 0);
           Neuron_OUT : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal x1 :  STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
signal x2 :  STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
signal w1 :  STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
signal w2 :  STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
signal bias :  STD_LOGIC_VECTOR (7 downto 0):= (others => '0');
signal APPROXIMATE_HN :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');
signal ACCURATE_HN :  STD_LOGIC_VECTOR (15 downto 0):= (others => '0');

begin

uut: HiddenNeuron_approx port map(x1,x2,w1,w2,bias,APPROXIMATE_HN);
uut2:HiddenNeuron_acc port map(x1,x2,w1,w2,bias,ACCURATE_HN);

stim_proc: process
    begin
 x1<="00000001"; x2<="00000001"; w1<="00000001"; w2<="00000001"; bias<="00000001"; wait for 10 ns;  
 x1<="00000000"; x2<="00000000"; w1<="00000000"; w2<="00000000"; bias<="00000000"; wait for 10 ns; 
wait;
    end process;
    

end Behavioral;
