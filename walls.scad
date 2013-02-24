include <dungeon_lib.scad>

module connector_tile() {
	union() {
		translate([0,.2,0]) cube([2.5,2.6,2]);
		translate([0,15.2,0]) cube([2.5,2.6,2]);
		translate([2.5,.2,0]) rotate([0,0,45]) cube([sqrt(4.3*4.3 + 4.3*4.3),2.6,2]);
		translate([2.5,17.8,0]) rotate([0,0,225]) cube([2.6,sqrt(4.3*4.3 + 4.3*4.3),2]);
		translate([4.2,4.5,0]) cube([2.6,9,2]);
	}
}

module connector_wall_gap() {
	union () {
		translate([0,.5,-0.1]) cube([2,1.5,4.2]);
		translate([2,0,-0.1]) cube([1.5,2.5,4.2]);
	}
}

module wall_rotate(rot) {
	if (rot == 1) {
		translate([0,29.75,3.5]) rotate([90,0,0]) child(0);
	} else if (rot == 2) {
		translate([0,26,33.5]) rotate([180,0,0]) child(0);
	} else if (rot == 3) {
		translate([0,-3.75,29.5]) rotate([270,0,0]) child(0);
	} else {
		translate([0,0,0]) rotate([0,0,0]) child(0);
	}
}

module wall_remove_plugs(plugs) {
	difference() {
		child();
		if (plugs[0]) {
			translate([4.25,-0.01,0]) rotate([0,0,90]) connector_wall_gap();
		}
		if (plugs[1]) {
			translate([1.75,26.01,0]) rotate([0,0,270]) connector_wall_gap();
		}
	}
}

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

module wall_stone_1(connections=[true, true], plugs=[true, true], rot=0) {
	wall_remove_plugs(plugs) {
		union() {
			wall_base(WALL_TALL, connections, plugs);
			wall_rotate(rot) {
				union() {
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
		}
	}
}

module wall_stone_2(connections=[true, true], plugs=[true, true], rot=0) {
	wall_remove_plugs(plugs) {
		union() {
			wall_base(WALL_TALL, connections, plugs);
			wall_rotate(rot) {
				union() {
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
		}
	}
}

module wall_stone_3(connections=[true, true], plugs=[true, true], rot=0) {
	wall_remove_plugs(plugs) {
		union() {
			wall_base(WALL_TALL, connections, plugs);
			wall_rotate(rot) {
				union() {
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
		}
	}
}

module wall_stone_4(connections=[true, true], plugs=[true, true], rot=0) {
	wall_remove_plugs(plugs) {
		union() {
			wall_base(WALL_TALL, connections, plugs);
			wall_rotate(rot) {
				union() {
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
		}
	}
}

module wall_stone(connections=[true,true], plugs=[true,true], wall=0, rot=0) {
	if (wall == 1) {
		wall_stone_2(connections=connections, plugs=plugs, rot=rot);
	} else if (wall == 2) {
		wall_stone_3(connections=connections, plugs=plugs, rot=rot);
	} else if (wall == 3) {
		wall_stone_4(connections=connections, plugs=plugs, rot=rot);
	} else {
		wall_stone_1(connections=connections, plugs=plugs, rot=rot);
	}
}

module wall_wood_vert(connections=[true,true], plugs=[true,true], deg=0) {
	union () {
		wall_base(WALL_TALL, connections, plugs);
		for(i = [0 : 12]) {
			if (i % 3 == 0) {
				translate([-0.5,i*2+.15,4.25]) cube([6.8,1.6,8]);
				translate([-0.5,i*2+.15,12.65]) cube([6.8,1.6,16.60]);
			} else if (i % 3 == 1) {
				translate([-0.5,i*2+.15,4.25]) cube([6.8,1.6,5]);
				translate([-0.5,i*2+.15,9.65]) cube([6.8,1.6,15]);
				translate([-0.5,i*2+.15,25.05]) cube([6.8,1.6,4.2]);
			} else {
				translate([-0.5,i*2+.15,4.25]) cube([6.8,1.6,15]);
				translate([-0.5,i*2+.15,19.65]) cube([6.8,1.6,9.6]);
			}
		}
	}
}

module wall_wood_horiz(connections=[true,true], plugs=[true,true], deg=0) {
	union () {
		wall_base(WALL_TALL, connections, plugs);
		for(i = [0 : 11]) {
			if (i % 3 == 0) {
				rotate([90, 0, 0]) translate([-0.5,i*2.05+5,-25.75]) cube([6.8,1.65,8]);
				rotate([90, 0, 0]) translate([-0.5,i*2.05+5,-17.35]) cube([6.8,1.65,17.10]);
			} else if (i % 3 == 1) {
				rotate([90, 0, 0]) translate([-0.5,i*2.05+5,-25.75]) cube([6.8,1.65,5]);
				rotate([90, 0, 0]) translate([-0.5,i*2.05+5,-20.35]) cube([6.8,1.65,15]);
				rotate([90, 0, 0]) translate([-0.5,i*2.05+5,-4.95]) cube([6.8,1.65,4.7]);
			} else {
				rotate([90, 0, 0]) translate([-0.5,i*2.05+5,-25.75]) cube([6.8,1.65,15]);
				rotate([90, 0, 0]) translate([-0.5,i*2.05+5,-10.35]) cube([6.8,1.65,10.1]);
			}
		}
	}
}

module wall_wood(connections=[true,true], plugs=[true,true], deg=0) {
	union () {
		wall_base(WALL_TALL, connections, plugs);
		intersection() {
			translate([-0.5,0.5,4.25]) cube([7,25,25]);
			for ( i = [0: 90] ) {
				difference () {
					rotate([deg,0,0]) translate([-0.5,i*2-40,-40]) cube([6.8,1.6,90]);
					for ( j = [0: 5] ) {
						if (i % 3 == 0) {
							rotate([deg, 0, 0]) translate([-0.6, i*2-40, j*15.3-40]) cube([7, 1.9, 0.4]);	
						} else if (i % 3 == 1) {
							rotate([deg, 0, 0]) translate([-0.6, i*2-40, j*15.3-32.5]) cube([7, 1.9, 0.4]);	
						} else {
							rotate([deg, 0, 0]) translate([-0.6, i*2-40, j*15.3-28]) cube([7, 1.9, 0.4]);
						}
					}
				}
			}
		}
	}
}

module wall_smooth(connections=[true,true], plugs=[true,true]) {
	union () {
		wall_base(WALL_TALL, connections, plugs);
		translate([-0.6,0.1,4.1]) rounded_cube(7,25.8,25.3, 0.5);
	}
}

module wall(connections=[true,true], plugs=[true,true], wall=0, rot=0, deg=0, style="stone") {
	union() {
		if(style == "stone") {
			wall_stone(connections=connections, plugs=plugs, wall=wall, rot=rot);
		} else if (style == "smooth") {
			wall_smooth(connections=connections, plugs=plugs);
		} else if (style == "wood") {
			wall_wood(connections=connections, plugs=plugs, deg=deg);
		} else if (style == "wood_horiz") {
			wall_wood_horiz(connections=connections, plugs=plugs);
		} else if (style == "wood_vert") {
			wall_wood_vert(connections=connections, plugs=plugs);
		} else if (style == "wood_angle") {
			wall_wood(connections=connections, plugs=plugs, deg=45);
		} else if (style == "wood_angle_2") {
			wall_wood(connections=connections, plugs=plugs, deg=135);
		}
	}
}

//wall(style="stone", wall=3, rot=3);
