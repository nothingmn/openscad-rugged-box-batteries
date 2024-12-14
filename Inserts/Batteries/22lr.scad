//https://en.m.wikipedia.org/wiki/.22_long_rifle
//Base diameter
//	.226 in (5.7 mm)[1]
//	Overall length
//	1.000 in (25.4 mm)[1]
module battery_22lr(num_x, num_y) {
	diameter_offset = 0.2;  //mm, give us a little bit of room around the item
	spacing_mm = 2.5; 	//mm
	height_mm = 25.4 + diameter_offset;  	//mm
	diameter_mm = 5.7 + diameter_offset; //mm
	height_factor_p = 0.50; //percent

	battery_insert(num_x, num_y, height_mm, diameter_mm, height_factor_p, diameter_offset, spacing_mm);
}

