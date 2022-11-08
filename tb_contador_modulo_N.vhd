library ieee;
use ieee.std_logic_1164.all;
--USE ieee.numeric_std.ALL;

entity tb_contador_modulo_N is
end tb_contador_modulo_N;

architecture behavior of tb_contador_modulo_N is

   -- Component Declaration for the Unit Under Test (UUT)

   component contador_modulo_N
      port (
         clk : in STD_LOGIC;
         reset : in STD_LOGIC;
         q : out STD_LOGIC_VECTOR(11 downto 0)
      );
   end component;
   --Inputs
   signal clk : STD_LOGIC := '0';
   signal reset : STD_LOGIC := '0';

   --Outputs
   signal q : STD_LOGIC_VECTOR(11 downto 0);

   -- Clock period definitions
   constant clk_period : TIME := 10 ns;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut : contador_modulo_N port map(
      clk => clk,
      reset => reset,
      q => q
   );

   -- Clock process definitions
   clk_process : process
   begin
      clk <= '0';
      wait for clk_period/2;
      clk <= '1';
      wait for clk_period/2;
   end process;
   -- Stimulus process
   stim_proc : process
   begin
      -- hold reset state for 100 ns.
      wait for 100 ns;

      wait for clk_period * 10;

      -- insert stimulus here 

      reset <= '1';
      wait for 10 ns;
      reset <= '0';

      wait;
   end process;

end;