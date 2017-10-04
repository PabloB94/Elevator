-- © Universidad Politécnica de Madrid
-- Se permite copia para fines de estudio
------------------------------------------------------------------------
-- Proyecto           : Ascensor 3 pisos
--                    : 
-- Diseño             : Ascensor
-- Nombre del fichero : ascensor_completo.vhd
-- Autor              : Pablo Beltrán de Casso
-- Fecha              : 3/7/2017
-- Versión            : 1.0
-- Resumen            : Ascensor completo

LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY ascensor_completo IS
PORT
	(
	clk : IN STD_LOGIC;
	reset: IN STD_LOGIC;
	botones : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
	sube, baja : OUT STD_LOGIC;
	piso_donde_esta : OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
	);
END ascensor_completo;

ARCHITECTURE arquitectura_ascensor_completo OF ascensor_completo IS

SIGNAL CODIGOPISO : STD_LOGIC_VECTOR (1 DOWNTO 0);

COMPONENT FSM_ascensor IS
PORT
	(
	clk : IN STD_LOGIC;
	reset: IN STD_LOGIC;
	codigo_piso : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
	sube, baja : OUT STD_LOGIC;
	piso_donde_esta : OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT codifica_boton IS
PORT
	(
	B : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
	C : OUT STD_LOGIC_VECTOR (1 DOWNTO 0)
	);
END COMPONENT;

BEGIN

ascen: FSM_ascensor
PORT MAP
	(
	clk => clk,
	reset => reset,
	codigo_piso => CODIGOPISO,
	sube => sube, 
	baja => baja, 
	piso_donde_esta => piso_donde_esta
	);
codificador: codifica_boton
PORT MAP
	(
	B => botones,
	C => CODIGOPISO
	);
END arquitectura_ascensor_completo;
	
