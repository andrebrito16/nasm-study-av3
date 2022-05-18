-- Elementos de Sistemas
-- developed by Luciano Soares
-- date: 4/4/2017
-- Modificação:
--   - Renan : prova Av3
--
-- Unidade que controla os componentes da CPU

library ieee;
use ieee.std_logic_1164.all;

entity controlUnit3 is
    port(
		instruction                 : in STD_LOGIC_VECTOR(17 downto 0);
		zr,ng                       : in STD_LOGIC;
		muxALUI                   : out STD_LOGIC;                
		muxAM                       : out STD_LOGIC;  
		zx, nx, zy, ny, f, no       : out STD_LOGIC;
		loadA, loadD, loadM, loadPC : out STD_LOGIC
    );
end entity;

architecture arch of controlUnit3 is

begin

  --=================================--
  -- implementar somente o sinal do MuxALUI e os sinais de load dos registradores %A e %D.
  -- não precisa implementar os demais
  --=================================--

  -- Sinal do MUX ALUI
  muxALUI <= '0' when instruction(17 downto 16) = "10" else '1';

  -- Sinal de Load do Registrador A
  loadA <= (not(instruction(17)) and not(instruction(16))) or 
      (instruction(17) and not(instruction(16)) and (instruction(3))) or 
      (instruction(17) and (instruction(16)));
  -- Sinal de LOAD do Registrador D
  loadD <= (instruction(17) and not(instruction(16)) and instruction(4)) or
  (instruction(17) and instruction(16)) or
  (not(instruction(17)) and instruction(16));

end architecture;
