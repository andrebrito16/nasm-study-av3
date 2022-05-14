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


end architecture;
