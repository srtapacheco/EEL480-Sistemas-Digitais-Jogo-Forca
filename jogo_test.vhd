library ieee; 
use IEEE.STD_LOGIC_1164.ALL; 
use std.textio.all;



Entity jogo_test is
End jogo_test;


Architecture test of jogo_test is

signal x_in_teste: std_logic_vector(9 downto 0);  -- inputs 
signal clk_teste: std_logic;  -- inputs 
signal clk_teste2: std_logic;  -- inputs 

signal vetor_leds_teste: std_logic_vector (2 downto 0); -- outputs

signal data_out_0_teste,data_out_1_teste,data_out_2_teste,data_out_4_teste,data_out_6_teste,data_out_9_teste: std_logic_vector (6 downto 0); -- outputs


signal saida1_display_perdeu_teste, saida2_display_ganhou_teste: std_logic_vector (6 downto 0); -- outputs



-- Geração de estímulos
Begin

 -- Instância do componente ALU para interconexão do componente com o processo de estímulo
	 	 
sc_jogo_forca: entity work.jogo_forca port map (clk => clk_teste,clk2=>clk_teste2, x_in => x_in_teste,vetor_leds=>vetor_leds_teste ,data_out_0 => data_out_0_teste,data_out_1=>data_out_1_teste,data_out_2 =>data_out_2_teste,data_out_4=>data_out_4_teste,data_out_6=>data_out_6_teste,data_out_9=>data_out_9_teste,saida1_display_perdeu => saida1_display_perdeu_teste,saida2_display_ganhou =>saida2_display_ganhou_teste );


clk_teste <=  '0', 	'1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, 
							'1' after 25 ns, '0' after 30 ns, '1' after 35 ns, '0' after 40 ns,
							'1' after 45 ns, '0' after 50 ns, '1' after 55 ns, '0' after 60 ns,
							'1' after 65 ns, '0' after 70 ns, '1' after 75 ns, '0' after 80 ns;
							
clk_teste2 <=  '0', 	'1' after 5.01 ns, '0' after 10.01 ns, '1' after 15.01 ns, '0' after 20.01 ns, 
							'1' after 25.01 ns, '0' after 30.01 ns, '1' after 35.01 ns, '0' after 40.01 ns,
						'1' after 45.01 ns, '0' after 50.01 ns, '1' after 55.01 ns, '0' after 60.01 ns,
						'1' after 65.01 ns, '0' after 70.01 ns, '1' after 75.01 ns, '0' after 80.01 ns;

--teste acerta palavra secreta e ganha o jogo
--x_in_teste  <= "1000000000", "0100000000" after 10 ns, "0010000000" after 20 ns, "0000100000" after 30 ns,"0000001000" after 40 ns,"0000000001" after 50 ns;
--(0--1--2--4--6--9)

--teste perde as 3 vidas e perde o jogo
--x_in_teste  <= "0001000000", "0000000000" after 10 ns, "0000010000" after 20 ns, "0000000000" after 30 ns,"0000000100" after 40 ns,"0000000000" after 50 ns;
--(3--reset--5--reset--7--reset)

--teste acende dois switchs ao mesmo tempo e vai pro estado reset
--x_in_teste  <= "0100000000", "1100000000" after 10 ns, "0010000000" after 20 ns, "0000000000" after 30 ns, "0000100000" after 40 ns, "0001000000" after 50 ns;
--(1--0/1--2--reset--4--3)

--teste ainda nao ganhou erra/acerta
x_in_teste  <= "0010000000", "0001000000" after 10 ns, "0000000000" after 20 ns, "1000000000" after 30 ns, "0000100000" after 40 ns, "0000000100" after 50 ns;
--(2--3--reset--0--4--7)


End test;