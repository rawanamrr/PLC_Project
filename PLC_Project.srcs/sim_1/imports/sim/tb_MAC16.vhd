----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/29/2022 03:20:13 PM
-- Design Name: 
-- Module Name: tb_MAC16 - Behavioral
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

entity tb_MAC16 is
--  Port ( );
end tb_MAC16;

architecture Behavioral of tb_MAC16 is

component MAC_acc16 is
    Port ( x1,x2,x3,x4,x5 : in STD_LOGIC_VECTOR (15 downto 0);
           w1,w2,w3,w4,w5 : in STD_LOGIC_VECTOR (15 downto 0);
           bias : in STD_LOGIC_VECTOR (15 downto 0);
           macaccout : out STD_LOGIC_VECTOR (32 downto 0));
end component;

signal x1_sig,x2_sig,x3_sig,x4_Sig,x5_sig: STD_LOGIC_VECTOR (15 downto 0);
signal w1_sig,w2_sig,w3_sig,w4_sig,w5_sig: STD_LOGIC_VECTOR (15 downto 0);
signal bias_sig: std_logic_vector (15 downto 0);
signal macaccout_sig : STD_LOGIC_VECTOR (32 downto 0);

begin

MACAC: MAC_acc16 port map(x1_sig,x2_sig,x3_sig,x4_sig,x5_sig,w1_sig,w2_sig,w3_sig,w4_sig,w5_sig,bias_sig,macaccout_sig);

stimproc: process begin

--test case 1
x1_sig <= "1011001010110001";x2_sig <= "1011000010010001";x3_sig <= "0011001010110000";x4_sig <= "1001010010110001";x5_sig <= "1111101010110000";
w1_sig <= "1000001010110001";w2_sig <= "0011000010010001";w3_sig <= "0011111011000000";w4_sig <= "1111010010110001";w5_sig <= "1100101010110000";
bias_sig<= "1000000000000001";wait for 10 ns;
--test case 2
x1_sig <= "1011001010000000";x2_sig <= "1000001010110001";x3_sig <= "0011001010110000";x4_sig <= "0011000010010001";x5_sig <= "1111111111111111";
w1_sig <= "1000001010110001";w2_sig <= "0011000010010001";w3_sig <= "1000001010110001";w4_sig <= "1110010010110001";w5_sig <= "1111111111111111";
bias_sig<= "0000000000000001";wait for 10 ns;
--test case 3
x1_sig <= "1011000000000000";x2_sig <= "0000001010110001";x3_sig <= "0011001010000000";x4_sig <= "0001000010010001";x5_sig <= "1111101100111111";
w1_sig <= "1000000010110000";w2_sig <= "0000000010010001";w3_sig <= "1000000010110001";w4_sig <= "0000010010111111";w5_sig <= "1111011111111111";
bias_sig<= "0000011100000001";wait;
----test case 4 (ehda)
--x1_sig <= "0000000000000010";x2_sig <= "0000000000000010";x3_sig <= "0000000000000010";x4_sig <= "0000000000000010";x5_sig <= "0000000000000010";
--w1_sig <= "0000000000000010";w2_sig <= "0000000000000010";w3_sig <= "0000000000000010";w4_sig <= "0000000000000010";w5_sig <= "0000000000000010";
--bias_sig<= "0000000000000010";wait;

end process;

end Behavioral;
