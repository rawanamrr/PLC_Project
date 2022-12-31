----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/30/2022 01:34:48 PM
-- Design Name: 
-- Module Name: tb_CLA_16bit - Behavioral
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

entity tb_CLA_16bit is
--  Port ( );
end tb_CLA_16bit;

architecture Behavioral of tb_CLA_16bit is

component Adder_16bit is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           cin : in STD_LOGIC;
           sum_out : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
end component;

component CLA_16bit is
  port (
    x  : in std_logic_vector(15 downto 0);
    y  : in std_logic_vector(15 downto 0);
    cin : in std_logic;
    gout: out std_logic;
    pout: out std_logic;
    cout : out std_logic;
    res   : out std_logic_vector(15 downto 0));
end component;

component SkipADD_16bit is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           cin: in std_logic;
           res : out STD_LOGIC_VECTOR (15 downto 0);
           cout: out std_logic);
end component;

signal x1_sig,y1_sig: STD_LOGIC_VECTOR (15 downto 0);
signal sum_RCA,sum_CLA,sum_CSka:STD_LOGIC_VECTOR (15 downto 0);
signal cout_RCA,cout_CLA,cout_CSka : std_logic;
signal gout_CLA,pout_CLA: std_logic;

begin

RCA: Adder_16bit port map(x1_sig,y1_sig,'0',sum_RCA,cout_RCA);
CLA: CLA_16bit port map(x1_sig,y1_sig,'0',gout_CLA,pout_CLA,cout_CLA,sum_CLA);
CskA: SkipADD_16bit port map(x1_sig,y1_sig,'0',sum_CSka,cout_CSka);

stimproc: process begin

x1_sig <= "1011001010110001";y1_sig <= "1011000010010001";wait for 10 ns;
x1_sig <= "0011000010010001";y1_sig <= "1000000010110001";wait for 10 ns;
x1_sig <= "1011001010110001";y1_sig <= "1110010010110001";wait for 10 ns;
x1_sig <= "0000000010010001";y1_sig <= "1111011111111111";wait for 10 ns;
x1_sig <= "0010110010010101";y1_sig <= "1011011001111011";wait for 10 ns;
x1_sig <= "0000000000000001";y1_sig <= "1100010000000100";wait for 10 ns;
x1_sig <= "1111111111111110";y1_sig <= "1111011111111111";wait for 10 ns;
x1_sig <= "1111111111111111";y1_sig <= "1111111111111111";wait;

end process;
end Behavioral;
