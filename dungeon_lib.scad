include <roundedcube.scad>

WALL_SHORT=4;
WALL_TALL=29.5;

// Connectors

module connector_tile() {
	union() {
		translate([0,.2,0]) cube([2.5,2.6,2]);
		translate([0,15.2,0]) cube([2.5,2.6,2]);
		translate([2.5,.2,0]) rotate([0,0,45]) cube([sqrt(4.3*4.3 + 4.3*4.3),2.6,2]);
		translate([2.5,17.8,0]) rotate([0,0,225]) cube([2.6,sqrt(4.3*4.3 + 4.3*4.3),2]);
		translate([4.2,4.5,0]) cube([2.6,9,2]);
	}
}

module connector_tile_gap() {
	union () {
		translate([0,0,-0.1]) cube([2.5,3,2.1]);
		translate([0,15,-0.1]) cube([2.5,3,2.1]);
		translate([2.5,0,-0.1]) rotate([0,0,45]) cube([sqrt(4.5*4.5 + 4.5*4.5),3,2.1]);
		translate([2.5,18,-0.1]) rotate([0,0,225]) cube([3,sqrt(4.5*4.5 + 4.5*4.5),2.1]);
		translate([4,4.5,-0.1]) cube([3,9,2.1]);
	}
}

module connector_wall() {
	difference () {
		union () {
			translate([-.5,.55,0]) rounded_cube(3.5,1.4,3.8, .3);
			translate([2,0,0]) rounded_cube(1.5,2.5,3.8, .3);
		}
	}
}

module connector_wall_gap() {
	union () {
		translate([0,.5,-0.1]) cube([2,1.5,4.1]);
		translate([2,0,-0.1]) cube([1.5,2.5,4.1]);
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

// Tiles

module tile_base(connections=[true,true,true,true]) {
	difference() {
		cube([26,26,3.5]);
		if (connections[0]) {
			translate([-0.01,4,0]) connector_tile_gap();
		}
		if (connections[1]) {
			translate([22,-0.01,0]) rotate([0,0,90]) connector_tile_gap();
		}
		if (connections[2]) {
			translate([26.01,22,0]) rotate([0,0,180]) connector_tile_gap();
		}
		if (connections[3]) {
			translate([4,26.01,0]) rotate([0,0,270]) connector_tile_gap();
		}
		translate([13,13,-0.1]) cylinder(2.1,2.25,2.25);
	}
}

// Walls

module wall_base(height, connections=[true, true], plugs=[true, true]) {
	difference() {
		union() {
			translate([-0.1,0,0]) cube([6.02,26,height]);
			if (connections[0]) {
				translate([6,4,0]) connector_tile();
			}
			if (connections[1]) {
				translate([0,22,0]) rotate([0,0,180]) connector_tile();
			}
		}
		if (plugs[0]) {
			translate([4.25,-0.01,0]) rotate([0,0,90]) connector_wall_gap();
		}
		if (plugs[1]) {
			translate([1.75,26.01,0]) rotate([0,0,270]) connector_wall_gap();
		}
	}
}
