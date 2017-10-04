-- © Universidad Politécnica de Madrid
-- Se permite copia para fines de estudio
------------------------------------------------------------------------
-- Proyecto           : Ascensor 3 pisos
--                    : 
-- Diseño             : Biestable
-- Nombre del fichero : codifica_boton.vhd
-- Autor              : Pablo Beltrán
-- Fecha              : 3/7/2017
-- Versión            : 1.0
-- Resumen            : Botonera del ascensor

LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 

ENTITY codifica_boton IS
PORT(B: IN std_logic_vector (2 DOWNTO 0); C: OUT std_logic_vector (1 DOWNTO 0));
END codifica_boton;

ARCHITECTURE  arquitectura_cod_boton OF codifica_boton IS
BEGIN
	PROCESS(B)
	BEGIN
		CASE B IS
		WHEN "001" => C<= "00";
		WHEN "010" => C<= "01";
		WHEN "100" => C<= "10";
		WHEN OTHERS => C<= "11";
		END CASE;
	END PROCESS;
END arquitectura_cod_boton;


