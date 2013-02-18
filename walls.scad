include <dungeon_lib.scad>

module stone_wall_1(connections=[true, true, true, true]) {
	union() {
		wall(WALL_TALL, connections);
		translate([-.5,0,4]) rounded_cube(7,8,16,.5);
		translate([-.5,8.5,4]) rounded_cube(7,7,5,.5);
		translate([-.5,16,4]) rounded_cube(7,4.5,5,.5);
		translate([-.5,8.5,9.5]) rounded_cube(7,12,6,.5);
		translate([-.5,21,4]) rounded_cube(7,5,19,.5);
		translate([-.5,0,20.5]) rounded_cube(7,12,9,.5);
		translate([-.5,12.5,23.5]) rounded_cube(7,13.5,6,.5);
		translate([-.5,8.5,16]) rounded_cube(7,3.5,4,.5);
		translate([-.5,12.5,16]) rounded_cube(7,8,7,.5);
	}
}

module stone_wall_2(connections=[true, true, true, true]) {
	union() {
		wall(WALL_TALL, connections);
		translate([-.5,10,8]) rounded_cube(7,8,16,.5);
		translate([-.5,10,4]) rounded_cube(7,16,3.5,.5);
		translate([-.5,0,4]) rounded_cube(7,9.5,7,.5);
		translate([-.5,18.5,8]) rounded_cube(7,7.5,6,.5);
		translate([-.5,21,14.5]) rounded_cube(7,5,15,.5);
		translate([-.5,18.5,14.5]) rounded_cube(7,2,9.5,.5);
		translate([-.5,6,24.5]) rounded_cube(7,14.5,5,.5);
		translate([-.5,2,24.5]) rounded_cube(7,3.5,2.5,.5);
		translate([-.5,0,27.5]) rounded_cube(7,5.5,2,.5);
		translate([-.5,0,24.5]) rounded_cube(7,1.5,2.5,.5);
		translate([-.5,0,11.5]) rounded_cube(7,9.5,12.5,.5);
	}
}

module stone_wall_3(connections=[true, true, true, true]) {
	union() {
		wall(WALL_TALL, connections);
		translate([-.5,6,8]) rounded_cube(7,16,8,.5);
		translate([-.5,0,4]) rounded_cube(7,18.5,3.5,.5);
		translate([-.5,19,4]) rounded_cube(7,7,3.5,.5);
		translate([-.5,16.5,16.5]) rounded_cube(7,9.5,6.5,.5);
		translate([-.5,19.5,23.5]) rounded_cube(7,6.5,6,.5);
		translate([-.5,10,16.5]) rounded_cube(7,6,13,.5);
		translate([-.5,16.5,23.5]) rounded_cube(7,2.5,6,.5);
		translate([-.5,22.5,8]) rounded_cube(7,3.5,8,.5);
		translate([-.5,0,8]) rounded_cube(7,5.5,5,.5);
		translate([-.5,0,13.5]) rounded_cube(7,5.5,10,.5);
		translate([-.5,0,24]) rounded_cube(7,9.5,5.5,.5);
		translate([-.5,6,16.5]) rounded_cube(7,3.5,7,.5);
	}
}

module stone_wall_4(connections=[true, true, true, true]) {
	union() {
		wall(WALL_TALL, connections);
		translate([-.5,6,12]) rounded_cube(7,16,8,.5);
		translate([-.5,0,4]) rounded_cube(7,18.5,3.5,.5);
		translate([-.5,19,4]) rounded_cube(7,7,7.5,.5);
		translate([-.5,22.5,12]) rounded_cube(7,3.5,17.5,.5);
		translate([-.5,6,8]) rounded_cube(7,6.5,3.5,.5);
		translate([-.5,13,8]) rounded_cube(7,5.5,3.5,.5);
		translate([-.5,0,8]) rounded_cube(7,5.5,16,.5);
		translate([-.5,0,24.5]) rounded_cube(7,9,5,.5);
		translate([-.5,6,20.5]) rounded_cube(7,9,3.5,.5);
		translate([-.5,15.5,20.5]) rounded_cube(7,6.5,9,.5);
		translate([-.5,9.5,24.5]) rounded_cube(7,5.5,5,.5);
	}
}

//stone_wall_1();
//stone_wall_2();
//stone_wall_3();
//stone_wall_4();
