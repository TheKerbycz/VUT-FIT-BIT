===============================================================================
N�VOD NA POU�IT�:
===============================================================================

1) Zkop�rujte V� .zip archiv p�ipraven� na odevzd�n� do WIS do t�to slo�ky.

2) Hodnotu sv�ho loginu vlo�te do prom�nn� LOGIN ve skriptu test.bat.

3) Spus�te test projektu vol�n�m skriptu test.bat.

===============================================================================
V�STUPY:
===============================================================================

stdout - Stru�n� p�ehled pr�b�hu a v�sledku testu.

work/ - Slo�ka obsahuj�c� pracovn� soubory vytvo�en� v pr�b�hu testu.

work/log/ - Slo�ka obsahuj�c� podrobnosti o pr�b�hu jednotliv�ch krok� testu.

work/chk_sim_output.txt - Podrobn� p�ehled v�sledku testu.

POZN1: Test nekontroluje obsah dokumentace, ale pouze jej� existenci.
POZN2: Test nekontroluje funk�nost odevzdan�ho accterm.bin na FITkitu, pouze
       jeho existenci. Je proto vhodn� prov�st testy na FITkitu samostatn�.
POZN3: V�sledky testu jsou pouze orienta�n� a mohou se li�it od kone�n�ho
       hodnocen� projektu. V z�sad� ale, pokud test objev� n�kter� nedostatek, 
       je vysoce pravd�podobn�, �e se tento nedostatek objev� i p�i hodnocen�.


===============================================================================
CO TEST.BAT D�L�:
===============================================================================

1) Nejprve si rozbal� vstupn� .zip archiv a zkontroluje, zda obsahuje v�echny
   po�adovan� soubory ve spr�vn�ch slo�k�ch.

2) Provede zjednodu�enou synt�zu zdrojov�ho souboru na ov��en� jeho korektnosti.

3) Spust� simulaci projektu v prost�ed� ISIM na dvou sad�ch k�d�. Jednoduch�
   sada testuje p��jem spr�vn�ch k�d� a odm�tnut� �pln� nespr�vn�ch. Pokro�il�
   sada testuje odm�tnut� k�d�, kter� jsou velice podobn� t�m spr�vn�m.

4) Provede ohodnocen� dosa�en�ch v�sledk�, tj. porovn� odpov�di automatu v log
   souborech z�skan�ch v kroku (3) se vzorov�mi odpov��mi. V�sledky tohoto
   porovn�n� a nalezen� �patn� vyhodnocen� k�dy jsou ulo�eny do souboru
   work/chk_sim_output.txt. Zkr�cen� v�pis je pak vyps�n na stdout.
