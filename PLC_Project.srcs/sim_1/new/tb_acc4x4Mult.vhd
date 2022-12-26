----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/26/2022 02:20:18 PM
-- Design Name: 
-- Module Name: tb_acc4x4Mult - Behavioral
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

entity tb_acc4x4Mult is
--  Port ( );
end tb_acc4x4Mult;

architecture Behavioral of tb_acc4x4Mult is
component accMult_4x4 is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (8 downto 0));
end component;
signal x_sig,y_sig : std_logic_vector(3 downto 0);
signal res_sig : std_logic_vector(8 downto 0);

begin
uut: accMult_4x4 port map(x_sig,y_sig,res_sig);
stim_proc: process
begin 
x_sig<="0000";y_sig<="0000"; wait for 10 ns;
x_sig<="0001";y_sig<="0110"; wait for 10 ns;
x_sig<="0110";y_sig<="0010"; wait;

end process;

end Behavioral;
