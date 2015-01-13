$fn=100;

difference(){
union(){
	cylinder(r1=23.5,r2=23.5,h=2.4);
	translate([0,0,2.4])
	cylinder(r1=21.75,r2=21.75,h=1.5);
	translate([0,0,2.4+1.5])
	cylinder(r1=22.7,r2=22.1,h=3.8);
	translate([0,0,2.4+1.5+3.8])
	cylinder(r1=17,r2=17,h=4.5);
}

cylinder(r1=20,r2=20,h=6);
cylinder(r1=13,r2=13,h=20);

translate([0,23.5,0])
cylinder(r1=1.7,r2=1.7,h=20);
translate([0,-23.5,0])
cylinder(r1=1.7,r2=1.7,h=20);

translate([5,-50,3.4])
cube([100,100,10]);
}
