module matice(s,h){
	for(i=[0:1:2]){
		difference(){
			translate([0,0,h/2])
			rotate([0,0,60*i])
			cube([s,tan(30)*s,h],center=true);
		}
	}
}

$fn=50;
difference(){
union(){
	cube([10,10,110]);

	translate([2.5,10,110])
	rotate([90,0,0])
	cylinder(r1=7.5,r2=7.5,h=10);

	translate([5,10,0])
	rotate([90,0,0])
	cylinder(r1=5,r2=5,h=10);
}
	//horni dira
	translate([2.5,12,110])
	rotate([90,0,0])
	cylinder(r1=2.5,r2=2.5,h=13);

	// spodni uchyceni
	translate([11.5,12,8])
	rotate([90,0,0])
	cylinder(r1=2.5,r2=2.5,h=13);

	// diry uchyceni drzaku
	translate([-1,5,2]){
	rotate([0,90,0]){	
	matice(5.6,3);
	cylinder(r1=1.5,r2=1.5,h=17);
	}}

	translate([-1,5,14]){
	rotate([0,90,0]){
	matice(5.6,3);
	cylinder(r1=1.5,r2=1.5,h=17);
	}}
	
}