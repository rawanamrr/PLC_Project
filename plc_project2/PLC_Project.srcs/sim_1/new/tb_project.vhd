----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/14/2022 11:58:45 AM
-- Design Name: 
-- Module Name: tb_project - Behavioral
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

entity tb_project is
   
end tb_project;

 architecture Behavioral of tb_project is
component Project is
port (Clk: in std_logic       ;
		 Rst    : in std_logic  ;
		 L1  : out std_logic ;
		 L2   : out std_logic ;
		 Motor : out std_logic ;
		 pump : out std_logic );
END component;
--signal onof_test :  std_logic; 
signal Clk_test: std_logic;
signal Rst_test : std_logic;

signal L1_test : std_logic; 
signal L2_test   :std_logic ;
signal Motor_test : std_logic; 
signal pump_test : std_logic; 
 

begin
uut:  Project Port Map(
Clk_test,Rst_test,L1_test,L2_test,Motor_test,pump_test);
stim_process: process
begin
--Rst_test<='1';wait for 60 ns;
Rst_test<='0';wait for 30 ns;
end process;

stim_proc2: process
begin
Clk_test <= '0' ; wait for 0.5 ns;
Clk_test <= '1' ; wait for 0.5 ns ;

end process;

end Behavioral;
