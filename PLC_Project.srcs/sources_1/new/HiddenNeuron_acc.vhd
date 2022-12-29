

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity HiddenNeuron_acc is
Port ( x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           w1 : in STD_LOGIC_VECTOR (7 downto 0);
           w2 : in STD_LOGIC_VECTOR (7 downto 0);
           bias : in STD_LOGIC_VECTOR (7 downto 0);
           Neuron_OUT : out STD_LOGIC_VECTOR (15 downto 0));
end HiddenNeuron_acc;

architecture Behavioral of HiddenNeuron_acc is
component MAC_acc is
    Port ( x1 : in STD_LOGIC_VECTOR (7 downto 0);
           x2 : in STD_LOGIC_VECTOR (7 downto 0);
           w1 : in STD_LOGIC_VECTOR (7 downto 0);
           w2 : in STD_LOGIC_VECTOR (7 downto 0);
           bias : in STD_LOGIC_VECTOR (7 downto 0);
           macaccout : out STD_LOGIC_VECTOR (16 downto 0));
end component;
component Act_16bits is
    Port ( in1 : in STD_LOGIC_VECTOR (16 downto 0);
           out_act16 : out STD_LOGIC_VECTOR (15 downto 0));
end component;
signal MAC_sig :STD_LOGIC_VECTOR (16 downto 0);
signal activeFn_sig: STD_LOGIC_VECTOR (15 downto 0);
begin
MAC: MAC_acc port map(x1,x2,w1,w2,bias,MAC_sig);
activeFn: Act_16bits port map(MAC_sig,activeFn_sig);

Neuron_OUT<=activeFn_sig;
end Behavioral;
