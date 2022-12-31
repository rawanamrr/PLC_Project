----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/31/2022 03:17:58 AM
-- Design Name: 
-- Module Name: SkipAdd_34bit - Behavioral
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

entity SkipAdd_34bit is
   Port ( x : in STD_LOGIC_VECTOR (33 downto 0);
     y : in STD_LOGIC_VECTOR (33 downto 0);
     cin: in std_logic;
     res : out STD_LOGIC_VECTOR (33 downto 0);
     cout: out std_logic);
end SkipAdd_34bit;

architecture Behavioral of SkipAdd_34bit is

component FA is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           c_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           c_out : out STD_LOGIC);
end component;

component SkipAdd_33bit is
   Port ( x : in STD_LOGIC_VECTOR (32 downto 0);
        y : in STD_LOGIC_VECTOR (32 downto 0);
        cin: in std_logic;
        res : out STD_LOGIC_VECTOR (32 downto 0);
        cout: out std_logic);
end component;

signal res_sig: std_logic_vector(33 downto 0);
signal cout1,cout2: std_logic;

begin

CSka: SkipAdd_33bit port map(x(32 downto 0),y(32 downto 0),'0',res_sig(32 downto 0),cout1);
FA1: FA port map(x(33),y(33),cout1,res_sig(33),cout2);

res <= res_sig;
cout <= cout2;


end Behavioral;
