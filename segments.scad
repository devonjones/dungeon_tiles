include <dungeon_lib.scad>
include <walls.scad>
include <tiles.scad>

module floor_2() {
	union() {
		translate([0,0,0]) stone_tile_1([true, true, false, false]);
		translate([32,0,0]) stone_tile_3([false, true, true, false]);
		translate([32,32,0]) stone_tile_2([false, false, true, true]);
		translate([0,32,0]) stone_tile_3([true, false, false, true]);

		translate([26,26,0]) corner(WALL_SHORT, [false, false, false, false]);

		translate([0,32,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false, true, false]);
		translate([26,0,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false, true, false]);
		translate([26,32,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false, false, true]);
		translate([32,32,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false, false, true]);
	}
}

module wall_1() {
	union() {
		translate([0,0,0]) stone_wall_3([false, true, true, true]);

		translate([6,0,0]) stone_tile_4([false, true, true, true]);
	}
}

module wall_1_2() {
	union() {
		translate([0,0,0]) stone_wall_4([false, true, true, false]);
		translate([0,32,0]) stone_wall_1([false, true, false, true]);

		translate([6,0,0]) stone_tile_3([false, true, true, false]);
		translate([6,32,0]) stone_tile_2([false, false, true, true]);

		translate([0,26,0]) corner(WALL_TALL, [false, false, true, false]);

		translate([6,32,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false, false, true]);
	}
}

module wall_2() {
	union() {
		translate([0,0,0]) stone_wall_3([false, true, true, false]);
		translate([0,32,0]) stone_wall_2([false, true, false, true]);

		translate([6,0,0]) stone_tile_3([false, true, false, false]);
		translate([38,0,0]) stone_tile_1([false, true, true, false]);
		translate([38,32,0]) stone_tile_4([false, false, true, true]);
		translate([6,32,0]) stone_tile_2([false, false, false, true]);

		translate([0,26,0]) corner(WALL_TALL, [false, false, true, false]);
		translate([32,26,0]) corner(WALL_SHORT, [false, false, false, false]);

		translate([6,32,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false, false, false]);
		translate([32,0,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false, true, false]);
		translate([32,32,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false, false, true]);
		translate([38,32,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false, false, true]);
	}
}

module corner_1() {
	union() {
		translate([0,6,0]) stone_wall_1([false, true, false, true]);
		translate([32,0,0]) rotate([0,0,90]) stone_wall_2([false, true, true, false]);

		translate([6,6,0]) stone_tile_1([false, false, true, true]);

		corner(WALL_TALL, [false, false, true, true]);
	}
}

module corner_2() {
	union() {
		translate([0,6,0]) stone_wall_1([false, true, false, false]);
		translate([32,0,0]) rotate([0,0,90]) stone_wall_2([false, true, false, false]);
		translate([0,38,0]) stone_wall_3([false, true, false, true]);
		translate([64,0,0]) rotate([0,0,90]) stone_wall_4([false, true, true, false]);

		translate([6,6,0]) stone_tile_1([false, false, false, false]);
		translate([38,6,0]) stone_tile_2([false, false, true, false]);
		translate([38,38,0]) stone_tile_3([false, false, true, true]);
		translate([6,38,0]) stone_tile_4([false, false, false, true]);

		corner(WALL_TALL, [false, false, true, true]);
		translate([0,32,0]) corner(WALL_TALL, [false, false, true, false]);
		translate([32,0,0]) corner(WALL_TALL, [false, false, false, true]);
		translate([32,32,0]) corner(WALL_SHORT, [false, false, false, false]);

		translate([6,38,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false, false, false]);
		translate([32,6,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false, false, false]);
		translate([32,38,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false, false, true]);
		translate([38,38,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false, false, true]);
	}
}

module dead_end_1() {
	union() {
		translate([0,6,0]) stone_wall_2([false, true, false, true]);
		translate([32,0,0]) rotate([0,0,90]) stone_wall_3([false, true, false, false]);
		translate([32,6,0]) rotate([0,0,0]) stone_wall_1([true, false, false, true]);

		translate([6,6,0]) stone_tile_1([false, false, false, true]);

		corner(WALL_TALL, [false, false, true, true]);
		translate([32,0,0]) corner(WALL_TALL, [true, false, false, true]);
	}
}

module dead_end_2() {
	union() {
		translate([0,6,0]) stone_wall_1([false, true, false, false]);
		translate([32,0,0]) rotate([0,0,90]) stone_wall_2([false, true, false, false]);
		translate([0,38,0]) stone_wall_3([false, true, false, true]);
		translate([64,0,0]) rotate([0,0,90]) stone_wall_4([false, true, false, false]);
		translate([64,6,0]) rotate([0,0,0]) stone_wall_2([true, false, false, false]);
		translate([64,38,0]) rotate([0,0,0]) stone_wall_4([true, false, false, true]);

		translate([6,6,0]) stone_tile_1([false, false, false, false]);
		translate([38,6,0]) stone_tile_2([false, false, false, false]);
		translate([38,38,0]) stone_tile_3([false, false, false, true]);
		translate([6,38,0]) stone_tile_4([false, false, false, true]);

		corner(WALL_TALL, [false, false, true, true]);
		translate([0,32,0]) corner(WALL_TALL, [false, false, true, false]);
		translate([32,0,0]) corner(WALL_TALL, [false, false, false, true]);
		translate([32,32,0]) corner(WALL_SHORT, [false, false, false, false]);
		translate([64,0,0]) corner(WALL_TALL, [true, false, false, true]);
		translate([64,32,0]) corner(WALL_TALL, [true, false, false, false]);

		translate([6,38,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false, false, false]);
		translate([32,6,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false, false, false]);
		translate([32,38,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false, false, true]);
		translate([38,38,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false, false, false]);
	}
}

module hall_1() {
	union() {
		translate([0,0,0]) stone_wall_2([false, true, true, true]);
		translate([32,0,0]) rotate([0,0,0]) stone_wall_1([true, false, true, true]);

		translate([6,0,0]) stone_tile_1([false, true, false, true]);
	}
}

module hall_1_2() {
	union() {
		translate([0,0,0]) stone_wall_3([false, true, true, false]);
		translate([0,32,0]) stone_wall_4([false, true, false, true]);
		translate([32,0,0]) rotate([0,0,0]) stone_wall_1([true, false, true, false]);
		translate([32,32,0]) rotate([0,0,0]) stone_wall_2([true, false, false, true]);

		translate([6,0,0]) stone_tile_1([false, true, false, false]);
		translate([6,32,0]) stone_tile_4([false, false, false, true]);

		translate([0,26,0]) corner(WALL_TALL, [false, false, true, false]);
		translate([32,26,0]) corner(WALL_TALL, [true, false, false, false]);

		translate([6,32,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false, false, false]);
	}
}

module hall_2_1() {
	union() {
		translate([0,0,0]) stone_wall_4([false, true, true, true]);
		translate([64,0,0]) rotate([0,0,0]) stone_wall_3([true, false, true, true]);

		translate([6,0,0]) stone_tile_1([false, true, false, true]);
		translate([38,0,0]) stone_tile_2([false, true, false, true]);

		translate([32,0,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false, true, true]);
	}
}

module hall_2() {
	union() {
		translate([0,0,0]) stone_wall_3([false, true, true, false]);
		translate([0,32,0]) stone_wall_4([false, true, false, true]);
		translate([64,0,0]) rotate([0,0,0]) stone_wall_1([true, false, true, false]);
		translate([64,32,0]) rotate([0,0,0]) stone_wall_2([true, false, false, true]);

		translate([6,0,0]) stone_tile_1([false, true, false, false]);
		translate([38,0,0]) stone_tile_2([false, true, false, false]);
		translate([38,32,0]) stone_tile_3([false, false, false, true]);
		translate([6,32,0]) stone_tile_4([false, false, false, true]);

		translate([0,26,0]) corner(WALL_TALL, [false, false, true, false]);
		translate([32,26,0]) corner(WALL_SHORT, [false, false, false, false]);
		translate([64,26,0]) corner(WALL_TALL, [true, false, false, false]);

		translate([6,32,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false, false, false]);
		translate([32,0,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false, true, false]);
		translate([32,32,0]) rotate([0,0,0]) wall(WALL_SHORT, [false, false, false, true]);
		translate([38,32,0]) rotate([0,0,270]) wall(WALL_SHORT, [false, false, false, false]);
	}
}

//floor_2();
//wall_1();
//wall_1_2();
//wall_2();
//corner_1();
//corner_2();
//dead_end_1();
//dead_end_2();
//hall_1();
//hall_1_2();
//hall_2_1();
//hall_2();