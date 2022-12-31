----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/30/2022 1:14:09 PM
-- Design Name: 
-- Module Name: CLA_16bit - Behavioral
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

entity CLA_16bit is
  port (
    x  : in std_logic_vector(15 downto 0);
    y  : in std_logic_vector(15 downto 0);
    cin : in std_logic;
    gout: out std_logic;
    pout: out std_logic;
    cout : out std_logic;
    res   : out std_logic_vector(15 downto 0));
end CLA_16bit;

architecture Behavioral of CLA_16bit is

component CLA_4bit is
  port (
    i_add1  : in std_logic_vector(3 downto 0);
    i_add2  : in std_logic_vector(3 downto 0);
    cin : in std_logic;
    gout: out std_logic;
    pout: out std_logic;
    cout : out std_logic;
    res   : out std_logic_vector(3 downto 0));
end component;

component carrylook4bitGen is
    Port ( p : in STD_LOGIC_VECTOR (3 downto 0);
           g : in STD_LOGIC_VECTOR (3 downto 0);
           cin :in  std_logic;
           gout: out std_logic;
           pout: out std_logic;
           cout : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal w_G : std_logic_vector(3 downto 0); -- Generate
signal w_P : std_logic_vector(3 downto 0); -- Propagate
signal w_C : std_logic_vector(4 downto 0); -- Carry
signal w_SUM  : std_logic_vector(15 downto 0); 
--out signal for Ps and Gs
signal g_Range_out : std_logic;
signal p_Range_out : std_logic;

   
begin

  -- Create the Carry Terms:
  w_C(0) <= cin;
lookahead_gen: carrylook4bitGen port map(w_P,w_G,w_C(0),g_Range_out,p_Range_out,w_C(4 downto 1));


--w_Generate sum
CLA_4bit_1: CLA_4bit port map(x(3 downto 0),y(3 downto 0),w_C(0),w_G(0),w_P(0),open,w_SUM(3 downto 0));
   
CLA_4bit_2: CLA_4bit port map(x(7 downto 4),y(7 downto 4),w_C(1),w_G(1),w_P(1),open,w_SUM(7 downto 4));

CLA_4bit_3: CLA_4bit port map(x(11 downto 8),y(11 downto 8),w_C(2),w_G(2),w_P(2),open,w_SUM(11 downto 8));

CLA_4bit_4: CLA_4bit port map(x(15 downto 12),y(15 downto 12),w_C(3),w_G(3),w_P(3),open,w_SUM(15 downto 12));
   
-- Final Answer
res <= w_SUM;
cout <= w_C(4);

--Ps and Gs result
gout <=g_Range_out;
pout <=p_Range_out;

end Behavioral;
