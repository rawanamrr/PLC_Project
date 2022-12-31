----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/31/2022 01:27:34 AM
-- Design Name: 
-- Module Name: tb_Adder_33bit - Behavioral
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

entity tb_Adder_33bit is
--  Port ( );
end tb_Adder_33bit;


architecture Behavioral of tb_Adder_33bit is

COMPONENT Adder_33Bits is
    Port ( x : in STD_LOGIC_VECTOR (32 downto 0);
           y : in STD_LOGIC_VECTOR (32 downto 0);
           cin : in STD_LOGIC;
           sum_out : out STD_LOGIC_VECTOR (32 downto 0);
           cout : out STD_LOGIC);
end COMPONENT;

COMPONENT SkipAdd_33bit is
   Port ( x : in STD_LOGIC_VECTOR (32 downto 0);
     y : in STD_LOGIC_VECTOR (32 downto 0);
     cin: in std_logic;
     res : out STD_LOGIC_VECTOR (32 downto 0);
     cout: out std_logic);
end COMPONENT;

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

component SkipAdd_34bit is
   Port ( x : in STD_LOGIC_VECTOR (33 downto 0);
     y : in STD_LOGIC_VECTOR (33 downto 0);
     cin: in std_logic;
     res : out STD_LOGIC_VECTOR (33 downto 0);
     cout: out std_logic);
end component;

component Adder_34Bits is
    Port ( x : in STD_LOGIC_VECTOR (33 downto 0);
           y : in STD_LOGIC_VECTOR (33 downto 0);
           cin : in STD_LOGIC;
           sum_out : out STD_LOGIC_VECTOR (33 downto 0);
           cout : out STD_LOGIC);
end component;

signal x_sig,y_sig: STD_LOGIC_VECTOR (33 downto 0);
signal skip_34,RCA_34: STD_LOGIC_VECTOR (33 downto 0);
signal skip_33,RCA_33: STD_LOGIC_VECTOR (32 downto 0);
signal skip_32,RCA_32: STD_LOGIC_VECTOR (31 downto 0);
signal cout1,cout2,cout3,cout4,cout5,cout6: STD_LOGIC;

begin

skip34: SkipAdd_34bit port map(x_sig,y_sig,'0',skip_34,cout5);
normal34: Adder_34Bits port map(x_sig,y_sig,'0',RCA_34,cout6);
skip33: SkipAdd_33bit port map(x_sig(32 downto 0),y_sig(32 downto 0),'0',skip_33,cout1);
normal33: Adder_33Bits port map(x_sig(32 downto 0),y_sig(32 downto 0),'0',RCA_33,cout2);
skip32: SkipAdd_32bit port map(x_sig(31 downto 0),y_sig(31 downto 0),'0',skip_32,cout3);
normal32: Adder_32Bits port map(x_sig(31 downto 0),y_sig(31 downto 0),'0',RCA_32,cout4);

stimproc: process begin

x_sig <="1101100101011000111011001010110001";y_sig <="1100001010110000010101100010110001";wait for 10 ns;
x_sig <="1111111111111111111111111111111111";y_sig <="1111111110101011000001101010110000";wait for 10 ns;
x_sig <="1111111111111111111111111111111111";y_sig <="1111111111111111111111111111111111";wait for 10 ns;
x_sig <="1001100000100101111110010010111111";y_sig <="1001101100001001000111000010010001";wait;

end process;

end Behavioral;
