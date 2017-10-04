-- © Universidad Politécnica de Madrid
-- Se permite copia para fines de estudio
------------------------------------------------------------------------
-- Proyecto           : Ascensor 3 pisos
--                    : 
-- Diseño             : Biestable
-- Nombre del fichero : biD.vhd
-- Autor              : Pablo Beltrán
-- Fecha              : 3/7/2017
-- Versión            : 1.0
-- Resumen            : Test Arquitectura de un biestable
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY registro_PP IS
	GENERIC (num_bits:natural);
	PORT (clear, clock : IN std_logic;
	ent_datos : IN std_logic_vector ((num_bits - 1) DOWNTO 0);
	sal_datos : OUT std_logic_vector ((num_bits -1) DOWNTO 0));
END registro_PP;


ARCHITECTURE con_generate OF registro_PP IS
     COMPONENT biestable_D_con_Clr IS
          GENERIC(retardo: time:= 0 ns);
          PORT(clear, clock, d: IN std_logic; q: OUT std_logic);
     END COMPONENT;

BEGIN
     
     
     Ri: FOR I IN 0 TO num_bits-1 GENERATE
          Bi: biestable_D_con_Clr PORT MAP(clear=>clear, clock=>clock, d=>ent_datos(I), q=>sal_datos(I));
     END GENERATE;


END con_generate;
