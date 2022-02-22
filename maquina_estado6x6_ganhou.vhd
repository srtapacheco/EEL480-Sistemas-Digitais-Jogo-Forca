Library ieee;
USE ieee.std_logic_1164.all;

Entity maquina_estado6x6_ganhou is
    PORT(clk: in std_logic;
          x_in: in std_logic_vector(5 downto 0); --vai receber as 6 entradas da palavra chave
          saida_display_todos: out std_logic_vector(5 downto 0));
			 

End maquina_estado6x6_ganhou;

Architecture fsm of maquina_estado6x6_ganhou is
signal saida_display0,saida_display1,saida_display2,saida_display4,saida_display6,saida_display9: std_logic;

component maquina_estado_ganhou
PORT (clk: in std_logic;
          x_in: in std_logic; --vai receber uma entrada de cada vez
          saida_display: out std_logic);
end component;

    Begin

		  
		  sc0_display: maquina_estado_ganhou PORT MAP(clk,x_in(0),saida_display0);
		  sc1_display: maquina_estado_ganhou PORT MAP(clk,x_in(1),saida_display1);
		  sc2_display: maquina_estado_ganhou PORT MAP(clk,x_in(2),saida_display2);
		  sc4_display: maquina_estado_ganhou PORT MAP(clk,x_in(3),saida_display4);
		  sc6_display: maquina_estado_ganhou PORT MAP(clk,x_in(4),saida_display6);
		  sc9_display: maquina_estado_ganhou PORT MAP(clk,x_in(5),saida_display9);
		  saida_display_todos(0) <= saida_display0;
		  saida_display_todos(1) <= saida_display1;
		  saida_display_todos(2) <= saida_display2;
		  saida_display_todos(3) <= saida_display4;
		  saida_display_todos(4) <= saida_display6;
		  saida_display_todos(5) <= saida_display9;

End fsm;
            