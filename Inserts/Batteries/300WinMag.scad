//https://en.m.wikipedia.org/wiki/.300_Winchester_Magnum
//Base diameter
//	.513 in (13.0 mm)
//Overall length
//	3.34 in (85 mm)

module battery_300WinMag(num_x, num_y) {
	diameter_offset = 0.2;  //mm, give us a little bit of room around the item
	spacing_mm = 2.5; 	//mm
	height_mm = 61.9 + diameter_offset;  	//mm
	diameter_mm = 7.82 + diameter_offset; //mm
	height_factor_p = 0.80; //percent

	battery_insert(num_x, num_y, height_mm, diameter_mm, height_factor_p, diameter_offset, spacing_mm);
}

