----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/26/2022 09:41:30 PM
-- Design Name: 
-- Module Name: tb_accMult_8x8 - Behavioral
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

entity tb_accMult_8x8 is
--  Port ( );
end tb_accMult_8x8;

architecture Behavioral of tb_accMult_8x8 is

component accMult_8x8v1 is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal x_sig,y_sig: STD_logic_vector (7 downto 0);
signal res_sig: STD_logic_vector (15 downto 0);

begin

garab: accMult_8x8v1 port map(x_sig,y_sig,res_sig);

hussien: process
begin

x_sig <= "00000000";y_sig <="00000000"; wait for 10 ns;
x_sig <= "11111111";y_sig <="11111111"; wait for 10 ns;
x_sig <= "11110000";y_sig <="00011000"; wait for 10 ns;
x_sig <= "01000001";y_sig <="00100010"; wait for 10 ns;
x_sig <= "00010000";y_sig <="00000010"; wait;

end process;


end Behavioral;
