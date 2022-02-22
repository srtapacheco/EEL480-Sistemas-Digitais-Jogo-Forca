Library ieee;
USE ieee.std_logic_1164.all;

Entity maquina_estado_ganhou is
    PORT(clk: in std_logic;
          x_in: in std_logic; --vai receber uma entrada de cada vez
          saida_display: out std_logic);
			 

End maquina_estado_ganhou;

Architecture fsm of maquina_estado_ganhou is
Type detector_estado is (S0display, S1display);
signal estado_anterior, estado_seguinte: detector_estado;	

    Begin
	 
	 
	 Process(clk)
		Begin
			if (rising_edge(clk)) then 
				estado_anterior <= estado_seguinte AFTER 2 ns;		
			End if;
    End Process;
	 
	 
	 Process(estado_anterior, x_in)
	 
        Begin
			Case estado_anterior is
			
				When S0display =>
					saida_display <= '0';
					if (x_in = '0') then
					  estado_seguinte <= S0display;
			  
					Elsif (x_in = '1') then
						estado_seguinte <= S1display;
					end if;
						
				When S1display =>
					saida_display <= '1';
					estado_seguinte <= S1display;
			end case;
	
		end process;
End fsm;
            