switch_width = 19.5;
switch_height = 13.2;
spaccing_width = 10;
spaccing_height = 5;
depth = 5;

switchs = 6;

width = 2*spaccing_width + switch_width;
height = 2*spaccing_height + spaccing_height*(switchs - 1) + switchs*switch_height;

module holder(){
difference(){
		union(){
			cube([10,10,5]);
			translate([0,5,0])
			cylinder(r1=5,r2=5,h=5,$fn=100);
		}	
		translate([0,5,0])
		cylinder(r1=2.5,r2=2.5,h=5,$fn=100);
	}
}

difference(){
union(){
	//holder
	translate([-10,0,0])
	holder();	

	translate([-10,height-10,0])
	holder();

	translate([0,0,-depth])
	cube([5,height,7.5]);
	cube([width,height,depth]);
}

for(i = [1 : switchs]){
	translate([spaccing_width,spaccing_height * i + (i - 1) * switch_height,0])
	cube([switch_width,switch_height,depth]);
}
}