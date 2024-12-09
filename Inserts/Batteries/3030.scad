//https://en.m.wikipedia.org/wiki/.30-30_Winchester
//Base diameter
//	.422 in (10.7 mm)
//Overall length
//	2.550 in (64.8 mm)
module battery_3030(num_x, num_y) {
	diameter_offset = 0.2;  //mm, give us a little bit of room around the item
	spacing_mm = 1.5; 	//mm
	height_mm = 64.8 + diameter_offset;  	//mm
	diameter_mm = 10.7 + diameter_offset; //mm
	height_factor_p = 0.80; //percent

	battery_insert(num_x, num_y, height_mm, diameter_mm, height_factor_p, diameter_offset, spacing_mm);
}

