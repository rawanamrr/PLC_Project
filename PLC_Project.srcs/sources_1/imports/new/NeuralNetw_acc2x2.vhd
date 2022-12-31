
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NeuralNetw_acc2x2 is
Port ( x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           w11,w12,w13,w14,w15,w21,w22,w23,w24,w25: in STD_LOGIC_VECTOR (7 downto 0);--weights from input layer to hidden layer
           wh1,wh2,wh3,wh4,wh5 : in STD_LOGIC_VECTOR (15 downto 0); --weights from  hidden layer to output layer
           bias : in STD_LOGIC_VECTOR (7 downto 0);
           clk: in std_logic;
           Final_OUT : out STD_LOGIC_VECTOR (31 downto 0));
end NeuralNetw_acc2x2;

architecture Behavioral of NeuralNetw_acc2x2 is

component MAC_acc16_2x2 is
    Port ( x1,x2,x3,x4,x5 : in STD_LOGIC_VECTOR (15 downto 0);
           w1,w2,w3,w4,w5 : in STD_LOGIC_VECTOR (15 downto 0);
           bias : in STD_LOGIC_VECTOR (15 downto 0);
           macaccout : out STD_LOGIC_VECTOR (34 downto 0));
end component;


component Act_32bits is
    Port ( in1 : in STD_LOGIC_VECTOR (34 downto 0);
           out_act32 : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component HiddenNeuron_acc2x2 is
Port ( x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           w1 : in STD_LOGIC_VECTOR (7 downto 0);
           w2 : in STD_LOGIC_VECTOR (7 downto 0);
           bias : in STD_LOGIC_VECTOR (7 downto 0);
           Neuron_OUT : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal HN1_sig : STD_LOGIC_VECTOR(15 downto 0);
signal HN2_sig : STD_LOGIC_VECTOR(15 downto 0);
signal HN3_sig : STD_LOGIC_VECTOR(15 downto 0);
signal HN4_sig : STD_LOGIC_VECTOR(15 downto 0);
signal HN5_sig : STD_LOGIC_VECTOR(15 downto 0);
signal M1,M2 : STD_LOGIC_VECTOR(32 downto 0);
signal FINAL_MAC: STD_LOGIC_VECTOR(34 downto 0);
signal activeFn_sig: STD_LOGIC_VECTOR(31 downto 0);
signal bias_out: STD_LOGIC_VECTOR(15 downto 0);
begin
HN_1:HiddenNeuron_acc2x2 port map(x1,x2,w11,w21,bias,HN1_sig);
HN_2:HiddenNeuron_acc2x2 port map(x1,x2,w12,w22,bias,HN2_sig);
HN_3:HiddenNeuron_acc2x2 port map(x1,x2,w13,w23,bias,HN3_sig);
HN_4:HiddenNeuron_acc2x2 port map(x1,x2,w14,w24,bias,HN4_sig);
HN_5:HiddenNeuron_acc2x2 port map(x1,x2,w15,w25,bias,HN5_sig);

bias_out<="00000000"&bias;

MAC:MAC_acc16_2x2 port map(HN1_sig,HN2_sig,HN3_sig,HN4_sig,HN5_sig,wh1,wh2,wh3,wh4,wh5,bias_out,FINAL_MAC);
aciveFn:Act_32bits port map(FINAL_MAC,activeFn_sig);

Final_OUT<=activeFn_sig;

end Behavioral;
