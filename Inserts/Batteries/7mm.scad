//https://en.m.wikipedia.org/wiki/7mm_Remington_Magnum
//Base diameter		.512 in (13.0 mm)
//Overall length 	3.29 in (84 mm)
module battery_7mm(num_x, num_y) {
	diameter_offset = 0.2;  //mm, give us a little bit of room around the item
	spacing_mm = 1.5; 	//mm
	height_mm = 84 + diameter_offset;  	//mm
	diameter_mm = 13 + diameter_offset; //mm
	height_factor_p = 0.80; //percent

	battery_insert(num_x, num_y, height_mm, diameter_mm, height_factor_p, diameter_offset, spacing_mm);
}
