module battery_number2pencil(num_x, num_y) {
	diameter_offset = 0.4;  //mm, give us a little bit of room around the battery
	spacing_mm = 1.5; 	//mm
	height_mm = 190 + diameter_offset;  	//mm
	diameter_mm = 13 + diameter_offset; //mm
	height_factor_p = 0.75; //percent

	battery_insert(num_x, num_y, height_mm, diameter_mm, height_factor_p, diameter_offset, spacing_mm);
}

