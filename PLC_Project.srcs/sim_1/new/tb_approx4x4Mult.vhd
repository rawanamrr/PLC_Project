----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/26/2022 02:20:18 PM
-- Design Name: 
-- Module Name: tb_acc4x4Mult - Behavioral
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
use ieee.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_approx4x4Mult is
--  Port ( );
end tb_approx4x4Mult;

architecture Behavioral of tb_approx4x4Mult is
component approxMult_4x4 is
  Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
         y : in STD_LOGIC_VECTOR (3 downto 0);
         res : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component approxMult_4x4v2 is
  Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
         y : in STD_LOGIC_VECTOR (3 downto 0);
         res : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component accMult_4x4 is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           res : out STD_LOGIC_VECTOR (7 downto 0));
end component ;

signal x_sig,y_sig : std_logic_vector(3 downto 0);
signal ACCURATE_sig : std_logic_vector(7 downto 0);
signal APPROXIMATE_sig : std_logic_vector(7 downto 0);
signal APPROXIMATE_V2_sig : std_logic_vector(6 downto 0);
--signal error : std_logic_vector(9 downto 0);
begin
uut: approxMult_4x4 port map(x_sig,y_sig,APPROXIMATE_sig);
uut2: accMult_4x4 port map(x_sig,y_sig,ACCURATE_sig);
uut3: approxMult_4x4v2 port map(x_sig,y_sig,APPROXIMATE_V2_sig);
stim_proc: process
begin 
--error<=ACCURATE_sig-APPROXIMATE_sig;
--x_sig<="0000";
--y_sig<="0000";
--addr:for i in 0 to 255 loop
----x_sig<=x_sig+1;
--x_sig <= to_unsigned(0, 15);
--x_sig <= std_logic_vector( x_sig + 1 );
--for j in 0 to 255 loop
----y_sig<=y_sig+1;
--y_sig <= to_unsigned(0, 15);
--y_sig <= std_logic_vector( y_sig + 1 );
--wait for 10 ns
--end loop;

--end loop;

x_sig<="1111";y_sig<="0000"; wait for 10 ns;
x_sig<="1111";y_sig<="0001"; wait for 10 ns;
x_sig<="1111";y_sig<="0010"; wait for 10 ns;
x_sig<="1111";y_sig<="0011"; wait for 10 ns;

x_sig<="1111";y_sig<="0100"; wait for 10 ns;
x_sig<="1111";y_sig<="0101"; wait for 10 ns;
x_sig<="1111";y_sig<="0110"; wait for 10 ns;
x_sig<="1111";y_sig<="0111"; wait for 10 ns;

x_sig<="1111";y_sig<="1000"; wait for 10 ns;
x_sig<="1111";y_sig<="1001"; wait for 10 ns;
x_sig<="1111";y_sig<="1010"; wait for 10 ns;
x_sig<="1111";y_sig<="1011"; wait for 10 ns;

x_sig<="1111";y_sig<="1100"; wait for 10 ns;
x_sig<="1111";y_sig<="1101"; wait for 10 ns;
x_sig<="1111";y_sig<="1110"; wait for 10 ns;
x_sig<="1111";y_sig<="1111"; wait;

--error<=ACCURATE_sig-APPROXIMATE_sig;
--error <= std_logic_vector(unsigned(ACCURATE_sig) - unsigned(APPROXIMATE_sig));
end process;

end Behavioral;
