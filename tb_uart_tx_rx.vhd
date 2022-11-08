library ieee;
use ieee.std_logic_1164.all;
--USE ieee.numeric_std.ALL;

entity tb_uart_tx_rx is
end tb_uart_tx_rx;

architecture behavior of tb_uart_tx_rx is

   -- Component Declaration for the Unit Under Test (UUT)

   component uart_tx_rx
      port (
         tx_data : in STD_LOGIC_VECTOR(7 downto 0);
         tx_start : in STD_LOGIC;
         tx_done : out STD_LOGIC;
         tx_q : out STD_LOGIC;
         clock : in STD_LOGIC;
         reset : in STD_LOGIC
      );
   end component;
   --Inputs
   signal tx_data : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
   signal tx_start : STD_LOGIC := '0';
   signal clk : STD_LOGIC := '0';
   signal reset : STD_LOGIC := '0';

   --Outputs
   signal tx_done : STD_LOGIC;
   signal tx_q : STD_LOGIC;

   -- Clock period definitions
   constant clk_period : TIME := 10 ns;

begin

   -- Instantiate the Unit Under Test (UUT)
   uut : uart_tx_rx port map(
      tx_data => tx_data,
      tx_start => tx_start,
      tx_done => tx_done,
      tx_q => tx_q,
      clock => clk,
      reset => reset
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
      tx_data <= "00101010";
      tx_start <= '0';
      wait for 10ns;
      reset <= '0';
      wait for 10ns;
      tx_start <= '1';
      wait for 10ns;
      tx_start <= '0';
      wait;
   end process;

end;