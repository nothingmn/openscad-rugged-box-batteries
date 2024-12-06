include <18650.scad>
include <AA.scad>
include <AAA.scad>
include <D.scad>
include <C.scad>
include <CR123A.scad>
include <18350.scad>
include <CR2.scad>
include <CR2032.scad>

module battery_insert(countX, countY, height_mm, diameter_mm, height_factor_p, diameter_offset, spacing_mm) {
	spacing =  (diameter_mm + spacing_mm);
	height = height_mm * height_factor_p;
	width =  (countX * spacing ) + insertTolerance + spacing_mm*2;
	depth =  (countY * spacing ) + insertTolerance + spacing_mm*2;

	difference() {
		battery_box(height, width, depth, diameter_mm, spacing_mm, height_mm, height_factor_p);
		if(countY > 0) {
			for(y = [0:countY-1]) {
				translate([spacing / spacing_mm + 7.5, spacing * y - 2, spacing_mm]) {
					for(x = [0:countX-1]) {
						translate([ spacing * x, spacing / spacing_mm, spacing_mm]) {
							battery_single(height_mm, diameter_mm);
						}
					}
				}
			}
		}
	}
}


module battery_single(height_mm, diameter_mm) {
	color("Blue") {
		cylinder(h=height_mm, d=diameter_mm);
	}
}

module battery_box(height, width, depth, diameter_mm, spacing_mm, height_mm, height_factor_p) {
	internalBoxWidthXMm = width;
	internalboxLengthYMm = depth;
	internalboxBottomHeightZMm = height_mm * height_factor_p;
	internalBoxTopHeightZMm = height_mm - height + spacing_mm;
	union() {
		translate([2, -7, 1]) {
			color("Red")
				cube([width, depth, height]);
		}

		build_rugged_box(internalBoxWidthXMm, internalboxLengthYMm, internalBoxTopHeightZMm, internalboxBottomHeightZMm);
	}
}


/*
COIN CELLS
*/


module battery_insert_coin(countX, countY, height_mm, diameter_mm, height_factor_p, diameter_offset, spacing_mm) {

	//the big difference is the cut outs need to be rotated by 90d, and they are closer together

	h = height_mm;  //this will be the super thin coin height
	d = diameter_mm;  //these are very rounded

	spacing =  (d + spacing_mm);
	height = h * height_factor_p;
	width =  (countX * spacing ) + insertTolerance + spacing_mm*2;
	depth =  (countY * spacing/2.15 ) + insertTolerance + spacing_mm;
	
	translate([width+10, -5, 0]) {
		difference() {
			battery_box_coin(height, width, depth, d, spacing_mm, h, height_factor_p);
			if(countY > 0) {
				for(y = [1:countY]) {
					translate([spacing / spacing_mm, spacing * y / 2.5, spacing_mm]) {
						for(x = [1:countX]) {
							translate([ spacing * x, spacing / spacing_mm, spacing_mm]) {
								battery_single_coin(h, d);
							}
						}
					}
				}
			}
		}
	}
}

module battery_box_coin(height, width, depth, diameter_mm, spacing_mm, height_mm, height_factor_p) {
	
	off = diameter_mm - spacing_mm;
	translate([off, off/2.5, 0]) {
		cube([width, depth, height]);
	}

	internalBoxWidthXMm = width;
	internalboxLengthYMm = depth;
	internalboxBottomHeightZMm = height_mm * height_factor_p;
	internalBoxTopHeightZMm = height_mm - height + spacing_mm;

	translate([internalBoxWidthXMm+50,0,0])
		build_rugged_box(internalBoxWidthXMm, internalboxLengthYMm, internalBoxTopHeightZMm, internalboxBottomHeightZMm);

}


module battery_single_coin(height_mm, diameter_mm) {
	color("Blue") {
		rotate([90,0,0]) {
			cylinder(h=height_mm, d=diameter_mm);
		}
	}
}
