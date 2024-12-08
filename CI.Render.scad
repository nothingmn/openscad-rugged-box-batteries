$fn=360;
generate18650 = false;
generateAA = false;
generateAAA = false;
generateD = false;
generateC = false;
generateCR132A = false;
generate18350 = false;
generateCR2 = false;
generateCR2032 = false;
generate9v = false;
generate22lr = true;
generate7mm = false;
generate12G3 = false;
generate12G234 = false;
generate16G234 = false;
generate20G3 = false;
generate20G234 = false;
generate28G234 = false;
generate65Creedmor = false;
generate223 = false;
generate243 = false;
generate270 = false;
generate300 = false;
generate300WinMag = false;
generate308 = false; 
generate3006 = false;
generate3030 = false;
generate4103 = false;
generate410212 = false;
battery_count_x = 5;
battery_count_y = 2;


numberOfHinges = generate22lr || generateAAA ? 1 :
					battery_count_x >= 8 ? 4 :
						battery_count_x >= 6 ? 3 :
							battery_count_x >= 3 ? 2 : 1;

numberOfLatches = generate22lr || generateAAA ? 1 :
					battery_count_x <= 6 ? 1 : 2;


include <BoxBattery.scad>;
