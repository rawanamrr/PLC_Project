----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/23/2022 05:40:16 PM
-- Design Name: 
-- Module Name: tb_accMult4x4 - Behavioral
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

entity tb_accMult4x4 is
--  Port ( );
end tb_accMult4x4;

architecture Behavioral of tb_accMult4x4 is
component accMult_4x4 is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal a_sig,b_sig : std_logic_vector(3 downto 0);
signal res_sig : std_logic_vector(7 downto 0);

begin

uut: accMult_4x4 Port map(a_sig,b_sig,res_sig);
stim_proc: process
begin
a_sig<="0000";b_sig<= "0001"; wait for 10 ns;
a_sig<="0010";b_sig<= "0011"; wait for 10 ns;
a_sig<="1100";b_sig<= "0101"; wait for 10 ns;
a_sig<="0110";b_sig<= "1101"; wait;

end process;




end Behavioral;
