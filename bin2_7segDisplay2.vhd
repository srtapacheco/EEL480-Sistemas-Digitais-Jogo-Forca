

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin2_7segDisplay2 is
	port (
		data_in:	in std_logic_vector (5 downto 0);
		data_out: 	out std_logic_vector (6 downto 0)
	);
end bin2_7segDisplay2;

architecture display of bin2_7segDisplay2 is

begin 

	data_out <= "1011011" when data_in(3) = '1'
	else "0001000";
	
end display;