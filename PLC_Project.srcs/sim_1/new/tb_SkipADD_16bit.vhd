----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/28/2022 08:26:15 PM
-- Design Name: 
-- Module Name: tb_SkipADD_16bit - Behavioral
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

entity tb_SkipADD_16bit is
--  Port ( );
end tb_SkipADD_16bit;

architecture Behavioral of tb_SkipADD_16bit is

component SkipADD_16bit is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           cin: in std_logic;
           res : out STD_LOGIC_VECTOR (15 downto 0);
           cout: out std_logic);
end component;

signal x_sig,y_sig,res_sig: STD_LOGIC_VECTOR (15 downto 0);
signal cout: std_logic;

begin
uut: SkipADD_16bit port map(x_sig,y_sig,'0',res_sig,cout);

ahlan: process
begin


x_sig <= "0000000000000000";y_sig <="0000000000000000"; wait for 10 ns;
x_sig <= "1111111111111111";y_sig <="1111111111111111"; wait for 10 ns;
x_sig <= "1111000011110000";y_sig <="0001100000011000"; wait for 10 ns;
x_sig <= "0100000101000001";y_sig <="0010001000100010"; wait for 10 ns;
x_sig <= "0001000000010000";y_sig <="0000001000000010"; wait for 10 ns;
x_sig <= "0111110001111100";y_sig <="1111001011110010"; wait;

end process;


end Behavioral;
