$fn=50;
difference(){
cube([20,10,5]);

translate([4,5,0])
cylinder(r1=1.5,r2=1.5,h=7);

translate([16,5,0])
cylinder(r1=1.5,r2=1.5,h=7);

translate([10,11,6])
rotate([90,0,0])
cylinder(r1=2.5,r2=2.5,h=12);

}