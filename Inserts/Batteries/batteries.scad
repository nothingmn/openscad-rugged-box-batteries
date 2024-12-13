include <18650.scad>
include <AA.scad>
include <AAA.scad>
include <D.scad>
include <C.scad>
include <CR123A.scad>
include <18350.scad>
include <CR2.scad>

include <CR2032.scad>
include <A76.scad>
include <CR2430.scad>
include <CR2450.scad>

include <9v.scad>

include <22lr.scad>
include <7mm.scad>
include <12G3.scad>
include <12G234.scad>
include <16G234.scad>
include <20G3.scad>
include <20G234.scad>
include <28G234.scad>
include <65Creedmor.scad>
include <223.scad>
include <243.scad>
include <270.scad>
include <300.scad>
include <300WinMag.scad>
include <308.scad>
include <3006.scad>
include <3030.scad>
include <4103.scad>
include <410212.scad>

module battery_insert(countX, countY, height_mm, diameter_mm, height_factor_p, diameter_offset, spacing_mm) {
    // Calculate dimensions
    spacing = diameter_mm + spacing_mm;  // Space per battery
    bottom_height = height_mm * height_factor_p; // Total box height of the bottom
    top_height = height_mm - bottom_height - spacing_mm; // Total box height of the bottom
    width = spacing * countX + spacing_mm;  // Total box width
    depth = spacing * countY + spacing_mm;  // Total box depth

    difference() {
        // Outer box
        battery_box(bottom_height, top_height, width, depth, spacing_mm);
		
		//position us just over the box
		translate([spacing/2 + boxWallWidthMm, spacing/2 - boxWallWidthMm*2, 0])				
		// Battery slots
		for (y = [0:countY-1]) {
			for (x = [0:countX-1]) {
				translate([x * spacing, y * spacing, spacing_mm]) {
					battery_single(bottom_height, diameter_mm + diameter_offset, spacing_mm);
				}
			}
		}
    }
}

module battery_single(bottom_height, diameter_mm, spacing_mm) {
		cylinder(h=bottom_height+spacing_mm, d=diameter_mm);
}

module battery_box(bottom_height, top_height, width, depth, spacing_mm) {
	internalBoxWidthXMm = width - spacing_mm;
	internalboxLengthYMm = depth;
	internalboxBottomHeightZMm = bottom_height;
	internalBoxTopHeightZMm = top_height;
	union() {
		build_rugged_box(internalBoxWidthXMm, internalboxLengthYMm, internalBoxTopHeightZMm, internalboxBottomHeightZMm+spacing_mm);
		translate([ (battery_count_x * .25), -7 + (battery_count_y * -.25), 1]) {
			cube([width+spacing_mm, depth+spacing_mm, bottom_height+spacing_mm]);
		}
	}
}

/*
Cubed batteries, ie 9v
*/

module battery_insert_cube(countX, countY, width_mm, depth_mm, height_mm, height_factor_p, spacing_mm) {
    // Calculate dimensions
    bottom_height = height_mm * height_factor_p; // Total box height of the bottom
    top_height = height_mm - bottom_height - spacing_mm; // Total box height of the bottom
    width = (countX * (width_mm + spacing_mm));  // Total box width
    depth = (countY * (depth_mm + spacing_mm));  // Total box depth

    difference() {
        // Outer box
        battery_box(bottom_height, top_height, width + spacing_mm * 1.5, depth + spacing_mm * 1.5, spacing_mm);
		
		//position us just over the box
		translate([spacing_mm / 2 + boxWallWidthMm, spacing_mm/2 - boxWallWidthMm * 2, 0])				
		// Battery slots
		for (y = [0:countY-1]) {
			for (x = [0:countX-1]) {
				translate([x *  (width_mm + spacing_mm), y * (depth_mm + spacing_mm), spacing_mm]) {
					battery_single_cube(width_mm, depth_mm, height_mm);
				}
			}
		}
    }
}
module battery_single_cube(width_mm, depth_mm, height_mm) {
	cube([width_mm,  depth_mm, height_mm]);
}
/*
COIN CELLS
*/


module battery_insert_coin(countX, countY, height_mm, diameter_mm, height_factor_p, diameter_offset, spacing_mm) {


	height_of_battery_on_its_side_mm = diameter_mm;
	width_of_battery_on_its_side_mm = diameter_mm;
	depth_of_battery_on_its_side_mm = height_mm;

    // Calculate dimensions
    spacing_z = height_of_battery_on_its_side_mm + spacing_mm; 
    spacing_x = width_of_battery_on_its_side_mm + spacing_mm;
    spacing_y = depth_of_battery_on_its_side_mm + spacing_mm;

    bottom_height = height_of_battery_on_its_side_mm * height_factor_p;
    top_height = height_of_battery_on_its_side_mm - bottom_height - spacing_mm;

	internal_depth = spacing_y * countY;
	internal_width = spacing_x * countX + spacing_mm;

    difference() {
        // Outer box
        battery_box_coin(bottom_height, top_height, internal_width, internal_depth, spacing_mm);
		
		//position us just over the box
		translate([spacing_x/2 + boxWallWidthMm, (spacing_y/1.5) - boxWallWidthMm*2, bottom_height])
		// Battery slots
		for (y = [0:countY-1]) {
			for (x = [0:countX-1]) {
				translate([x * (width_of_battery_on_its_side_mm + spacing_mm), y * (depth_of_battery_on_its_side_mm + spacing_mm), spacing_mm / 2 ]) {
					battery_single_coin(depth_of_battery_on_its_side_mm, width_of_battery_on_its_side_mm + diameter_offset);
				}
			}
		}
    }
}
module battery_box_coin(bottom_height, top_height, width, depth, spacing_mm) {

	internalBoxWidthXMm = width - spacing_mm;
	internalboxLengthYMm = depth;
	internalboxBottomHeightZMm = bottom_height;
	internalBoxTopHeightZMm = top_height;
	union() {
		build_rugged_box(internalBoxWidthXMm, internalboxLengthYMm, internalBoxTopHeightZMm, internalboxBottomHeightZMm+spacing_mm);
		translate([ (battery_count_x * .25), -7 + (battery_count_y * -.25), 1]) {
			cube([width+spacing_mm, depth+spacing_mm, bottom_height+spacing_mm]);
		}
	}
}


module battery_single_coin(height_mm, diameter_mm) {
	color("Blue") {
		rotate([90,0,0]) {
			cylinder(h=height_mm, d=diameter_mm);
		}
	}
}
