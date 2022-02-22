Library ieee;
USE ieee.std_logic_1164.all;

Entity circuito_combinacional_perdeu is
    PORT( x_vector: in std_logic_vector(1 downto 0);
          saida_led1,saida_led2,saida_led3: out std_logic);
			 

End circuito_combinacional_perdeu;

Architecture fsm of circuito_combinacional_perdeu is

	Begin
		-- (0) é o mais significativo e (1) é o menos significativo
		saida_led1 <= ( NOT(x_vector(1)) OR NOT(x_vector(0)) );
		saida_led2 <= NOT(x_vector(1));
		saida_led3 <= ( NOT(x_vector(1)) AND NOT(x_vector(0)) );
	
End fsm;
            