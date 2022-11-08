library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

-- 12 bits
-- modulo 2603

entity contador_modulo_N is
    port (
        clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        q : out STD_LOGIC_VECTOR (11 downto 0));
end contador_modulo_N;

architecture Behavioral of contador_modulo_N is
    signal r_reg, r_siguiente : unsigned(11 downto 0);
begin
    -- registros
    process (clk)
    begin
        if (clk'event and clk = '1') then
            if (reset = '1') then
                r_reg <= (others => '0');
            else
                r_reg <= r_siguiente;
            end if;
        end if;
    end process;

    -- estado siguiente
    r_siguiente <= (others => '0') when r_reg = "101000101010" else
        r_reg + 1;
    -- logica de salida
    q <= STD_LOGIC_VECTOR(r_reg);
end Behavioral;