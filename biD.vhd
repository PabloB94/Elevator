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
-- Resumen            : Arquitectura de un biestable
--                    
--                  
--
--
-- Modificaciones:
--
-- Fecha        Autor        Versión         Descripción del cambio
------------------------------------------------------------------------

-----------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY biestable_D_con_Clr IS
     GENERIC(retardo: time:= 0 ns);
     PORT(clear, clock, d: IN std_logic; q: OUT std_logic);
END biestable_D_con_Clr;

ARCHITECTURE flujo_asin OF biestable_D_con_Clr IS
BEGIN
     q<= '0' AFTER retardo WHEN clear= '1' ELSE
         d AFTER retardo WHEN rising_edge(clock);
END flujo_asin;

