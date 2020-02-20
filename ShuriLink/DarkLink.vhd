library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DarkLink is
	Port (	Clk : in std_logic;
			Reset: in std_logic;
			
			game_over: in std_logic; --estado do game_over
			pause : in std_logic; -- estado pause
			
			DLink_left : out std_logic_vector(9 downto 0); --esquerda
			DLink_top : out std_logic_vector(9 downto 0); --cima
			
			DLink_width : out std_logic_vector(9 downto 0); --largura
			colisao_link : in std_logic;
			rand  :in std_logic_vector(3 downto 0) -- for�a com que � atirado para cima 
);
end DarkLink;

architecture Behavioral of DarkLink is
	signal t1_left: std_logic_vector(9 downto 0); --declarar os sinais
	signal t1_top : std_logic_vector(9 downto 0);
	
 
	constant T_Width : std_logic_vector(9 downto 0) := CONV_STD_LOGIC_VECTOR(30, 10); --largura do DLink
	
begin
	update_DarkLink: process(Clk, Reset, pause, t1_left, t1_top,colisao_link)
	begin
	
	
	if(Reset='1') then --
		t1_left<=CONV_STD_LOGIC_VECTOR(290,10); -- posicao inicial da parte esquerda
		t1_top<=CONV_STD_LOGIC_VECTOR(330, 10); -- p
	end if;
		
	if(colisao_link = '1')then
		t1_left<=CONV_STD_LOGIC_VECTOR( 290 + 20*(CONV_INTEGER(rand)),10); -- posicao inicial da parte esquerda
		t1_top<=CONV_STD_LOGIC_VECTOR(330, 10); 
	end if;
	
	
	DLink_left <= t1_left;
	DLink_top <= t1_top;
	DLink_width <= T_Width;

	end process;
end Behavioral;