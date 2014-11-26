module matice(s,h){
	for(i=[0:1:2]){
		difference(){
			translate([0,0,h/2])
			rotate([0,0,60*i])
			cube([s,tan(30)*s,h],center=true);
		}
	}
}

module drzak(){
	difference(){
	union(){
		translate([-9,0,0])
		cube([9,10,12]);
		translate([-9,10,6])
		rotate([90,0,0])
		cylinder(r1=6,r2=6,h=10);
	}
	translate([-8,11,6])
	rotate([90,0,0])
	matice(8.2,5,6);

	translate([-8,9,6])
	rotate([90,0,0])
	cylinder(r1=2.5,r2=2.5,h=12);
}
}
$fn=50;

difference(){
union(){
	drzak();
	translate([0,58,0])
	mirror([0,1,0]){
	drzak();
	}

// horni stena
	hull(){
	cube([5,58,48]);
	translate([0,5,48])
	rotate([0,90,0])
	cylinder(r1=5,r2=5,h=5);
	translate([0,53,48])
	rotate([0,90,0])
	cylinder(r1=5,r2=5,h=5);
	}
// dolni stena
	hull(){
	cube([31,58,6]);
	translate([31,5,0])
	cylinder(r1=5,r2=5,h=6);
	translate([31,53,0])
	cylinder(r1=5,r2=5,h=6);
	}
}

// dira spodni cast
translate([20,29,0])
cylinder(r1=3.5,r2=3.5,h=11);
// diry horni cast
translate([-1,29,20])
rotate([0,90,0])
cylinder(r1=3.5,r2=3.5,h=11);
translate([-1,29,40])
rotate([0,90,0])
cylinder(r1=3.5,r2=3.5,h=11);
}