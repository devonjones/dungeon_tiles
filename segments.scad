include <dungeon_lib.scad>
include <walls.scad>
include <tiles.scad>

module flooring(x=1, y=1, north=true, south=true, east=true, west=true, tileset="stone", tile=false, rot=false, style="stone") {
	seed_vect = rands(0, 100, 2);
	tile_vect = rands(tile == false ? 0 : tile, tile == false ? 4 : tile, x*y, seed=seed_vect[0]);
	rot_vect = rands(rot == false ? 0 : rot, rot == false ? 4 : rot, x*y, seed=seed_vect[1]);
	union() {
		for (xcnt = [0:x-1])  {
			for (ycnt = [0:y-1]) {
				translate([xcnt * 32 + 6, ycnt * 32 + 6,0]) tile([xcnt==0 && !west, ycnt==0 && !south, xcnt==x-1 && !east, ycnt==y-1  && !north], tile=floor(tile_vect[xcnt*y+ycnt]), rot=floor(rot_vect[xcnt*y+ycnt]), style=style);
				if(ycnt > 0) {
					translate([xcnt * 32 + 6, ycnt * 32+6,0]) rotate([0,0,270]) base_wall(WALL_SHORT, [false, false], [xcnt == 0 && !west, xcnt == x-1 && !east]);
				}
				if(xcnt > 0) {
					translate([xcnt * 32, ycnt * 32+6,0]) rotate([0,0,0]) base_wall(WALL_SHORT, [false, false], [ycnt == 0  && !south, ycnt == y-1 && !north]);
				}
				if(xcnt > 0 && ycnt > 0) {
					translate([xcnt * 32, ycnt * 32,0]) corner(WALL_SHORT, [false, false, false, false]);
				}
			}
		}
	}
}

module walling(x=1, y=1, north=true, south=true, east=true, west=true, tileset="stone", wall=false, rot=false, style="stone") {
	seed_vect = rands(0, 100, 2);
	wall_vect = rands(wall == false ? 0 : wall, wall == false ? 4 : wall, (x+y)*2, seed=seed_vect[0]);
	rot_vect = rands(rot == false ? 0 : rot, rot == false ? 4 : rot, (x+y)*2, seed=seed_vect[1]);
	union() {
		for (xcnt = [0:x])  {
			for (ycnt = [0:y]) {
				if ((xcnt == 0 || xcnt == x) && ycnt < y) {
					if(xcnt == 0 && west || xcnt == x && east) {
						translate([xcnt * 32, ycnt * 32+6,0]) wall([xcnt == x && east, xcnt == 0 && west], [ycnt == 0 && !south, ycnt == y-1 && !north], wall=floor(wall_vect[xcnt*y+ycnt]), rot=floor(rot_vect[xcnt*y+ycnt]), style=style);
					}
				}
				if ((ycnt == 0 || ycnt == y) && xcnt < x) {
					if(ycnt == 0 && south || ycnt == y && north) {
						translate([xcnt * 32+32, ycnt * 32,0]) rotate([0,0,90]) wall([ycnt == y && north, ycnt == 0 && south], [xcnt==x-1 && !east, xcnt==0 && !west], wall=floor(wall_vect[xcnt*y+ycnt]), rot=floor(rot_vect[xcnt*y+ycnt]), style=style);
					}
				}
				if (xcnt == 0 || xcnt == x || ycnt == 0 || ycnt == y) {
					if (xcnt == 0 && west || xcnt == x && east) {
						if (ycnt == 0 && south || ycnt == y && north || ycnt > 0 && ycnt < y) {
							translate([xcnt * 32, ycnt * 32,0]) corner(WALL_TALL, [xcnt != 0 && east, ycnt == y && north, xcnt == 0 && west, ycnt == 0 && south]);
						}
					} else if (ycnt == 0 && south || ycnt == y && north) {
						if (xcnt == 0 && west || xcnt == x && east || xcnt > 0 && xcnt < x) {
							translate([xcnt * 32, ycnt * 32,0]) corner(WALL_TALL, [false, ycnt != 0 && north, false, ycnt == 0 && south]);
						}
					}
				}
			}
		}
	}
}

module segment(x=1, y=1, north=true, south=true, east=true, west=true, wall_style="stone", floor_style="stone") {
	walling(x, y, north=north, south=south, east=east, west=west, style=wall_style);
	flooring(x, y, north=north, south=south, east=east, west=west, style=floor_style);
}

segment(1, 1, north=false, west=false, floor_style="wood", wall_style="stone");

module floor_1_2() {
	vect = rands(0, 4, 4);
	union() {
		translate([0,0,0]) stone_tile([true, true, true, false], tile=floor(vect[0]), rot=floor(vect[1]));
		translate([0,32,0]) stone_tile([true, false, true, true], tile=floor(vect[2]), rot=floor(vect[3]));

		translate([0,32,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false], [true, true]);
	}
}

module floor_2() {
	vect = rands(0, 4, 8);
	union() {
		translate([0,0,0]) stone_tile([true, true, false, false], tile=floor(vect[0]), rot=floor(vect[1]));
		translate([32,0,0]) stone_tile([false, true, true, false], tile=floor(vect[2]), rot=floor(vect[3]));
		translate([32,32,0]) stone_tile([false, false, true, true], tile=floor(vect[4]), rot=floor(vect[5]));
		translate([0,32,0]) stone_tile([true, false, false, true], tile=floor(vect[6]), rot=floor(vect[7]));

		translate([26,26,0]) corner(WALL_SHORT, [false, false, false, false]);

		translate([0,32,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false], [true, false]);
		translate([26,0,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false], [true, false]);
		translate([26,32,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false], [false, true]);
		translate([32,32,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false], [false, true]);
	}
}

module wall_1() {
	vect = rands(0, 4, 4);
	union() {
		translate([0,0,0]) stone_wall([false, true], [true, true], wall=floor(vect[0]), rot=floor(vect[1]));

		translate([6,0,0]) stone_tile([false, true], [true, true], tile=floor(vect[2]), rot=floor(vect[3]));
	}
}

module wall_1_2() {
	vect = rands(0, 4, 8);
	union() {
		translate([0,0,0]) stone_wall([false, true], [true, false], wall=floor(vect[0]), rot=floor(vect[1]));
		translate([0,32,0]) stone_wall([false, true], [false, true], wall=floor(vect[2]), rot=floor(vect[3]));

		translate([6,0,0]) stone_tile([false, true, true, false], tile=floor(vect[4]), rot=floor(vect[5]));
		translate([6,32,0]) stone_tile([false, false, true, true], tile=floor(vect[6]), rot=floor(vect[7]));

		translate([0,26,0]) corner(WALL_TALL, [false, false, true, false]);

		translate([6,32,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false], [false, true]);
	}
}

module wall_2() {
	vect = rands(0, 4, 12);
	union() {
		translate([0,0,0]) stone_wall([false, true], [true, false], wall=floor(vect[0]), rot=floor(vect[1]));
		translate([0,32,0]) stone_wall([false, true], [false, true], wall=floor(vect[2]), rot=floor(vect[3]));

		translate([6,0,0]) stone_tile([false, true, false, false], tile=floor(vect[4]), rot=floor(vect[5]));
		translate([38,0,0]) stone_tile([false, true, true, false], tile=floor(vect[6]), rot=floor(vect[7]));
		translate([38,32,0]) stone_tile([false, false, true, true], tile=floor(vect[8]), rot=floor(vect[9]));
		translate([6,32,0]) stone_tile([false, false, false, true], tile=floor(vect[10]), rot=floor(vect[11]));

		translate([0,26,0]) corner(WALL_TALL, [false, false, true, false]);
		translate([32,26,0]) corner(WALL_SHORT, [false, false, false, false]);

		translate([6,32,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false], [false, false]);
		translate([32,0,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false], [true, false]);
		translate([32,32,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false], [false, true]);
		translate([38,32,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false], [false, true]);
	}
}

module corner_1() {
	vect = rands(0, 4, 6);
	union() {
		translate([0,6,0]) stone_wall([false, true], [false, true], wall=floor(vect[0]), rot=floor(vect[1]));
		translate([32,0,0]) rotate([0,0,90]) stone_wall([false, true], [true, false], wall=floor(vect[2]), rot=floor(vect[3]));

		translate([6,6,0]) stone_tile([false, false, true, true], tile=floor(vect[4]), rot=floor(vect[5]));

		corner(WALL_TALL, [false, false, true, true]);
	}
}

module corner_2() {
	vect = rands(0, 4, 16);
	union() {
		translate([0,6,0]) stone_wall([false, true], [false, false], wall=floor(vect[0]), rot=floor(vect[1]));
		translate([32,0,0]) rotate([0,0,90]) stone_wall([false, true], [false, false], wall=floor(vect[2]), rot=floor(vect[3]));
		translate([0,38,0]) stone_wall([false, true], [false, true], wall=floor(vect[4]), rot=floor(vect[5]));
		translate([64,0,0]) rotate([0,0,90]) stone_wall([false, true], [true, false], wall=floor(vect[6]), rot=floor(vect[7]));

		translate([6,6,0]) stone_tile([false, false, false, false], tile=floor(vect[8]), rot=floor(vect[9]));
		translate([38,6,0]) stone_tile([false, false, true, false], tile=floor(vect[10]), rot=floor(vect[11]));
		translate([38,38,0]) stone_tile([false, false, true, true], tile=floor(vect[12]), rot=floor(vect[13]));
		translate([6,38,0]) stone_tile([false, false, false, true], tile=floor(vect[14]), rot=floor(vect[15]));

		corner(WALL_TALL, [false, false, true, true]);
		translate([0,32,0]) corner(WALL_TALL, [false, false, true, false]);
		translate([32,0,0]) corner(WALL_TALL, [false, false, false, true]);
		translate([32,32,0]) corner(WALL_SHORT, [false, false, false, false]);

		translate([6,38,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false], [false, false]);
		translate([32,6,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false], [false, false]);
		translate([32,38,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false], [false, true]);
		translate([38,38,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false], [false, true]);
	}
}

module dead_end_1() {
	vect = rands(0, 4, 8);
	union() {
		translate([0,6,0]) stone_wall([false, true], [false, true], wall=floor(vect[0]), rot=floor(vect[1]));
		translate([32,0,0]) rotate([0,0,90]) stone_wall([false, true], [false, false], wall=floor(vect[2]), rot=floor(vect[3]));
		translate([32,6,0]) rotate([0,0,0]) stone_wall([true, false], [false, true], wall=floor(vect[4]), rot=floor(vect[5]));

		translate([6,6,0]) stone_tile([false, false, false, true], tile=floor(vect[6]), rot=floor(vect[7]));

		corner(WALL_TALL, [false, false, true, true]);
		translate([32,0,0]) corner(WALL_TALL, [true, false, false, true]);
	}
}

module dead_end_2() {
	vect = rands(0, 4, 20);
	union() {
		translate([0,6,0]) stone_wall([false, true], [false, false], wall=floor(vect[0]), rot=floor(vect[1]));
		translate([32,0,0]) rotate([0,0,90]) stone_wall([false, true], [false, false], wall=floor(vect[2]), rot=floor(vect[3]));
		translate([0,38,0]) stone_wall([false, true], [false, true], wall=floor(vect[4]), rot=floor(vect[5]));
		translate([64,0,0]) rotate([0,0,90]) stone_wall([false, true], [false, false], wall=floor(vect[6]), rot=floor(vect[7]));
		translate([64,6,0]) rotate([0,0,0]) stone_wall([true, false], [false, false], wall=floor(vect[8]), rot=floor(vect[9]));
		translate([64,38,0]) rotate([0,0,0]) stone_wall([true, false], [false, true], wall=floor(vect[10]), rot=floor(vect[11]));

		translate([6,6,0]) stone_tile([false, false, false, false], tile=floor(vect[12]), rot=floor(vect[13]));
		translate([38,6,0]) stone_tile([false, false, false, false], tile=floor(vect[14]), rot=floor(vect[15]));
		translate([38,38,0]) stone_tile([false, false, false, true], tile=floor(vect[16]), rot=floor(vect[17]));
		translate([6,38,0]) stone_tile([false, false, false, true], tile=floor(vect[18]), rot=floor(vect[19]));

		corner(WALL_TALL, [false, false, true, true]);
		translate([0,32,0]) corner(WALL_TALL, [false, false, true, false]);
		translate([32,0,0]) corner(WALL_TALL, [false, false, false, true]);
		translate([32,32,0]) corner(WALL_SHORT, [false, false, false, false]);
		translate([64,0,0]) corner(WALL_TALL, [true, false, false, true]);
		translate([64,32,0]) corner(WALL_TALL, [true, false, false, false]);

		translate([6,38,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false], [false, false]);
		translate([32,6,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false], [false, false]);
		translate([32,38,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false], [false, true]);
		translate([38,38,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false], [false, false]);
	}
}

module hall_1() {
	vect = rands(0, 4, 6);
	union() {
		translate([0,0,0]) stone_wall([false, true], [true, true], wall=floor(vect[0]), rot=floor(vect[1]));
		translate([32,0,0]) rotate([0,0,0]) stone_wall([true, false], [true, true], wall=floor(vect[2]), rot=floor(vect[3]));

		translate([6,0,0]) stone_tile([false, true, false, true], tile=floor(vect[4]), rot=floor(vect[5]));
	}
}

module hall_1_2() {
	vect = rands(0, 4, 12);
	union() {
		translate([0,0,0]) stone_wall([false, true], [true, false], wall=floor(vect[0]), rot=floor(vect[1]));
		translate([0,32,0]) stone_wall([false, true], [false, true], wall=floor(vect[2]), rot=floor(vect[3]));
		translate([32,0,0]) rotate([0,0,0]) stone_wall([true, false], [true, false], wall=floor(vect[4]), rot=floor(vect[5]));
		translate([32,32,0]) rotate([0,0,0]) stone_wall([true, false], [false, true], wall=floor(vect[6]), rot=floor(vect[7]));

		translate([6,0,0]) stone_tile([false, true, false, false], tile=floor(vect[8]), rot=floor(vect[9]));
		translate([6,32,0]) stone_tile([false, false, false, true], tile=floor(vect[10]), rot=floor(vect[11]));

		translate([0,26,0]) corner(WALL_TALL, [false, false, true, false]);
		translate([32,26,0]) corner(WALL_TALL, [true, false, false, false]);

		translate([6,32,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false], [false, false]);
	}
}

module hall_2_1() {
	vect = rands(0, 4, 8);
	union() {
		translate([0,0,0]) stone_wall([false, true], [true, true], wall=floor(vect[0]), rot=floor(vect[1]));
		translate([64,0,0]) rotate([0,0,0]) stone_wall([true, false], [true, true], wall=floor(vect[2]), rot=floor(vect[3]));

		translate([6,0,0]) stone_tile([false, true, false, true], tile=floor(vect[4]), rot=floor(vect[5]));
		translate([38,0,0]) stone_tile([false, true, false, true], tile=floor(vect[6]), rot=floor(vect[7]));

		translate([32,0,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false], [true, true]);
	}
}

module hall_2() {
	vect = rands(0, 4, 16);
	union() {
		translate([0,0,0]) stone_wall([false, true], [true, false], wall=floor(vect[0]), rot=floor(vect[1]));
		translate([0,32,0]) stone_wall([false, true], [false, true], wall=floor(vect[2]), rot=floor(vect[3]));
		translate([64,0,0]) rotate([0,0,0]) stone_wall([true, false], [true, false], wall=floor(vect[4]), rot=floor(vect[5]));
		translate([64,32,0]) rotate([0,0,0]) stone_wall([true, false], [false, true], wall=floor(vect[6]), rot=floor(vect[7]));

		translate([6,0,0]) stone_tile([false, true, false, false], tile=floor(vect[8]), rot=floor(vect[9]));
		translate([38,0,0]) stone_tile([false, true, false, false], tile=floor(vect[10]), rot=floor(vect[11]));
		translate([38,32,0]) stone_tile([false, false, false, true], tile=floor(vect[12]), rot=floor(vect[13]));
		translate([6,32,0]) stone_tile([false, false, false, true], tile=floor(vect[14]), rot=floor(vect[15]));

		translate([0,26,0]) corner(WALL_TALL, [false, false, true, false]);
		translate([32,26,0]) corner(WALL_SHORT, [false, false, false, false]);
		translate([64,26,0]) corner(WALL_TALL, [true, false, false, false]);

		translate([6,32,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false], [false, false]);
		translate([32,0,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false], [true, false]);
		translate([32,32,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false], [false, true]);
		translate([38,32,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false], [false, false]);
	}
}

//wall_1();
//corner_1();
//dead_end_1();
//hall_1();

//floor_1_2();
//wall_1_2();
//hall_1_2();

//hall_2_1();

//floor_2();
//wall_2();
//corner_2();
//dead_end_2();
//hall_2();