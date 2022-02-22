Library ieee;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;



Entity jogo_forca is
    PORT(clk: in std_logic;
			clk2: in std_logic;
			x_in: in std_logic_vector(9 downto 0);
			
			vetor_leds: out std_logic_vector(2 downto 0); -- saida leds de vida
			
			data_out_0: out std_logic_vector (6 downto 0); -- saidas das chave secreta
			data_out_1: out std_logic_vector (6 downto 0);
			data_out_2: out std_logic_vector (6 downto 0);
			data_out_4: out std_logic_vector (6 downto 0);
			data_out_6: out std_logic_vector (6 downto 0);
			data_out_9: out std_logic_vector (6 downto 0);
			
			saida1_display_perdeu: out std_logic_vector (6 downto 0); -- saida do display P
			saida2_display_ganhou: out std_logic_vector(6 downto 0)); -- saida do display G
			 

End jogo_forca;

Architecture fsm of jogo_forca is
    Type detector_estado is (Sinicial, S0display, S1display, S2display,S4display,S6display,S9display,Sperde1,Sreset);
    signal estado_anterior, estado_seguinte: detector_estado;	 
	 signal saida1_contador: std_logic_vector(1 downto 0);
	 signal entrada2_display_vetor: std_logic_vector (5 downto 0); -- vetor com as entradas dos switchres que contem o numero secreto
	 signal saida_led1,saida_led2,saida_led3: std_logic;
	 signal saida2_vector_mq6: std_logic_vector(5 downto 0);
	 signal vetor_leds_temp: std_logic_vector(2 downto 0); -- vetor contendo todas as entradas de leds, enviadas para o conversor perdeu
	 
	 
	 
	component circuito_combinacional_perdeu
	PORT (x_vector: in std_logic_vector(1 downto 0);
		 saida_led1,saida_led2,saida_led3: out std_logic);
	end component;
	 
	component maquina_estado6x6_ganhou
	PORT(clk: in std_logic;
          x_in: in std_logic_vector(5 downto 0); 
          saida_display_todos: out std_logic_vector(5 downto 0)); 
	end component;
	
	
	component bin2_7segDisplay_senha
	PORT(data_in:	in std_logic_vector (5 downto 0);
		data_out_0: out std_logic_vector (6 downto 0);
		data_out_1: out std_logic_vector (6 downto 0);
		data_out_2: out std_logic_vector (6 downto 0);
		data_out_4: out std_logic_vector (6 downto 0);
		data_out_6: out std_logic_vector (6 downto 0);
		data_out_9: out std_logic_vector (6 downto 0)); 
	end component;
	
	
	
	component bin2_7segDerrota
	PORT(data_in:	in std_logic_vector (2 downto 0);
		data_out: 	out std_logic_vector (6 downto 0)); 
	end component;
	
	component bin2_7segVitoria
	PORT(data_in:	in std_logic_vector (5 downto 0);
		data_out: 	out std_logic_vector (6 downto 0)); 
	end component;
	
	
	 
    Begin
    
    Process(clk)
	 
	 variable contagem : integer range 0 to 3;
		Begin
			if (clk'EVENT and clk='1') then 
				estado_anterior <= estado_seguinte;		
		
				case estado_seguinte is
				
					when Sperde1 => contagem := contagem + 1;
					when Sinicial => contagem := contagem;
					when S0display => contagem := contagem;
					when S1display => contagem := contagem;
					when S2display => contagem := contagem;
					when S4display => contagem := contagem;
					when S6display => contagem := contagem;
					when S9display => contagem := contagem;
					when Sreset => contagem := contagem;
				end case;
				
				saida1_contador <= conv_std_logic_vector(contagem, 2);
				
			End if;
    End Process;
    

    
    Process(estado_anterior, x_in)
	 
        Begin
		  		  
		  
        Case estado_anterior is
            When Sinicial =>
              
                entrada2_display_vetor <= "000000";
					 
					if (x_in = "1000000000") then
					  estado_seguinte <= S0display;
			  
					Elsif (x_in = "0100000000") then
						estado_seguinte <= S1display;
						  
					Elsif (x_in = "0010000000") then
						estado_seguinte <= S2display;

					Elsif (x_in = "0001000000") then
						estado_seguinte <= Sperde1;
						  
					Elsif (x_in = "0000100000") then
						estado_seguinte <= S4display;
						  
					Elsif (x_in = "0000010000") then
						estado_seguinte <= Sperde1;
						  
					Elsif (x_in = "0000001000") then
						estado_seguinte <= S6display; 
						  
					Elsif (x_in = "0000000100") then
						estado_seguinte <= Sperde1;
						  
					Elsif (x_in = "0000000010") then
						estado_seguinte <= Sperde1;
						  
					Elsif (x_in = "0000000001") then
						estado_seguinte <= S9display;
					Else
						estado_seguinte <= Sinicial;
					End if;
				  
			 
				When S0display =>
                
					
					entrada2_display_vetor <= "100000";

					if (x_in = "1000000000") then
						estado_seguinte <= S0display;
						  
					Elsif (x_in = "0100000000") then
						estado_seguinte <= S1display;
						  
					Elsif (x_in = "0010000000") then
						estado_seguinte <= S2display;

					Elsif (x_in = "0001000000") then
						estado_seguinte <= Sperde1;
						  
					Elsif (x_in = "0000100000") then
						estado_seguinte <= S4display;
						  
					Elsif (x_in = "0000010000") then
						estado_seguinte <= Sperde1;
						  
					Elsif (x_in = "0000001000") then
						estado_seguinte <= S6display; 
						  
					Elsif (x_in = "0000000100") then
						estado_seguinte <= Sperde1;
						  
					Elsif (x_in = "0000000010") then
						estado_seguinte <= Sperde1;
						  
					Elsif (x_in = "0000000001") then
						estado_seguinte <= S9display;
						  
					Elsif (x_in = "0000000000") then
						estado_seguinte <= Sinicial;
					Else
						estado_seguinte <= Sreset;
					End if;
				  
				When S1display =>
                
               
                entrada2_display_vetor <= "010000";
                     
               if (x_in = "1000000000") then
                    estado_seguinte <= S0display;
                          
					Elsif (x_in = "0100000000") then
					estado_seguinte <= S1display;
						  
					Elsif (x_in = "0010000000") then
					estado_seguinte <= S2display;

					Elsif (x_in = "0001000000") then
					estado_seguinte <= Sperde1;
						  
					Elsif (x_in = "0000100000") then
					estado_seguinte <= S4display;
						  
					Elsif (x_in = "0000010000") then
					estado_seguinte <= Sperde1;
						  
					Elsif (x_in = "0000001000") then
					estado_seguinte <= S6display; 
						  
					Elsif (x_in = "0000000100") then
					estado_seguinte <= Sperde1;
						  
					Elsif (x_in = "0000000010") then
					estado_seguinte <= Sperde1;
						  
					Elsif (x_in = "0000000001") then
					estado_seguinte <= S9display;
						  
					Elsif (x_in = "0000000000") then
					estado_seguinte <= Sinicial;
					Else
						  estado_seguinte <= Sreset;
						  
					End if;
							  
				When S2display =>
                
				
					entrada2_display_vetor <= "001000";

					if (x_in = "1000000000") then
					estado_seguinte <= S0display;
						  
					Elsif (x_in = "0100000000") then
					estado_seguinte <= S1display;
						  
					Elsif (x_in = "0010000000") then
					estado_seguinte <= S2display;

					Elsif (x_in = "0001000000") then
					estado_seguinte <= Sperde1;
						  
					Elsif (x_in = "0000100000") then
					estado_seguinte <= S4display;
						  
					Elsif (x_in = "0000010000") then
					estado_seguinte <= Sperde1;
						  
					Elsif (x_in = "0000001000") then
					estado_seguinte <= S6display; 
						  
					Elsif (x_in = "0000000100") then
					estado_seguinte <= Sperde1;
						  
					Elsif (x_in = "0000000010") then
					estado_seguinte <= Sperde1;
						  
					Elsif (x_in = "0000000001") then
					estado_seguinte <= S9display;
						  
					Elsif (x_in = "0000000000") then
					estado_seguinte <= Sinicial;
					Else
						  estado_seguinte <= Sreset;
					End if;
						  
				When S4display =>
                
				
					entrada2_display_vetor <= "000100";

					if (x_in = "1000000000") then
					estado_seguinte <= S0display;

					Elsif (x_in = "0100000000") then
					estado_seguinte <= S1display;

					Elsif (x_in = "0010000000") then
					estado_seguinte <= S2display;

					Elsif (x_in = "0001000000") then
					estado_seguinte <= Sperde1;

					Elsif (x_in = "0000100000") then
					estado_seguinte <= S4display;

					Elsif (x_in = "0000010000") then
					estado_seguinte <= Sperde1;

					Elsif (x_in = "0000001000") then
					estado_seguinte <= S6display; 

					Elsif (x_in = "0000000100") then
					estado_seguinte <= Sperde1;

					Elsif (x_in = "0000000010") then
					estado_seguinte <= Sperde1;

					Elsif (x_in = "0000000001") then
					estado_seguinte <= S9display;

					Elsif (x_in = "0000000000") then
					estado_seguinte <= Sinicial;
					Else
					estado_seguinte <= Sreset;

					End if;
		  
				When S6display =>
			
					entrada2_display_vetor <= "000010";
					if (x_in = "1000000000") then
					estado_seguinte <= S0display;

					Elsif (x_in = "0100000000") then
					estado_seguinte <= S1display;

					Elsif (x_in = "0010000000") then
					estado_seguinte <= S2display;

					Elsif (x_in = "0001000000") then
					estado_seguinte <= Sperde1;

					Elsif (x_in = "0000100000") then
					estado_seguinte <= S4display;

					Elsif (x_in = "0000010000") then
					estado_seguinte <= Sperde1;

					Elsif (x_in = "0000001000") then
					estado_seguinte <= Sreset; 

					Elsif (x_in = "0000000100") then
					estado_seguinte <= Sperde1;

					Elsif (x_in = "0000000010") then
					estado_seguinte <= Sperde1;

					Elsif (x_in = "0000000001") then
					estado_seguinte <= S9display;

					Elsif (x_in = "0000000000") then
					estado_seguinte <= Sinicial;

					Else
					estado_seguinte <= Sreset;

					End if;
						  
				When S9display =>
					
					entrada2_display_vetor <= "000001";
					
					if (x_in = "1000000000") then
						estado_seguinte <= S0display;

					Elsif (x_in = "0100000000") then
						estado_seguinte <= S1display;

					Elsif (x_in = "0010000000") then
						estado_seguinte <= S2display;

					Elsif (x_in = "0001000000") then
						estado_seguinte <= Sperde1;

					Elsif (x_in = "0000100000") then
						estado_seguinte <= S4display;

					Elsif (x_in = "0000010000") then
						estado_seguinte <= Sperde1;

					Elsif (x_in = "0000001000") then
						estado_seguinte <= S6display; 

					Elsif (x_in = "0000000100") then
						estado_seguinte <= Sperde1;

					Elsif (x_in = "0000000010") then
						estado_seguinte <= Sperde1;

					Elsif (x_in = "0000000001") then
						estado_seguinte <= Sreset;

					Elsif (x_in = "0000000000") then
						estado_seguinte <= Sinicial;

					Else
						estado_seguinte <= Sreset;
					End if; 
	
								 
                When Sperde1 =>
                 
                    entrada2_display_vetor <= "000000";
					
                    if (x_in = "0000000000") then
                        estado_seguinte <= Sinicial;
                    Else
                        estado_seguinte <= Sreset;
                    End if;
                    
                    
                When Sreset =>
                
                    entrada2_display_vetor <= "000000";
                    if (x_in = "0000000000") then
                        estado_seguinte <= Sinicial;
                    Else
                        estado_seguinte <= Sreset;
                    End if;
                
		End Case;
		--if(estado_anterior = Sinicial) then
			--report "Sinicial";
		--elsif(estado_anterior = S0display) then
			--report "S0display";
		--elsif(estado_anterior = S1display) then
			--report "S1display";
		--END if;
      
    End Process;
	 
	 sc1_perdeu: circuito_combinacional_perdeu PORT MAP(saida1_contador,saida_led1,saida_led2,saida_led3);	
	
	
	 sc2_ganhou: maquina_estado6x6_ganhou PORT MAP(clk2,entrada2_display_vetor,saida2_vector_mq6);	
	 
	 vetor_leds_temp(0) <= saida_led1;
	 vetor_leds_temp(1) <= saida_led2;
	 vetor_leds_temp(2) <= saida_led3;
	 
	 sc_7segmentos_senha: bin2_7segDisplay_senha PORT MAP(saida2_vector_mq6,data_out_0,data_out_1,data_out_2,data_out_4,data_out_6,data_out_9);
	 
	 
	 sc_7segmentos_perdeu: bin2_7segDerrota PORT MAP(vetor_leds_temp,saida1_display_perdeu);
	 sc_7segmentos_ganhou: bin2_7segVitoria PORT MAP(saida2_vector_mq6,saida2_display_ganhou); 
	 
	 
	 vetor_leds <= vetor_leds_temp; -- utilizado na saida da entidade
	 



End fsm;
            