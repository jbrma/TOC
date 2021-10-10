----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2021 09:32:08
-- Design Name: 
-- Module Name: contadorMod16 - Behavioral
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

entity contadorMod16 is
    Port (
        rst : IN std_logic;
        clk : IN std_logic;
        cuenta : IN std_logic;
        salida : OUT std_logic_vector(3 downto 0)
    );
end contadorMod16;



architecture Behavioral of contadorMod16 is

 component  sumador is
   Port (
   A : IN   std_logic_vector(3 downto 0);
   B : IN   std_logic_vector(3 downto 0);
   C : OUT  std_logic_vector(3 downto 0)   
  );
end component;

signal A: std_logic_vector(3 downto 0);
signal B: std_logic_vector(3 downto 0);
signal C: std_logic_vector(3 downto 0);
--component sumador is 
  --  port(A, B: in bit; C: out bit);
  -- end component sumador;

component registro is
  Port (
   rst  : IN  std_logic;
    clk  : IN  std_logic;
    load : IN  std_logic;
    E    : IN  std_logic_vector(3 downto 0);
    S    : OUT std_logic_vector(3 downto 0)   
  );
end component;
signal E: std_logic_vector(3 downto 0);
signal S: std_logic_vector(3 downto 0);
--component registro is
--port(rst, clk, load: in bit; E: in bit_vector; S: out std_logic_vector(3 downto 0));
--end component registro;

begin

suma: sumador PORT MAP ("0001", S, C);
     
reg: registro PORT MAP ( rst,clk, cuenta, C, S);
    salida <= S;

end Behavioral;
