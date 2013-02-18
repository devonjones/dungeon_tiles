//
// cube with rounded esges on all sides
// The first three parameters define the size of the cube
// The forth parameter defines the radius of the rounded edges
// made by Luc Bos
//

module rounded_cube(sx,sy,sz,r) 
{
	union()
	{
		translate([r,r,0]) cube([sx-2*r,sy-2*r,sz],false);
		translate([r,0,r]) cube([sx-2*r,sy,sz-2*r],false);
		translate([0,r,r]) cube([sx,sy-2*r,sz-2*r],false);

		translate([r,r,r]) rotate(a=[0,90,0]) cylinder(h=sx-2*r,r=r,center=false);
		translate([r,sy-r,r]) rotate(a=[0,90,0]) cylinder(h=sx-2*r,r=r,center=false);
		translate([r,r,sz-r]) rotate(a=[0,90,0]) cylinder(h=sx-2*r,r=r,center=false);
		translate([r,sy-r,sz-r]) rotate(a=[0,90,0]) cylinder(h=sx-2*r,r=r,center=false);

		translate([r,r,r]) rotate(a=[0,0,0]) cylinder(h=sz-2*r,r=r,center=false);
		translate([r,sy-r,r]) rotate(a=[0,0,0]) cylinder(h=sz-2*r,r=r,center=false);
		translate([sx-r,r,r]) rotate(a=[0,0,0]) cylinder(h=sz-2*r,r=r,center=false);
		translate([sx-r,sy-r,r]) rotate(a=[0,0,0]) cylinder(h=sz-2*r,r=r,center=false);

		translate([r,r,r]) rotate(a=[-90,0,0]) cylinder(h=sy-2*r,r=r,center=false);
		translate([r,r,sz-r]) rotate(a=[-90,0,0]) cylinder(h=sy-2*r,r=r,center=false);
		translate([sx-r,r,r]) rotate(a=[-90,0,0]) cylinder(h=sy-2*r,r=r,center=false);
		translate([sx-r,r,sz-r]) rotate(a=[-90,0,0]) cylinder(h=sy-2*r,r=r,center=false);

		translate([r,r,r]) sphere(r);
		translate([r,sy-r,r]) sphere(r);
		translate([r,r,sz-r]) sphere(r);
		translate([r,sy-r,sz-r]) sphere(r);

		translate([sx-r,r,r]) sphere(r);
		translate([sx-r,sy-r,r]) sphere(r);
		translate([sx-r,r,sz-r]) sphere(r);
		translate([sx-r,sy-r,sz-r]) sphere(r);
	}
}

