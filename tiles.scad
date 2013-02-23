include <dungeon_lib.scad>

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

module tile_stone_1(connections=[true, true, true, true], rot=0) {
	union () {
		tile_base(connections);
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

module tile_stone_2(connections=[true, true, true, true], rot=0) {
	union () {
		tile_base(connections);
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

module tile_stone_3(connections=[true, true, true, true], rot=0) {
	union () {
		tile_base(connections);
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

module tile_stone_4(connections=[true, true, true, true], rot=0) {
	union () {
		tile_base(connections);
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

module tile_stone(connections=[true,true,true,true], tile=0, rot=0) {
	if (tile == 1) {
		tile_stone_1(connections=connections, tile=tile, rot=rot);
	} else if (tile == 2) {
		tile_stone_2(connections=connections, tile=tile, rot=rot);
	} else if (tile == 3) {
		tile_stone_3(connections=connections, tile=tile, rot=rot);
	} else {
		tile_stone_4(connections=connections, tile=tile, rot=rot);
	}
}

module tile_wood_horiz(connections=[true, true, true, true], deg=90) {
	union () {
		tile_base(connections);
		for(i = [0 : 12]) {
			if (i % 3 == 0) {
				translate([0.25,i*2+.2, 2]) cube([8,1.6,1.9]);
				translate([8.65,i*2+.2,2]) cube([15,1.6,1.9]);
				translate([24.05,i*2+.2,2]) cube([1.7,1.6,1.9]);
			} else if (i % 3 == 1) {
				translate([0.25,i*2+.2,2]) cube([5,1.6,1.9]);
				translate([5.65,i*2+.2,2]) cube([15,1.6,1.9]);
				translate([21.05,i*2+.2,2]) cube([4.7,1.6,1.9]);
			} else {
				translate([0.25,i*2+.2,2]) cube([15,1.6,1.9]);
				translate([15.65,i*2+.2,2]) cube([10.1,1.6,1.9]);
			}
		}
	}
}

module tile_wood_vert(connections=[true, true, true, true], deg=90) {
	union () {
		tile_base(connections);
		for(i = [0 : 12]) {
			if (i % 3 == 0) {
				translate([i*2+.2, 0.25, 2]) cube([1.6,8,1.9]);
				translate([i*2+.2, 8.65, 2]) cube([1.6,15,1.9]);
				translate([i*2+.2, 24.05, 2]) cube([1.6,1.7,1.9]);
			} else if (i % 3 == 1) {
				translate([i*2+.2, 0.25, 2]) cube([1.6,5,1.9]);
				translate([i*2+.2, 5.65, 2]) cube([1.6,15,1.9]);
				translate([i*2+.2, 21.05, 2]) cube([1.6,4.7,1.9]);
			} else {
				translate([i*2+.2, 0.25, 2]) cube([1.6,15,1.9]);
				translate([i*2+.2, 15.65, 2]) cube([1.6,10.1,1.9]);
			}
		}
	}
}

module tile_wood(connections=[true, true, true, true], deg=0) {
	union () {
		tile_base(connections);
		intersection () {
			translate([0,0,2.1]) cube([26,26,2]);
			for ( i = [0: 90] ) {
				difference () {
					rotate([0,0,deg]) translate([i*2-40,-40,2.1]) cube([1.7,90,1.9]);
					for ( j = [0: 5] ) {
						if (i % 3 == 0) {
							rotate([0, 0, deg]) translate([i*2-40.2, j*15.3-40, 2]) cube([2.1, 0.4, 2.1]);	
						} else if (i % 3 == 1) {
							rotate([0, 0, deg]) translate([i*2-40.2, j*15.3-32.5, 2]) cube([2.1, 0.4, 2.1]);	
						} else {
							rotate([0, 0, deg]) translate([i*2-40.2, j*15.3-28, 2]) cube([2.1, 0.4, 2.1]);
						}
					}
				}
			}
		}
	}
}

module tile_smooth(connections=[true, true, true, true]) {
	union () {
		tile_base(connections);
		translate([0,0,2.1]) rounded_cube(25.9,25.9,2,0.5);
	}
}

module tile(connections=[true,true,true,true], tile=0, rot=0, deg=0, style="stone") {
	union() {
		if(style == "stone") {
			tile_stone(connections=connections, tile=tile, rot=rot);
		} else if (style == "smooth") {
			tile_smooth(connections=connections);
		} else if (style == "wood") {
			tile_wood(connections=connections, deg=deg);
		} else if (style == "wood_horiz") {
			tile_wood_horiz(connections=connections);
		} else if (style == "wood_vert") {
			tile_wood_vert(connections=connections);
		} else if (style == "wood_angle") {
			tile_wood(connections=connections, deg=45);
		} else if (style == "wood_angle_2") {
			tile_wood(connections=connections, deg=135);
		}
	}
}

//tile(style="wood_angle_2");
