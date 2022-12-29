----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/28/2022 06:48:24 PM
-- Design Name: 
-- Module Name: tb_CLA_4bit - Behavioral
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

entity tb_CLA_4bit is
--  Port ( );
end tb_CLA_4bit;

architecture Behavioral of tb_CLA_4bit is
component CLA_4bit is
  port (
    i_add1  : in std_logic_vector(3 downto 0);
    i_add2  : in std_logic_vector(3 downto 0);
    res   : out std_logic_vector(4 downto 0)
    );
end component;

signal x_sig,y_sig: std_logic_vector(3 downto 0);
signal sum_out: std_logic_vector(4 downto 0);

begin
uutCLA: CLA_4bit Port map(x_sig,y_sig,sum_out); 


stimproc: process
begin
x_sig<="0000";y_sig<="0000"; wait for 10ns;
x_sig<="0010";y_sig<="0010"; wait for 10ns;
x_sig<="0001";y_sig<="0001"; wait for 10ns;
x_sig<="1100";y_sig<="1100"; wait ;
end process;


end Behavioral;
