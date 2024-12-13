//https://en.wikipedia.org/wiki/Nine-volt_battery
//Name 	Voltage 	Capacity 	Depth 		Width 		Height
//PP3 	9 volt 		0.5 Ah 		17.5 mm 	26.5 mm 	48.5 mm 
//Historically, the now-popular PP3 battery size was a member of the power pack (PP) battery family that was originally manufactured by Ever Ready in the United Kingdom and Eveready in the United States.
module battery_9v(num_x, num_y) {
	spacing_mm = 1.5; 	//mm
	depth_mm = 17.5 + spacing_mm / 2;  //mm, give us a little bit of room around the battery
	height_mm = 48.5 + spacing_mm / 2;  	//mm
	width_mm = 26.5 + spacing_mm / 2; //mm
	height_factor_p = 0.80; //percent

	battery_insert_cube(num_x, num_y, width_mm, depth_mm, height_mm, height_factor_p, spacing_mm);
}

