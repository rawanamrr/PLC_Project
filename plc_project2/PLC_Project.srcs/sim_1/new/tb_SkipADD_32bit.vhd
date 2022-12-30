----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/29/2022 12:33:07 PM
-- Design Name: 
-- Module Name: tb_SkipADD_32bit - Behavioral
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

entity tb_SkipADD_32bit is
--  Port ( );
end tb_SkipADD_32bit;

architecture Behavioral of tb_SkipADD_32bit is

component SkipAdd_32bit is
   Port ( x : in STD_LOGIC_VECTOR (31 downto 0);
        y : in STD_LOGIC_VECTOR (31 downto 0);
        cin: in std_logic;
        res : out STD_LOGIC_VECTOR (31 downto 0);
        cout: out std_logic);
end component;

component Adder_32Bits is
    Port ( x : in STD_LOGIC_VECTOR (31 downto 0);
           y : in STD_LOGIC_VECTOR (31 downto 0);
           cin : in STD_LOGIC;
           sum_out : out STD_LOGIC_VECTOR (31 downto 0);
           cout : out STD_LOGIC);
end component;

signal x_sig,y_sig,res_sig,res_sig_2: STD_LOGIC_VECTOR (31 downto 0);
signal cout1,cout2: std_logic;

begin

SkipADD32: SkipADD_32bit port map(x_sig,y_sig,'0',res_sig,cout1);
rippleadder32: Adder_32Bits port map(x_sig,y_sig,'0',res_sig_2,cout2);


addersTest: process
begin

x_sig <= "00000000000000000000000000000000";y_sig <="00000000000000000000000000000000"; wait for 10 ns;
x_sig <= "11111111111111111111111111111111";y_sig <="11111111111111111111111111111111"; wait for 10 ns;
x_sig <= "11110000111100001111000011110000";y_sig <="11110000111100000001100000011000"; wait for 10 ns;
x_sig <= "01000001010000010100000101000001";y_sig <="01000001010000010010001000100010"; wait for 10 ns;
x_sig <= "00010000000100000001000000010000";y_sig <="00010000000100000000001000000010"; wait for 10 ns;
x_sig <= "01111100011111001111001011110010";y_sig <="11110010111100101111001011110010"; wait;

end process;

end Behavioral;
