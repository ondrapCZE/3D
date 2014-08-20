difference(){
union(){

translate([0,0,78]){
linear_extrude(height = 10, center = true, convexity = 10, twist = 0, slices = 20, scale = 1.0){
	difference(){
		circle(d = 16, $fn=300);
	}
}
}

//odrizli protahli tubus
difference(){
//protahli tubus
resize(newsize=[95,95,75]){
	difference(){
	sphere(d = 95, $fn=300);
	translate([0,0,-50])
	cube(size = [100,100,100],center=true);
	}
}

resize(newsize=[93,93,73]){
	difference(){
	sphere(d = 95, $fn=300);
	translate([0,0,-50])
	cube(size = [100,100,100],center=true);
	}
}

}
}

// vyvrtavani der
translate([0,0,80]){
linear_extrude(height = 50, center = true, convexity = 10, twist = 0, slices = 20, scale = 1.0){
	circle(d = 11, $fn=300);
}
}

translate([0,5,80]){
rotate(a=[90,0,0]){
linear_extrude(height = 13, center = true, convexity = 10, twist = 0, slices = 20, scale = 1.0){
	circle(d = 3, $fn=300);
}
}
}

}