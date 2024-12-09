//https://en.m.wikipedia.org/wiki/.223_Remington
//Base diameter
//	0.376 in (9.6 mm)
//Overall length
//	2.26 in (57 mm)
module battery_223(num_x, num_y) {
	diameter_offset = 0.2;  //mm, give us a little bit of room around the item
	spacing_mm = 1.5; 	//mm
	height_mm = 57 + diameter_offset;  	//mm
	diameter_mm = 9.6 + diameter_offset; //mm
	height_factor_p = 0.80; //percent

	battery_insert(num_x, num_y, height_mm, diameter_mm, height_factor_p, diameter_offset, spacing_mm);
}

