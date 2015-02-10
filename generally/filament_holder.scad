$fn=100;
union(){
difference(){
union(){
	translate([0,0,3])
	cylinder(r1=25,r2=25,h=15);
	cylinder(r1=30,r2=30,h=3);
}
	// bearing hole
	translate([0,0,11])
	cylinder(r1=11.1,r2=11.1,h=7);

	// pole hole
	cylinder(r1=7,r2=7,h=23);

	// lighting 
	difference(){
		cylinder(r1=22,r2=22,h=23);
		cylinder(r1=14,r2=14,h=23);
	}
}
	
	for(i = [0:5]){
		rotate([0,0,i*360/6])
		translate([13.5,-2,0])
		cube([9,4,18]);
	}

}