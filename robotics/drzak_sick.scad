// render circles in square cornes with diameter = screwSize
module screwHolesSquare(dimension, screwSize){
	// left bottom
	circle(d=screwSize, $fn=100);
	
	// right bottom
	translate([dimension[0],0])
	circle(d=screwSize, $fn=100);

	// right top
	translate([dimension[0],dimension[1]])
	circle(d=screwSize, $fn=100);

	// left top
	translate([0,dimension[1]])
	circle(d=screwSize, $fn=100);
}

linear_extrude(height = 5, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0){
difference(){
polygon([[0,0], [0,60], [-41.5, 115], [-101.5,115], [-101.5,60], [-41.5,0]]);

// holes for mob mount
translate([-30.75,10])
screwHolesSquare([20,40],5);

//holes for sick mount
translate([-46,95.6,0])
circle(d=3, $fn=100);

translate([-97,95.6,0])
circle(d=3, $fn=100);

//lightweight
translate([-30.75,20,0])
square([20,20],center=false);

polygon([[-41.5,15],[-86.5,60],[-41.5,60]], center = false);

translate([-87,75,0])
square([31,25],center=false);

}}