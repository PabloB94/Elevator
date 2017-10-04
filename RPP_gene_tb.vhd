-- © Universidad Politécnica de Madrid
-- Se permite copia para fines de estudio
------------------------------------------------------------------------
-- Proyecto           : Ascensor 3 pisos
--                    : 
-- Diseño             : RPP
-- Nombre del fichero : RPP_gene_tb.vhd
-- Autor              : Pablo Beltrán
-- Fecha              : 3/7/2017
-- Versión            : 1.0
-- Resumen            : Test RPP
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY regPPtest IS
END regPPtest;

ARCHITECTURE regPPtestArch OF regPPtest IS

	COMPONENT registro_PP IS
		GENERIC(num_bits: natural);
		PORT(clear, clock: IN std_logic; ent_datos: IN std_logic_vector ((num_bits-1) DOWNTO 0); sal_datos: OUT std_logic_vector ((num_bits-1) DOWNTO 0));
	END COMPONENT;

	SIGNAL reloj: std_logic:= '0';
	SIGNAL reset: std_logic;
	SIGNAL ent, sal: std_logic_vector (4 DOWNTO 0);

BEGIN

	R0: registro_PP GENERIC MAP (num_bits=>5)PORT MAP(clear=>reset, clock=>reloj, ent_datos=>ent, sal_datos=>sal);

	reloj <= NOT reloj AFTER 30 ns;

	reset <= '1',
		 '0' AFTER 20 ns,
		 '1' AFTER 70 ns;

	ent <= "11001" AFTER 10 ns,
	       "01101" AFTER 20 ns,
	       "00110" AFTER 30 ns,
	       "00111" AFTER 40 ns,
	       "10100" AFTER 50 ns,
	       "00101" AFTER 80 ns,
	       "00110" AFTER 100 ns;

END regPPtestArch;
