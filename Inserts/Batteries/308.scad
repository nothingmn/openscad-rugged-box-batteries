//https://en.m.wikipedia.org/wiki/.308_Winchester
//Base diameter
//	0.4709 in (11.96 mm)
//Overall length
//	2.800 in (71.1 mm)	
module battery_308(num_x, num_y) {
	diameter_offset = 0.2;  //mm, give us a little bit of room around the item
	spacing_mm = 1.5; 	//mm
	height_mm = 71.1 + diameter_offset;  	//mm
	diameter_mm = 11.96 + diameter_offset; //mm
	height_factor_p = 0.80; //percent

	battery_insert(num_x, num_y, height_mm, diameter_mm, height_factor_p, diameter_offset, spacing_mm);
}

