module cny70Holder(){

depth = 5;
depth_bottom = 10;
width = 8;
width_bottom = 10;
bottom = 7.5;
nut_size = 3.3;
nut_depth = 3.2;

difference(){

union(){
translate([0,0,bottom])
cube(size = [depth,width,29], center = false);
cube(size = [depth_bottom,width_bottom,bottom], center = false);
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

translate([4.8,width/2+2,0]){
union(){
	translate([0,0,bottom-nut_depth-0.99])
	cylinder(h=nut_depth, r=nut_size, $fn=6);
	cylinder(h=bottom-0.5, r=1.5, $fn=60);
}
}

translate([4.8,(width-6)/2+2,bottom-nut_depth-0.99])
cube(size = [6,6,nut_depth],center=false);

}

}

rotate([0,0,90])
cny70Holder();

translate([10,0,0])
rotate([0,0,-90])
mirror([1,0,0])
cny70Holder();