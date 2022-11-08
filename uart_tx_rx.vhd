library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity uart_tx_rx is
    port (
        tx_data : in STD_LOGIC_VECTOR (7 downto 0);
        tx_start : in STD_LOGIC;
        tx_done : out STD_LOGIC;
        tx_q : out STD_LOGIC;
        clock : in STD_LOGIC;
        reset : in STD_LOGIC);
end uart_tx_rx;

architecture Behavioral of uart_tx_rx is
    ----------------- TX signals -----------------
    type tx_state_type is (st1_idle, st2_load, st3_transmission);
    signal tx_state, tx_next_state : tx_state_type;

    signal tx_clock_counter : unsigned(11 downto 0);
    signal tx_clock_counter_clear : STD_LOGIC;
    signal tx_clock_counter_increment : STD_LOGIC;
    signal tx_clock_counter_keep : STD_LOGIC;

    signal tx_bit_counter : unsigned(3 downto 0);
    signal tx_bit_counter_clear : STD_LOGIC;
    signal tx_bit_counter_increment : STD_LOGIC;
    signal tx_bit_counter_keep : STD_LOGIC;

    signal tx_shift_register : STD_LOGIC_VECTOR(9 downto 0);
    signal tx_shift_register_keep : STD_LOGIC;
    signal tx_shift_register_load : STD_LOGIC;
    signal tx_shift_register_shift : STD_LOGIC;

    signal tx_data_register : STD_LOGIC_VECTOR(7 downto 0);
    signal tx_done_signal : STD_LOGIC;
    ----------------------------------------------
begin
    --------------------- TX ---------------------

    --shift register process
    tx_shift_register_process : process (
        clock,
        tx_shift_register_keep,
        tx_shift_register_load,
        tx_shift_register_shift)
    begin
        if (clock'event and clock = '1') then
            if reset = '1' then
                tx_shift_register <= (others => '0');
            elsif tx_shift_register_load = '1' then
                tx_shift_register <= '1' & tx_data & '0';
            elsif tx_shift_register_shift = '1' then
                tx_shift_register <= '1' & tx_shift_register(9 downto 1);
            elsif tx_shift_register_keep = '1' then
                tx_shift_register <= tx_shift_register;
            end if;
        end if;
    end process;

    -- bit counter process
    tx_bit_counter_process : process (
        clock,
        tx_bit_counter_clear,
        tx_bit_counter_increment,
        tx_bit_counter_keep)
    begin
        if (clock'event and clock = '1') then
            if (reset = '1' or tx_bit_counter_clear = '1') then
                tx_bit_counter <= (others => '0');
            elsif tx_bit_counter_increment = '1' then
                tx_bit_counter <= tx_bit_counter + 1;
            elsif tx_bit_counter_keep = '1' then
                tx_bit_counter <= tx_bit_counter;
            end if;
        end if;
    end process;

    -- clock counter process
    tx_clock_counter_process : process (
        clock,
        tx_clock_counter_clear,
        tx_clock_counter_increment,
        tx_clock_counter_keep)
    begin
        if (clock'event and clock = '1') then
            if (reset = '1' or tx_clock_counter_clear = '1') then
                tx_clock_counter <= (others => '0');
            elsif tx_clock_counter_increment = '1' then
                tx_clock_counter <= tx_clock_counter + 1;
            elsif tx_clock_counter_keep = '1' then
                tx_clock_counter <= tx_clock_counter;
            end if;
        end if;
    end process;

    -- synchronous process
    tx_sync_process : process (clock, reset)
    begin
        if (clock'event and clock = '1') then
            if (reset = '1') then
                tx_state <= st1_idle;
            else
                tx_state <= tx_next_state;
            end if;
        end if;
    end process;

    -- next state
    tx_next_state_decode : process (
        tx_state,
        tx_start,
        tx_data,
        tx_clock_counter,
        tx_bit_counter,
        tx_shift_register)
    begin
        tx_next_state <= tx_state; -- por defecto mismo estado

        case(tx_state) is
            when (st1_idle) =>
            if tx_start = '1' then
                tx_next_state <= st2_load;
            end if;
            when (st2_load) =>
            tx_next_state <= st3_transmission;
            when(st3_transmission) =>
            if tx_bit_counter = 9 then
                tx_next_state <= st1_idle;
            end if;
        end case;
    end process;

    -- output
    tx_output_decode : process (tx_state)
    begin
        -- valores por defecto
        tx_done_signal <= '0';
        tx_shift_register_keep <= '0';
        tx_shift_register_load <= '0';
        tx_shift_register_shift <= '0';

        tx_bit_counter_clear <= '0';
        tx_bit_counter_increment <= '0';
        tx_bit_counter_keep <= '0';

        tx_clock_counter_clear <= '0';
        tx_clock_counter_increment <= '0';
        tx_clock_counter_keep <= '0';

        if tx_state = st1_idle then
            tx_shift_register_keep <= '1';
            tx_clock_counter_keep <= '1';
            tx_bit_counter_keep <= '1';
            tx_done_signal <= '1';
        elsif tx_state = st2_load then
            tx_shift_register_load <= '1';
            tx_clock_counter_clear <= '1';
            tx_bit_counter_clear <= '1';
            tx_done_signal <= '0';
        elsif tx_state = st3_transmission then
            if tx_clock_counter = 2603 then
                tx_shift_register_keep <= '1';
                tx_clock_counter_increment <= '1';
                tx_bit_counter_keep <= '1';
            else
                tx_shift_register_shift <= '1';
                tx_clock_counter_clear <= '1';
                tx_bit_counter_increment <= '1';
            end if;
            tx_done_signal <= '0';
        end if;
    end process;

    tx_q <= tx_shift_register(0);
    tx_done <= tx_done_signal;
    ----------------------------------------------
end Behavioral;