----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/28/2022 09:49:22 PM
-- Design Name: 
-- Module Name: tb_neuralNetw - Behavioral
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

entity tb_neuralNetw is
--  Port ( );
end tb_neuralNetw;

architecture Behavioral of tb_neuralNetw is
component NeuralNetw_acc is
Port ( x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           w11,w12,w13,w14,w15,w21,w22,w23,w24,w25: in STD_LOGIC_VECTOR (7 downto 0);--weights from input layer to hidden layer
           wh1,wh2,wh3,wh4,wh5 : in STD_LOGIC_VECTOR (15 downto 0); --weights from  hidden layer to output layer
           bias : in STD_LOGIC_VECTOR (7 downto 0);
           Final_OUT : out STD_LOGIC_VECTOR (32 downto 0));
end component;

component NeuralNetw_approx is
Port ( x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           w11,w12,w13,w14,w15,w21,w22,w23,w24,w25: in STD_LOGIC_VECTOR (7 downto 0);--weights from input layer to hidden layer
           wh1,wh2,wh3,wh4,wh5 : in STD_LOGIC_VECTOR (15 downto 0); --weights from  hidden layer to output layer
           bias : in STD_LOGIC_VECTOR (7 downto 0);
           Final_OUT : out STD_LOGIC_VECTOR (32 downto 0));
end component;
signal x1 :  STD_LOGIC_VECTOR (7 downto 0);
signal x2 :  STD_LOGIC_VECTOR (7 downto 0);
signal w11,w12,w13,w14,w15,w21,w22,w23,w24,w25: STD_LOGIC_VECTOR (7 downto 0);--weights from input layer to hidden layer
signal wh1,wh2,wh3,wh4,wh5 :  STD_LOGIC_VECTOR (15 downto 0); --weights from  hidden layer to output layer
signal  bias :  STD_LOGIC_VECTOR (7 downto 0);
signal ACCURATE_NETW:STD_LOGIC_VECTOR (31 downto 0);
signal APPROXIMATE_NETW:STD_LOGIC_VECTOR (31 downto 0);
begin
uut:NeuralNetw_acc port map(x1,x2, w11,w12,w13,w14,w15,w21,w22,w23,w24,w25,wh1,wh2,wh3,wh4,wh5,bias,ACCURATE_NETW);
uut2:NeuralNetw_approx port map(x1,x2, w11,w12,w13,w14,w15,w21,w22,w23,w24,w25,wh1,wh2,wh3,wh4,wh5,bias,APPROXIMATE_NETW);
stim_proc: process
begin 
--write test vsalues here also test mac16 acc and approx
end process;


end Behavioral;
