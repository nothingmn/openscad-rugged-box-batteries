
module battery_18350(num_x, num_y) {
	diameter_offset = 0.2;  //mm, give us a little bit of room around the battery
	spacing_mm = 2.5; 	//mm
	height_mm = 35.5 + diameter_offset;  	//mm
	diameter_mm = 18.2 + diameter_offset; //mm
	height_factor_p = 0.80; //percent

	battery_insert(num_x, num_y, height_mm, diameter_mm, height_factor_p, diameter_offset, spacing_mm);
}

