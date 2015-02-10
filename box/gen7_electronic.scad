module slope(height,width,screw){
	difference(){
		cylinder(h=height,r=width/2.0);
		cylinder(h=height,r=screw/2.0);
	}
}

$fn=100;
height = 8.5;
union(){
	translate([10,10,2])
	slope(5,6,3);

	translate([100,10,2])
	slope(5,6,3);

	translate([100,130,2])
	slope(5,6,3);

	translate([10,130,2])
	slope(5,6,3);

	//top grip
	translate([4,4,30])
	slope(10,8,3);

	translate([106,4,30])
	slope(10,8,3);

	translate([106,136,30])
	slope(10,8,3);

	translate([4,136,30])
	slope(10,8,3);

difference(){
	cube([110,140,40]);

	// hole for electronic
	translate([2,2,2])
	cube([106,136,38]);
	
	// usb connector
	translate([0,28,height])
	cube([5,16,14]);

	// endstops
	translate([-1,80,25])
	rotate([0,90,0])
	cylinder(h=5,r=5);

	// heated bed and extruder
	// endstops
	translate([20,136,height+4])
	rotate([0,90,90])
	cylinder(h=5,r=4);

	// heated bed and extruder
	// endstops
	translate([60,136,height+4])
	rotate([0,90,90])
	cylinder(h=5,r=4);

	// axis
	translate([95,3,height+6])
	rotate([90,0,0])
	cylinder(h=5,r=6);

	// power cord
	translate([55,0,35])
	cube([40,5,20], center=true);	

	// screw holes
	translate([106,22.75,7.3])
	rotate([0,90,0])
	cylinder(h=5,r=1.5);

	translate([106,,117.25,7.3])
	rotate([0,90,0])
	cylinder(h=5,r=1.5);

}
}