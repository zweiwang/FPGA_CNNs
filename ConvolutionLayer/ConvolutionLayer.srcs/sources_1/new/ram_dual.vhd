LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE work.ram_package.ALL;
ENTITY ram_dual IS
   PORT
   (
      clock1 : IN   std_logic;
      clock2 : IN   std_logic;
      data   : IN   word;
      write_address: IN  address_vector;
      read_address:  IN  address_vector;
      we     : IN   std_logic;
      q      : OUT  word
   );
END ram_dual;
ARCHITECTURE rtl OF ram_dual IS
   SIGNAL ram_block : RAM;
 
BEGIN
   PROCESS (clock1)
   BEGIN
      IF (clock1'event AND clock1 = '1') THEN
         IF (we = '1') THEN
            ram_block(write_address) <= data;
         END IF;
      END IF;
   END PROCESS;
   PROCESS (clock2)
   BEGIN
      IF (clock2'event AND clock2 = '1') THEN
         q <= ram_block(read_address);
      END IF;
   END PROCESS;
   
END rtl;