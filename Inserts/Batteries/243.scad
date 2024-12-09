//https://en.m.wikipedia.org/wiki/.243_Winchester
//Base diameter
//	.471 in (12.0 mm)
//Overall length
//	2.7098 in (68.83 mm)	
module battery_243(num_x, num_y) {
	diameter_offset = 0.2;  //mm, give us a little bit of room around the item
	spacing_mm = 1.5; 	//mm
	height_mm = 68.83 + diameter_offset;  	//mm
	diameter_mm = 12 + diameter_offset; //mm
	height_factor_p = 0.80; //percent

	battery_insert(num_x, num_y, height_mm, diameter_mm, height_factor_p, diameter_offset, spacing_mm);
}

