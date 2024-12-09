//https://en.m.wikipedia.org/wiki/6.5mm_Creedmoor
//Base diameter
//	.4703 in (11.95 mm)
//Overall length
//	2.825 in (71.8 mm)
module battery_65Creedmor(num_x, num_y) {
	diameter_offset = 0.2;  //mm, give us a little bit of room around the item
	spacing_mm = 1.5; 	//mm
	height_mm = 71.8 + diameter_offset;  	//mm
	diameter_mm = 11.95 + diameter_offset; //mm
	height_factor_p = 0.80; //percent

	battery_insert(num_x, num_y, height_mm, diameter_mm, height_factor_p, diameter_offset, spacing_mm);
}


