
module battery_18650(num_x, num_y) {
	_18650_diameter_offset = 0.4;  //mm, give us a little bit of room around the battery
	_18650_spacing_mm = 2.5; 	//mm
	_18650_height_mm = 74 + _18650_diameter_offset;  	//mm
	_18650_diameter_mm = 18.6 + _18650_diameter_offset; //mm
	_18650_height_factor_p = 0.80; //percent

	battery_insert(num_x, num_y, _18650_height_mm, _18650_diameter_mm, _18650_height_factor_p, _18650_diameter_offset, _18650_spacing_mm);
}
