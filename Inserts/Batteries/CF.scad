//https://en.wikipedia.org/wiki/CompactFlash

// Dimensions	
//     43×36×3.3 mm (Type I) ****
//     43×36×5 mm (Type II)
//Type I cards have been more prevalent due to their compatibility with a wider range of devices. Their thinner profile allows them to fit into both Type I and Type II slots, making them versatile for various applications. In contrast, Type II cards, being thicker, can only be used in Type II slots. 
module battery_CF(num_x, num_y) {
	spacing_mm = 1.5; 	//mm
	depth_mm = 3.3 + spacing_mm / 2;  //mm, give us a little bit of room around the battery
	height_mm = 43 + spacing_mm / 2;  	//mm
	width_mm = 36 + spacing_mm / 2; //mm
	height_factor_p = 0.80; //percent

	battery_insert_cube(num_x, num_y, width_mm, depth_mm, height_mm, height_factor_p, spacing_mm);
}

