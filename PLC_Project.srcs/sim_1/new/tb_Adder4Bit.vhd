----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/23/2022 04:13:52 PM
-- Design Name: 
-- Module Name: tb_Adder4Bit - Behavioral
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

entity tb_Adder4Bit is
--  Port ( );
end tb_Adder4Bit;

architecture Behavioral of tb_Adder4Bit is
component Adder_4Bit is
    Port (  x : in STD_LOGIC_VECTOR (7 downto 0);
          y : in STD_LOGIC_VECTOR (7 downto 0);
          cin: in std_logic;
          sum_out : out STD_LOGIC_VECTOR (7 downto 0);
          cout: out std_logic);
           
end component;
signal x_sig,y_sig,sum_out_sig : std_logic_vector(7 downto 0);
signal cin_sig,cout_sig : std_logic;

begin
uut: Adder_4Bit Port map(x_sig,y_sig,cin_sig,sum_out_sig,cout_sig);

stimproc: process
begin
x_sig<="00000000";y_sig<="00000000"; cin_sig<= '0'; wait for 10ns;
x_sig<="00000010";y_sig<="00000110"; cin_sig<= '1'; wait for 10ns;
x_sig<="00000001";y_sig<="00000010"; cin_sig<= '0'; wait for 10ns;
x_sig<="00001100";y_sig<="00000100"; cin_sig<= '1'; wait ;
end process;


end Behavioral;
