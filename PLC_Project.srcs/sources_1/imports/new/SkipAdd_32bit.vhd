----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/28/2022 09:45:12 PM
-- Design Name: 
-- Module Name: SkipAdd_32bit - Behavioral
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
--talsa2ny ya fandem
entity SkipAdd_32bit is
   Port ( x : in STD_LOGIC_VECTOR (31 downto 0);
        y : in STD_LOGIC_VECTOR (31 downto 0);
        cin: in std_logic;
        res : out STD_LOGIC_VECTOR (31 downto 0);
        cout: out std_logic);
end SkipAdd_32bit;

architecture Behavioral of SkipAdd_32bit is

component SkipADD_16bit is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           cin: in std_logic;
           res : out STD_LOGIC_VECTOR (15 downto 0);
           cout: out std_logic);
end component;

signal res_sig: std_logic_vector(31 downto 0);
signal cout1,cout2: std_logic;

begin

CSA1: SkipADD_16bit port map (x(15 downto 0),y(15 downto 0),'0',res_sig(15 downto 0),cout1);
CSA2: SkipADD_16bit port map (x(31 downto 16),y(31 downto 16),cout1,res_sig(31 downto 16),cout2);

res <= res_sig;
cout <= cout2;

end Behavioral;
