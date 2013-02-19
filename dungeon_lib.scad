include <roundedcube.scad>

WALL_SHORT=4;
WALL_TALL=29.5;

module tile_connector() {
	union() {
		translate([0,.2,0]) cube([2.5,2.6,2]);
		translate([0,15.2,0]) cube([2.5,2.6,2]);
		translate([2.5,.2,0]) rotate([0,0,45]) cube([sqrt(4.3*4.3 + 4.3*4.3),2.6,2]);
		translate([2.5,17.8,0]) rotate([0,0,225]) cube([2.6,sqrt(4.3*4.3 + 4.3*4.3),2]);
		translate([4.2,4.5,0]) cube([2.6,9,2]);
	}
}

module tile_connector_gap() {
	union () {
		translate([0,0,0]) cube([2.5,3,2]);
		translate([0,15,0]) cube([2.5,3,2]);
		translate([2.5,0,0]) rotate([0,0,45]) cube([sqrt(4.5*4.5 + 4.5*4.5),3,2]);
		translate([2.5,18,0]) rotate([0,0,225]) cube([3,sqrt(4.5*4.5 + 4.5*4.5),2]);
		translate([4,4.5,0]) cube([3,9,2]);
	}
}

module tile(connections=[true,true,true,true]) {
	difference() {
		cube([26,26,3.5]);
		if (connections[0]) {
			translate([-0.01,4,0]) tile_connector_gap();
		}
		if (connections[1]) {
			translate([22,-0.01,0]) rotate([0,0,90]) tile_connector_gap();
		}
		if (connections[2]) {
			translate([26.01,22,0]) rotate([0,0,180]) tile_connector_gap();
		}
		if (connections[3]) {
			translate([4,26.01,0]) rotate([0,0,270]) tile_connector_gap();
		}
		translate([13,13,0]) cylinder(2,2.25,2.25);
	}
}

module wall_connector() {
	difference () {
		union () {
			translate([-.5,.55,0]) rounded_cube(3.5,1.4,3.8, .3);
			translate([2,-0.1,0]) rounded_cube(1.5,2.7,3.8, .3);
		}
	}
}

module wall_connector_gap() {
	union () {
		translate([0,.5,0]) cube([2,1.5,4]);
		translate([2,0,0]) cube([1.5,2.5,4]);
	}
}

module corner(height, plugs=[true,true,true,true]) {
	union () {
		translate([-0.01, -0.01, 0]) cube([6.02,6.02,height]);
		if (plugs[0]) {
			translate([6,1.8,0]) wall_connector();
		}
		if (plugs[1]) {
			rotate([0,0,90]) translate([6,-4.2,0]) wall_connector();
		}
		if (plugs[2]) {
			rotate([0,0,180]) translate([0,-4.2,0]) wall_connector();
		}
		if (plugs[3]) {
			rotate([0,0,270]) translate([0,1.8,0]) wall_connector();
		}
	}
}


module wall(height, connections=[true, true], plugs=[true, true]) {
	difference() {
		union() {
			translate([-0.1,0,0]) cube([6.02,26,height]);
			if (connections[0]) {
				translate([6,4,0]) tile_connector();
			}
			if (connections[1]) {
				translate([0,22,0]) rotate([0,0,180]) tile_connector();
			}
		}
		if (plugs[0]) {
			translate([4.25,-0.01,0]) rotate([0,0,90]) wall_connector_gap();
		}
		if (plugs[1]) {
			translate([1.75,26.01,0]) rotate([0,0,270]) wall_connector_gap();
		}
	}
}
