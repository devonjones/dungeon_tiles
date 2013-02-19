include <dungeon_lib.scad>

module stone_tile_1(connections=[true, true, true, true], rot=0) {
	union () {
		tile(connections);
		tile_rotate(rot) {
			union() {
				translate([10,18,4]) rotate([0,90,0]) rounded_cube(1.5,8,16,.5);
				translate([20,17.5,4]) rotate([90,90,0]) rounded_cube(1.5,6,10,.5);
				translate([10,13.5,4]) rotate([0,90,0]) rounded_cube(1.5,4,9.5,.5);
				translate([17,0,4]) rotate([0,90,0]) rounded_cube(1.5,7,9,.5);
				translate([17,7.5,4]) rotate([0,90,0]) rounded_cube(1.5,5.5,2.5,.5);
				translate([6,0,4]) rotate([0,90,0]) rounded_cube(1.5,13,10.5,.5);
				translate([0,13.5,4]) rotate([0,90,0]) rounded_cube(1.5,12.5,9.5,.5);
				translate([0,0,4]) rotate([0,90,0]) rounded_cube(1.5,13,5.5,.5);
			}
		}
	}
}

module stone_tile_2(connections=[true, true, true, true], rot=0) {
	union () {
		tile(connections);
		tile_rotate(rot) {
			union() {
				translate([0,18,4]) rotate([0,90,0]) rounded_cube(1.5,8,16,.5);
				translate([10,17.5,4]) rotate([90,90,0]) rounded_cube(1.5,6,10,.5);
				translate([16.5,15.5,4]) rotate([0,90,0]) rounded_cube(1.5,4,9.5,.5);
				translate([16.5,20,4]) rotate([0,90,0]) rounded_cube(1.5,6,6,.5);
				translate([23,20,4]) rotate([0,90,0]) rounded_cube(1.5,6,3,.5);
				translate([7,7.5,4]) rotate([0,90,0]) rounded_cube(1.5,5.5,2.5,.5);
				translate([16.5,0,4]) rotate([0,90,0]) rounded_cube(1.5,15,9.5,.5);
				translate([0,13.5,4]) rotate([0,90,0]) rounded_cube(1.5,4,9.5,.5);
				translate([0,0,4]) rotate([0,90,0]) rounded_cube(1.5,13,6.5,.5);
				translate([7,0,4]) rotate([0,90,0]) rounded_cube(1.5,7,6.5,.5);
				translate([14,0,4]) rotate([0,90,0]) rounded_cube(1.5,7,2,.5);
			}
		}
	}
}

module stone_tile_3(connections=[true, true, true, true], rot=0) {
	union () {
		tile(connections);
		tile_rotate(rot) {
			union() {
				translate([10,10,4]) rotate([0,90,0]) rounded_cube(1.5,8,16,.5);
				translate([20,9.5,4]) rotate([90,90,0]) rounded_cube(1.5,6,9.5,.5);
				translate([0,14,4]) rotate([0,90,0]) rounded_cube(1.5,7,9.5,.5);
				translate([0,0,4]) rotate([0,90,0]) rounded_cube(1.5,7,8,.5);
				translate([8.5,4,4]) rotate([0,90,0]) rounded_cube(1.5,5.5,3.5,.5);
				translate([0,7.5,4]) rotate([0,90,0]) rounded_cube(1.5,6,8,.5);
				translate([0,10,4]) rotate([0,90,0]) rounded_cube(1.5,3.5,9.5,.5);
				translate([8.5,0,4]) rotate([0,90,0]) rounded_cube(1.5,3.5,11,.5);
				translate([12.5,4,4]) rotate([0,90,0]) rounded_cube(1.5,5.5,7,.5);
				translate([0,21.5,4]) rotate([0,90,0]) rounded_cube(1.5,4.5,15,.5);
				translate([15.5,18.5,4]) rotate([0,90,0]) rounded_cube(1.5,7.5,10.5,.5);
				translate([10,18.5,4]) rotate([0,90,0]) rounded_cube(1.5,2.5,5,.5);
			}
		}
	}
}

module stone_tile_4(connections=[true, true, true, true], rot=0) {
	union () {
		tile(connections);
		tile_rotate(rot) {
			union() {
				translate([5,9,4]) rotate([0,90,0]) rounded_cube(1.5,8,16,.5);
				translate([0,13,4]) rotate([90,90,0]) rounded_cube(1.5,4.5,13,.5);
				translate([0,20.5,4]) rotate([90,90,0]) rounded_cube(1.5,4.5,7,.5);
				translate([5,17.5,4]) rotate([0,90,0]) rounded_cube(1.5,3,9.5,.5);
				translate([15,17.5,4]) rotate([0,90,0]) rounded_cube(1.5,8.5,11,.5);
				translate([7,21,4]) rotate([0,90,0]) rounded_cube(1.5,5,7.5,.5);
				translate([0,21,4]) rotate([0,90,0]) rounded_cube(1.5,5,6.5,.5);
				translate([21.5,6,4]) rotate([0,90,0]) rounded_cube(1.5,11,4.5,.5);
				translate([5,0,4]) rotate([0,90,0]) rounded_cube(1.5,8.5,9.5,.5);
				translate([15,0,4]) rotate([0,90,0]) rounded_cube(1.5,5.5,11,.5);
				translate([15,6,4]) rotate([0,90,0]) rounded_cube(1.5,2.5,6,.5);
			}
		}
	}
}

module tile_rotate(rot) {
	if (rot == 1) {
		translate([26,0,0]) rotate([0,0,90]) child(0);
	} else if (rot == 2) {
		translate([26,26,0]) rotate([0,0,180]) child(0);
	} else if (rot == 3) {
		translate([0,26,0]) rotate([0,0,270]) child(0);
	} else {
		translate([0,0,0]) rotate([0,0,0]) child(0);
	}
}

module stone_tile(connections=[true,true,true,true]) {
	vect = rands(0, 4, 2);
	wall = floor(vect[0]);
	rot = floor(vect[1]);
	if (wall == 1) {
		stone_tile_1(connections=connections, rot=rot);
	} else if (wall == 2) {
		stone_tile_2(connections=connections, rot=rot);
	} else if (wall == 3) {
		stone_tile_3(connections=connections, rot=rot);
	} else {
		stone_tile_4(connections=connections, rot=rot);
	}
}

module wood_tile_1(connections=[true, true, true, true]) {
	union () {
		tile(connections);
		for ( i = [0: 19] ) {
			translate([i*1.3,0,2.1]) cube([1.1,26,1.9]);
		}
	}
}

module wood_tile_2(connections=[true, true, true, true]) {
	union () {
		tile(connections);
		intersection() {
			translate([0,0,2.1]) cube([26,26,2]);
			for ( i = [0: 40] ) {
				rotate([0,0,45]) translate([i*1.3,-20,2.1]) cube([1.1,40,1.9]);
			}
		}
	}
}

//stone_tile_1();
//stone_tile_2();
//stone_tile_3();
//stone_tile_4();
//wood_tile_1();
//wood_tile_2();
