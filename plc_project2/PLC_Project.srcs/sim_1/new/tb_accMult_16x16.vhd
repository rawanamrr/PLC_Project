

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_accMult_16x16 is
--  Port ( );
end tb_accMult_16x16;

architecture Behavioral of tb_accMult_16x16 is

component accMult_16x16 is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           res : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component approxMult_16x16 is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           res : out STD_LOGIC_VECTOR (31 downto 0));
end component;

signal x_sig,y_sig: STD_logic_vector (15 downto 0);
signal ACCURATE_sig,APPROXIMATE_sig: STD_logic_vector (31 downto 0);


begin

uut: accMult_16x16 port map(x_sig,y_sig,ACCURATE_sig);
uut2: approxMult_16x16 port map(x_sig,y_sig,APPROXIMATE_sig);


hussien: process
begin

x_sig <= "0000000000000000";y_sig <="0000000000000000"; wait for 10 ns;
x_sig <= "1111111111111111";y_sig <="1111111111111111"; wait for 10 ns;
x_sig <= "1111000011110000";y_sig <="0001100000011000"; wait for 10 ns;
x_sig <= "0100000101000001";y_sig <="0010001000100010"; wait for 10 ns;
x_sig <= "0001000000010000";y_sig <="0000001000000010"; wait for 10 ns;
x_sig <= "0111110001111100";y_sig <="1111001011110010"; wait;

end process;

end Behavioral;
