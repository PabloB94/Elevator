-- © Universidad Politécnica de Madrid
-- Se permite copia para fines de estudio
------------------------------------------------------------------------
-- Proyecto           : Ascensor 3 pisos
--                    : 
-- Diseño             : Biestable
-- Nombre del fichero : biD_tb.vhd
-- Autor              : Pablo Beltrán
-- Fecha              : 3/7/2017
-- Versión            : 1.0
-- Resumen            : Test Arquitectura de un biestable
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY biestable_D_test IS
END biestable_D_test;

ARCHITECTURE test_general OF biestable_D_test IS

     COMPONENT biestable_D_con_Clr IS
          GENERIC(retardo: time:= 0 ns);
          PORT(clear, clock, d: IN std_logic; q: OUT std_logic);
     END COMPONENT;

     FOR B1c: biestable_D_con_Clr USE ENTITY WORK.biestable_D_con_Clr(flujo_asin);
    

     SIGNAL reloj: std_logic:= '0';
     SIGNAL entrada, reset: std_logic;
     SIGNAL salidaBiestable: std_logic;
BEGIN

     B1c: biestable_D_con_Clr GENERIC MAP(retardo=>0 ns) PORT MAP(clear=>reset, clock=> reloj, d=>entrada, q=>salidaBiestable);
    

     reset<= '1',
             '0' AFTER 20 ns,
             '1' AFTER 45 ns;

     reloj<= NOT reloj AFTER 35 ns;

     entrada<= '0',
               '1' AFTER 25 ns,
               '0' AFTER 30 ns,
               '1' AFTER 32 ns,
               '0' AFTER 40 ns;

END test_general;
