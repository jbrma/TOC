----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.10.2021 20:59:33
-- Design Name: 
-- Module Name: mul8_2 - Behavioral
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

entity mult8b is
    port(X : in  std_logic_vector(3 downto 0);
         Y : in  std_logic_vector(3 downto 0);
         Z : out std_logic_vector(7 downto 0));
end mult8b;

architecture Behavioral of mult8b is

-- COMPONENTS
 component  sum8 is
   Port (
   X : IN   std_logic_vector(7 downto 0);
   Y : IN   std_logic_vector(7 downto 0);
   Z : OUT   std_logic_vector(7 downto 0)
  );
end component;

--SIGNALS

signal sum1_X : std_logic_vector(7 downto 0);
signal sum1_Y : std_logic_vector(7 downto 0);
signal sum1_Z : std_logic_vector(7 downto 0);
signal sum2_X : std_logic_vector(7 downto 0);
signal sum2_Z : std_logic_vector(7 downto 0);
signal sum3_X : std_logic_vector(7 downto 0);
signal sum3_Z : std_logic_vector(7 downto 0);

begin

sum1_X <= "0000"&X when(Y(0) = '1') else (others => '0');
sum1_Y <= "000"&X&"0" when(Y(1) = '1') else (others => '0');
sum2_X <= "00"&X&"00" when(Y(2) = '1') else (others => '0');
sum3_X <= "0"&X&"000" when(Y(3) = '1') else (others => '0');


sum8_1 : sum8 PORT MAP(X => sum1_X, Y => sum1_Y, Z => sum1_Z);
sum8_2 : sum8 PORT MAP(X => sum2_X, Y => sum1_Z, Z => sum2_Z);
sum8_3 : sum8 PORT MAP(X => sum3_X, Y => sum2_Z, Z => sum3_Z);

Z <= sum3_z;

end Behavioral;
