-- Elementos de Sistemas
-- developed by Luciano Soares
-- 1 tb_q1_ControlUnit.vhd
-- date: 4/4/2017

Library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_ControlUnit3 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_controlUnit3 is

  component controlUnit3 is
      port(
        	instruction                 : in STD_LOGIC_VECTOR(17 downto 0);
		zr,ng                       : in STD_LOGIC;
		muxALUI                     : out STD_LOGIC;                
		muxAM                       : out STD_LOGIC;  
		zx, nx, zy, ny, f, no       : out STD_LOGIC;
		loadA, loadD, loadM, loadPC : out STD_LOGIC
        );
  end component;

  signal clk : std_logic := '0';
  signal instruction                 : STD_LOGIC_VECTOR(17 downto 0) := (others => '0');
  signal zr,ng                       : STD_LOGIC := '0';
  signal muxALUI                     : STD_LOGIC := '0';
  signal muxAM                       : STD_LOGIC := '0';
  signal zx, nx, zy, ny, f, no       : STD_LOGIC := '0';
  signal loadA, loadD                : STD_LOGIC := '0'; 
  signal loadM, loadPC		     : STD_LOGIC := '0';

begin

	uCU: controlUnit3 port map(instruction, zr, ng, muxALUI, muxAM, zx, nx, zy, ny, f, no, loadA, loadD, loadM, loadPC);

	clk <= not clk after 100 ps;

  main : process
    begin
      test_runner_setup(runner, runner_cfg);

    instruction <= "00" & "000" & "000010" & "0001" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '1')
      report "**Falha** Teste 1 - muxALUI" severity error;
      
    instruction <= "00" & "000" & "000010" & "0001" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '1' and loadA = '1')
      report "**Falha** Teste 1 - muxALUI LoadA" severity error;
      
    instruction <= "00" & "000" & "000010" & "0001" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '1'  and loadA = '1'  and loadD = '0')
      report "**Falha** Teste 1 - muxALUI LoadA LoadD" severity error;
 
    instruction <= "01" & "000" & "000010" & "0010" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '1')
      report "**Falha** Teste 2 - muxALUI" severity error;
 
    instruction <= "01" & "000" & "000010" & "0010" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '1' and loadD = '1')
      report "**Falha** Teste 2 - muxALUI LoadD" severity error;
      
    instruction <= "01" & "000" & "000010" & "0010" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '1'  and loadD = '1'  and loadA = '0')
      report "**Falha** Teste 2 - muxALUI LoadA LoadD" severity error; 
 
    instruction <= "11" & "000" & "000010" & "0011" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '1')
      report "**Falha** Teste 3 - muxALUI" severity error;
 
    instruction <= "11" & "000" & "000010" & "0011" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '1' and loadD = '1')
      report "**Falha** Teste 3 - muxALUI LoadD" severity error;
      
    instruction <= "11" & "000" & "000010" & "0011" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '1'  and loadD = '1'  and loadA = '1')
      report "**Falha** Teste 3 - muxALUI LoadA LoadD" severity error;  
 
    instruction <= "10" & "000" & "000010" & "0011" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '0')
      report "**Falha** Teste 4 - muxALUI" severity error;
 
    instruction <= "10" & "000" & "000010" & "0011" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '0' and loadD = '1')
      report "**Falha** Teste 4 - muxALUI LoadD" severity error;
      
    instruction <= "10" & "000" & "000010" & "0011" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '0'  and loadD = '1'  and loadA = '1')
      report "**Falha** Teste 4 - muxALUI LoadA LoadD" severity error;  
 
    instruction <= "10" & "000" & "000010" & "0001" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '0')
      report "**Falha** Teste 5 - muxALUI" severity error;
 
    instruction <= "10" & "000" & "000010" & "0001" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '0' and loadA = '1')
      report "**Falha** Teste 5 - muxALUI LoadA" severity error;
      
    instruction <= "10" & "000" & "000010" & "0001" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '0'  and loadD = '0'  and loadA = '1')
      report "**Falha** Teste 5 - muxALUI LoadA LoadD" severity error;   
 
    instruction <= "10" & "000" & "000010" & "0010" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '0')
      report "**Falha** Teste 6 - muxALUI" severity error;
 
    instruction <= "10" & "000" & "000010" & "0010" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '0' and loadD = '1')
      report "**Falha** Teste 6 - muxALUI LoadD" severity error;
      
    instruction <= "10" & "000" & "000010" & "0010" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '0'  and loadD = '1'  and loadA = '0')
      report "**Falha** Teste 6 - muxALUI LoadA LoadD" severity error;    
 
    instruction <= "10" & "000" & "000010" & "0011" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '0')
      report "**Falha** Teste 7 - muxALUI" severity error;
 
    instruction <= "10" & "000" & "000010" & "0011" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '0' and loadD = '1')
      report "**Falha** Teste 7 - muxALUI LoadD" severity error;
      
    instruction <= "10" & "000" & "000010" & "0011" & "000";
    zr <= '0';  ng <= '0';
    wait until clk = '1';
    assert(muxALUI = '0'  and loadD = '1'  and loadA = '1')
      report "**Falha** Teste 7 - muxALUI LoadA LoadD" severity error;   
 

    test_runner_cleanup(runner); -- Simulation ends here

	wait;
  end process;
end architecture;
