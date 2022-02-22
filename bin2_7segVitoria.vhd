library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin2_7segVitoria is
	port (
		data_in:	in std_logic_vector (5 downto 0);
		data_out: 	out std_logic_vector (6 downto 0)
	);
end bin2_7segVitoria;

architecture display of bin2_7segVitoria is

begin 

with data_in select data_out <=
		"0111011" when "111111",
		"0000000" when others;

end display;