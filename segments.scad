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
				translate([xcnt * 32 + 6, ycnt * 32 + 6,0]) tile(
					connections=[xcnt==0 && !west, ycnt==0 && !south, xcnt==x-1 && !east, ycnt==y-1  && !north],
					tile=floor(tile_vect[xcnt*y+ycnt]),
					rot=floor(rot_vect[xcnt*y+ycnt]),
					style=style);
				if(ycnt > 0) {
					translate([xcnt * 32 + 6, ycnt * 32+6,0]) rotate([0,0,270]) wall_base(
						WALL_SHORT,
						connections=[false, false],
						plugs=[xcnt == 0 && !west, xcnt == x-1 && !east]);
				}
				if(xcnt > 0) {
					translate([xcnt * 32, ycnt * 32+6,0]) rotate([0,0,0]) wall_base(
						WALL_SHORT,
						connections=[false, false],
						plugs=[ycnt == 0  && !south, ycnt == y-1 && !north]);
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
						translate([xcnt * 32, ycnt * 32+6,0]) wall(
							connections=[xcnt == x && east, xcnt == 0 && west],
							plugs=[ycnt == 0 && !south, ycnt == y-1 && !north],
							wall=floor(wall_vect[xcnt*y+ycnt]),
							rot=floor(rot_vect[xcnt*y+ycnt]),
							style=style);
					}
				}
				if ((ycnt == 0 || ycnt == y) && xcnt < x) {
					if(ycnt == 0 && south || ycnt == y && north) {
						translate([xcnt * 32+32, ycnt * 32,0]) rotate([0,0,90]) wall(
							connections=[ycnt == y && north, ycnt == 0 && south],
							plugs=[xcnt==x-1 && !east, xcnt==0 && !west],
							wall=floor(wall_vect[xcnt*y+ycnt]),
							rot=floor(rot_vect[xcnt*y+ycnt]),
							style=style);
					}
				}
				if (xcnt == 0 || xcnt == x || ycnt == 0 || ycnt == y) {
					if (xcnt == 0 && west || xcnt == x && east) {
						if (ycnt == 0 && south || ycnt == y && north || ycnt > 0 && ycnt < y) {
							translate([xcnt * 32, ycnt * 32,0]) corner(
								WALL_TALL,
								plugs=[xcnt != 0 && east, ycnt == y && north, xcnt == 0 && west, ycnt == 0 && south]);
						}
					} else if (ycnt == 0 && south || ycnt == y && north) {
						if (xcnt == 0 && west || xcnt == x && east || xcnt > 0 && xcnt < x) {
							translate([xcnt * 32, ycnt * 32,0]) corner(
								WALL_TALL,
								plugs=[false, ycnt != 0 && north, false, ycnt == 0 && south]);
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

module segment_corner(x=1, y=1, floor_style="stone", wall_style="stone")  {
	segment(size, size, north=false, east=false, floor_style=floor_style, wall_style=wall_style);
}

module segment_floor(x=1, y=1, floor_style="stone") {
	segment(x, y, north=false, south=false, east=false, west=false, floor_style=floor_style);
}

module segment_wall(x=1, y=1, floor_style="stone", wall_style="stone") {
	segment(x, y, north=false, east=false, west=false, floor_style=floor_style, wall_style=wall_style);
}

module segment_dead_end(x=1, y=1, floor_style="stone", wall_style="stone") {
	segment(x, y, north=false, floor_style=floor_style, wall_style=wall_style);
}

module segment_hall(x=1, y=1, floor_style="stone", wall_style="stone") {
	segment(x, y, east=false, west=false, floor_style=floor_style, wall_style=wall_style);
}
