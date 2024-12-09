//https://en.m.wikipedia.org/wiki/.30-06_Springfield
//Base diameter
//	.471 in (12.0 mm)
//Overall length
//	3.34 in (85 mm)	
module battery_3006(num_x, num_y) {
	diameter_offset = 0.2;  //mm, give us a little bit of room around the item
	spacing_mm = 1.5; 	//mm
	height_mm = 85 + diameter_offset;  	//mm
	diameter_mm = 12 + diameter_offset; //mm
	height_factor_p = 0.90; //percent

	battery_insert(num_x, num_y, height_mm, diameter_mm, height_factor_p, diameter_offset, spacing_mm);
}



