include <segments.scad>

squares_long = 1; //[1:10]
squares_wide = 1; //[1:10]
wall_style="stone"; //[stone, wood_horiz, wood_vert, smooth]
floor_style="stone"; //[stone, wood_horiz, wood_vert, smooth]
wall_north="yes"; //[yes,no]
wall_south="yes"; //[yes,no]
wall_east="yes"; //[yes,no]
wall_west="yes"; //[yes,no]

module customizer(squares_long, squares_wide, wall_style, floor_style, wall_north, wall_south, wall_east, wall_west) {
	north = wall_north=="yes" ? true : false;
	south = wall_south=="yes" ? true : false;
	east = wall_east=="yes" ? true : false;
	west = wall_west=="yes" ? true : false;
	segment(squares_long, squares_wide, wall_style=wall_style, floor_style=floor_style, north=north, south=south, east=east, west=west);
}

customizer(squares_long, squares_wide, wall_style, floor_style, wall_north, wall_south, wall_east, wall_west);
