----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/26/2022 07:07:58 PM
-- Design Name: 
-- Module Name: accMult_8x8v1 - Behavioral
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

entity accMult_8x8v1 is
    Port ( x : in STD_LOGIC_VECTOR (7 downto 0);
           y : in STD_LOGIC_VECTOR (7 downto 0);
           res : out STD_LOGIC_VECTOR (15 downto 0));
end accMult_8x8v1;

architecture Behavioral of accMult_8x8v1 is
component accMult_4x4 is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Adder_16bit is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           cin : in STD_LOGIC;
           sum_out : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
end component;

component FA is
    Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           c_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           c_out : out STD_LOGIC);
end component;


signal P1,P2,P3,P4: std_logic_vector(7 downto 0);
signal subL1: std_logic_vector(12 downto 0);
signal subL2: std_logic_vector(13 downto 0);
signal temp1,temp2: std_logic_vector(3 downto 0);
signal sum1,sum2: std_logic_vector(3 downto 0);
signal cout1,cout2,cout3: std_logic;
signal res_sig: std_logic_vector(15 downto 0);

begin



end Behavioral;
