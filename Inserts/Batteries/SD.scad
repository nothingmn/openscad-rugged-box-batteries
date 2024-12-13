//https://en.wikipedia.org/wiki/SD_card
//	
// Standard:
// 32.0×24.0×2.1 mm (1.260×0.945×0.083 in)
// 1,612.8 mm3 (0.09842 cu in)
module battery_SD(num_x, num_y) {
	spacing_mm = 1.5; 	//mm
	depth_mm = 2.1+ spacing_mm / 2;  //mm, give us a little bit of room around the battery
	height_mm = 32 + spacing_mm / 2;  	//mm
	width_mm = 24 + spacing_mm / 2; //mm
	height_factor_p = 0.80; //percent

	battery_insert_cube(num_x, num_y, width_mm, depth_mm, height_mm, height_factor_p, spacing_mm);
}

