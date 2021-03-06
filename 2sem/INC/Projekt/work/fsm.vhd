-- fsm.vhd: Finite State Machine
-- Author(s): Tomas Lapsansky (xlapsa00) 
--
library ieee;
use ieee.std_logic_1164.all;
-- ----------------------------------------------------------------------------
--                        Entity declaration
-- ----------------------------------------------------------------------------
entity fsm is
port(
   CLK         : in  std_logic;
   RESET       : in  std_logic;

   -- Input signals
   KEY         : in  std_logic_vector(15 downto 0);
   CNT_OF      : in  std_logic;

   -- Output signals
   FSM_CNT_CE  : out std_logic;
   FSM_MX_MEM  : out std_logic;
   FSM_MX_LCD  : out std_logic;
   FSM_LCD_WR  : out std_logic;
   FSM_LCD_CLR : out std_logic
);
end entity fsm;

-- ----------------------------------------------------------------------------
--                      Architecture declaration
-- ----------------------------------------------------------------------------
architecture behavioral of fsm is
   type t_state is (TEST1, TEST2, TEST3, TEST4A, TEST5A, TEST6A, TEST7A, TEST8A, TEST9A, TEST10A, TEST11A, TEST4B, TEST5B, TEST6B, TEST7B, TEST8B, TEST9B, TEST10B, TEST11B, TESTF, WAITEND, BAD_MESSAGE, RIGHT_MESSAGE, FINISH);
   signal present_state, next_state : t_state;

begin
-- -------------------------------------------------------
sync_logic : process(RESET, CLK)
begin
   if (RESET = '1') then
      present_state <= TEST1;
   elsif (CLK'event AND CLK = '1') then
      present_state <= next_state;
   end if;
end process sync_logic;

-- -------------------------------------------------------
next_state_logic : process(present_state, KEY, CNT_OF)
begin
   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   when TEST1 =>
      next_state <= TEST1;
      if (KEY(15) = '1') then
         next_state <= BAD_MESSAGE; 
 	elsif (KEY(1) = '1') then	-- 1
		next_state <= TEST2;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
      end if;
   ----------------------------------------------
   when TEST2 =>
	next_state <= TEST2;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(3) = '1') then	-- 13
		next_state <= TEST3;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TEST3 =>
	next_state <= TEST3;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(7) = '1') then	-- A 137
		next_state <= TEST4A;
	elsif (KEY(8) = '1') then	-- B 138
		next_state <= TEST4B;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TEST4A =>
	next_state <= TEST4A;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(9) = '1') then	-- A 1379
		next_state <= TEST5A;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TEST5A =>
	next_state <= TEST5A;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(9) = '1') then	-- A 13799
		next_state <= TEST6A;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TEST6A =>
	next_state <= TEST6A;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(9) = '1') then	-- A 137999
		next_state <= TEST7A;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TEST7A =>
	next_state <= TEST7A;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(4) = '1') then	-- A 1379994
		next_state <= TEST8A;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TEST8A =>
	next_state <= TEST8A;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(2) = '1') then	-- A 13799942
		next_state <= TEST9A;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TEST9A =>
	next_state <= TEST9A;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(0) = '1') then	-- A 137999420
		next_state <= TEST10A;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TEST10A =>
	next_state <= TEST10A;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(8) = '1') then	-- A 1379994208
		next_state <= TEST11A;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TEST11A =>
	next_state <= TEST11A;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(0) = '1') then	-- A 13799942080
		next_state <= TESTF;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TEST4B =>
	next_state <= TEST4B;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(1) = '1') then	-- B 1381
		next_state <= TEST5B;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TEST5B =>
	next_state <= TEST5B;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(2) = '1') then	-- B 13812
		next_state <= TEST6B;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TEST6B =>
	next_state <= TEST6B;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(9) = '1') then	-- B 138129
		next_state <= TEST7B;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TEST7B =>
	next_state <= TEST7B;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(7) = '1') then	-- B 1381297
		next_state <= TEST8B;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TEST8B =>
	next_state <= TEST8B;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(5) = '1') then	-- B 13812975
		next_state <= TEST9B;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TEST9B =>
	next_state <= TEST9B;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(8) = '1') then	-- B 138129758
		next_state <= TEST10B;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TEST10B =>
	next_state <= TEST10B;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(0) = '1') then	-- B 1381297580
		next_state <= TEST11B;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TEST11B =>
	next_state <= TEST11B;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(3) = '1') then	-- B 13812975803
		next_state <= TESTF;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when TESTF =>			-- FINAL STATE FOR ENTERING THE #
	next_state <= TESTF;
	if (KEY(15) = '1') then
		next_state <= RIGHT_MESSAGE;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when WAITEND =>			-- WAITING TILL # FOR WRONG INPUT
	next_state <= WAITEND;
	if (KEY(15) = '1') then
		next_state <= BAD_MESSAGE;
	elsif (KEY(14 downto 0) /= "000000000000000") then
		next_state <= WAITEND;
	end if;
   ----------------------------------------------
   when RIGHT_MESSAGE =>
	next_state <= RIGHT_MESSAGE;
	if (CNT_OF = '1') then
		next_state <= FINISH;
	end if;
   ----------------------------------------------
   when BAD_MESSAGE =>			-- WRONG INPUT MESSAGE
      next_state <= BAD_MESSAGE;
      if (CNT_OF = '1') then
      		next_state <= FINISH;
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      next_state <= FINISH;
      if (KEY(15) = '1') then
         	next_state <= TEST1; 
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
      next_state <= TEST1;
   end case;
end process next_state_logic;

-- -------------------------------------------------------
output_logic : process(present_state, KEY)
begin
   FSM_CNT_CE     <= '0';
   FSM_MX_MEM     <= '0';
   FSM_MX_LCD     <= '0';
   FSM_LCD_WR     <= '0';
   FSM_LCD_CLR    <= '0';

   case (present_state) is
   -- - - - - - - - - - - - - - - - - - - - - - -
   --when TEST1 =>		-- MOVED TO OTHERS
   --   if (KEY(14 downto 0) /= "000000000000000") then
   --      FSM_LCD_WR     <= '1';
   --   end if;
   --   if (KEY(15) = '1') then
   --      FSM_LCD_CLR    <= '1';
   --   end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when BAD_MESSAGE =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
      FSM_MX_MEM     <= '0';	-- FOR BAD OUTPUT
   -- - - - - - - - - - - - - - - - - - - - - - -
   when RIGHT_MESSAGE =>
      FSM_CNT_CE     <= '1';
      FSM_MX_LCD     <= '1';
      FSM_LCD_WR     <= '1';
      FSM_MX_MEM     <= '1';	-- FOR GOOD OUTPUT
   -- - - - - - - - - - - - - - - - - - - - - - -
   when FINISH =>
      if (KEY(15) = '1') then
         FSM_LCD_CLR    <= '1';
      end if;
   -- - - - - - - - - - - - - - - - - - - - - - -
   when others =>
	if (KEY(14 downto 0) /= "000000000000000") then
		FSM_LCD_WR <= '1';
	end if;
	if (KEY(15) = '1') then
		FSM_LCD_CLR <= '1';
	end if;
   end case;
end process output_logic;

end architecture behavioral;

