
module battery_CR2032(num_x, num_y) {
	diameter_offset = 0.4;  //mm, give us a little bit of room around the battery
	spacing_mm = 3; 	//mm
	height_mm = 3.2 + diameter_offset;  	//mm
	diameter_mm = 20 + diameter_offset; //mm
	height_factor_p = 0.60; //percent

	battery_insert_coin(num_x, num_y, height_mm, diameter_mm, height_factor_p, diameter_offset, spacing_mm);
}

