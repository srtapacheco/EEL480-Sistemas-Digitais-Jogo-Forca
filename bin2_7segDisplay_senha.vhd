library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin2_7segDisplay_senha is
	port (
		data_in:	in std_logic_vector (5 downto 0);
		data_out_0: out std_logic_vector (6 downto 0);
		data_out_1: out std_logic_vector (6 downto 0);
		data_out_2: out std_logic_vector (6 downto 0);
		data_out_4: out std_logic_vector (6 downto 0);
		data_out_6: out std_logic_vector (6 downto 0);
		data_out_9: out std_logic_vector (6 downto 0));
		
end bin2_7segDisplay_senha;

architecture display of bin2_7segDisplay_senha is

component bin2_7segDisplay0
PORT (data_in:	in std_logic_vector (5 downto 0);
		data_out: 	out std_logic_vector (6 downto 0));
end component;

component bin2_7segDisplay1
PORT (data_in:	in std_logic_vector (5 downto 0);
		data_out: 	out std_logic_vector (6 downto 0));
end component;

component bin2_7segDisplay2
PORT (data_in:	in std_logic_vector (5 downto 0);
		data_out: 	out std_logic_vector (6 downto 0));
end component;


component bin2_7segDisplay4
PORT (data_in:	in std_logic_vector (5 downto 0);
		data_out: 	out std_logic_vector (6 downto 0));
end component;

component bin2_7segDisplay6
PORT (data_in:	in std_logic_vector (5 downto 0);
		data_out: 	out std_logic_vector (6 downto 0));
end component;

component bin2_7segDisplay9
PORT (data_in:	in std_logic_vector (5 downto 0);
		data_out: 	out std_logic_vector (6 downto 0));
end component;

begin 

sc0_7segmentos: bin2_7segDisplay0 PORT MAP(data_in,data_out_0);
sc1_7segmentos: bin2_7segDisplay1 PORT MAP(data_in,data_out_1);
sc2_7segmentos: bin2_7segDisplay2 PORT MAP(data_in,data_out_2);
sc4_7segmentos: bin2_7segDisplay4 PORT MAP(data_in,data_out_4);
sc6_7segmentos: bin2_7segDisplay6 PORT MAP(data_in,data_out_6);
sc9_7segmentos: bin2_7segDisplay9 PORT MAP(data_in,data_out_9);



end display;