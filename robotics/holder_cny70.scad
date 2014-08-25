depth = 5;
width = 8;
bottom = 8.5;
nut_size = 3.2;
nut_depth = 2;

difference(){

union(){
translate([0,0,bottom])
cube(size = [depth,width,29], center = false);
cube(size = [15,width,bottom], center = false);
}

//holes
translate([-0.5,width/2,10.3+bottom]){
union(){
	rotate([0,90,0]){
		cylinder(h=depth+1, r=1.5, $fn=60);
		translate([0,0,depth-nut_depth+0.5])
		cylinder(h=nut_depth+0.5, r=nut_size, $fn=6);
	}
	
	translate([0,0,12.5]){
	rotate([0,90,0]){
		cylinder(h=depth+1, r=1.5, $fn=60);
		translate([0,0,depth-nut_depth+0.5])
		cylinder(h=nut_depth+0.5, r=nut_size, $fn=6);
	}
	}
}
}

translate([9.8,width/2],0){
union(){
	translate([0,0,bottom-nut_depth])
	cylinder(h=nut_depth, r=nut_size, $fn=6);
	cylinder(h=bottom, r=1.5, $fn=60);
}
}

polyhedron
	(	points = [
						[0,0,0], [7.5,0,0], [7.5,width,0], [0,width,0],
						[0,0,bottom/2], [0,width,bottom/2]
					],
		faces = [
						[0,3,1],[3,2,1],
						[0,1,4],
						[3,5,2],
						[4,1,5],[5,1,2],
						[5,3,4],[4,3,0]
					]

	);

}