include <roundedcube.scad>

WALL_SHORT = 4 + 0; //Done so the customizer won't let this value be changed
WALL_TALL = 29.5 + 0;

// Connectors

module connector_wall() {
	difference () {
		union () {
			translate([-.5,.55,0]) rounded_cube(3.5,1.4,3.8, .3);
			translate([2,0,0]) rounded_cube(1.5,2.5,3.8, .3);
		}
	}
}

// Corners

module corner(height, plugs=[true,true,true,true]) {
	difference() {
		union () {
			translate([-0.01, -0.01, 0]) cube([6.02,6.02,height]);
			if (plugs[0]) {
				translate([6,1.8,0]) connector_wall();
			}
			if (plugs[1]) {
				rotate([0,0,90]) translate([6,-4.2,0]) connector_wall();
			}
			if (plugs[2]) {
				rotate([0,0,180]) translate([0,-4.2,0]) connector_wall();
			}
			if (plugs[3]) {
				rotate([0,0,270]) translate([0,1.8,0]) connector_wall();
			}
		}
		if (height >= WALL_TALL) {
			translate([3,3,height-6]) cylinder(6.1,1.75,1.75);
		}
	}
}

