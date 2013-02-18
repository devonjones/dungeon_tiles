include <dungeon_lib.scad>

module stone_tile_1(connections=[true, true, true, true]) {
	union () {
		tile(connections);
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

module stone_tile_2(connections=[true, true, true, true]) {
	union () {
		tile(connections);
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

module stone_tile_3(connections=[true, true, true, true]) {
	union () {
		tile(connections);
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

module stone_tile_4(connections=[true, true, true, true]) {
	union () {
		tile(connections);
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

//stone_tile_1();
//stone_tile_2();
//stone_tile_3();
//stone_tile_4();
