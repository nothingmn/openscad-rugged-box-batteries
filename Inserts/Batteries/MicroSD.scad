//https://en.wikipedia.org/wiki/SD_card
//Micro:
//15.0×11.0×1.0 mm (0.591×0.433×0.039 in)
//165 mm3 (0.0101 cu in)

module battery_MicroSD(num_x, num_y) {
	spacing_mm = 1.5; 	//mm
	depth_mm = 1 + spacing_mm / 2;  //mm, give us a little bit of room around the battery
	height_mm = 15 + spacing_mm / 2;  	//mm
	width_mm = 11 + spacing_mm / 2; //mm
	height_factor_p = 0.80; //percent

	battery_insert_cube(num_x, num_y, width_mm, depth_mm, height_mm, height_factor_p, spacing_mm);
}

