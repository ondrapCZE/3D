module nutHole(free){
	rotate(a=180){
	translate([0,-1.5,0]){
		union(){
			polygon(points=[[-2.8,0],[2.8,0],[0,-1.62]],paths=[[0,1,2]]);
			translate([-2.8,0,0])
			square([5.6,free]);
		}
	}}
}

// spodek
linear_extrude(height = 5, convexity = 10, twist = 0, slices = 20, scale = 1.0,$fn=400){
	difference(){
		difference(){
			difference(){
				union(){
					circle(d=55);
					translate([-27.5,-21,0])
					square([55,21]);
				}
				circle(d=34);
			}
		
			union(){
				translate([20,-12.5,0])
				circle(d=5,$fn=60);
				translate([-20,-12.5,0])
				circle(d=5,$fn=60);		
			}
		}
		translate([-27.5,-111])
		square([55,90]);
	}
}

difference(){
difference(){
difference(){
difference(){
	translate([0,0,5])
	linear_extrude(height = 26, convexity = 10, twist = 0, slices = 20, scale = 1.0){
		difference(){
			circle(d=44.3,$fn=400);
			circle(d=33.99,$fn=400);
		}
	}

	translate([0,0,21])
	linear_extrude(height = 10, convexity = 10, twist = 0, slices = 20, scale = 1.0){
		union(){
		union(){
			translate([0,18.7,0])
			circle(d=3,$fn=60);
			translate([cos(-30)*18.7,sin(-30)*18.7,0])
			circle(d=3,$fn=60);
		}
			translate([cos(210)*18.7,sin(210)*18.7,0])
			circle(d=3,$fn=60);
		}
	}
}

translate([0,0,24])
linear_extrude(height = 3, convexity = 10, twist = 0, slices = 20, scale = 1.0){
	union(){
	union(){		
		translate([0,18.7,0])
		nutHole(10);
		translate([cos(-30)*18.7,sin(-30)*18.7,0])
		rotate(a=-120)
		nutHole(10);
	}
		translate([cos(210)*18.7,sin(210)*18.7,0])
		rotate(a=120)
		nutHole(10);
	}
}
}

// mezery velke v kruhu
translate([0,0,5])
linear_extrude(height = 21, convexity = 10, twist = 0, slices = 20, scale = 1.0){
	translate([cos(30)*19.5,sin(30)*19.5,0])
	rotate(a=30)
	square([10,12],true);

	translate([cos(150)*19.5,sin(150)*19.5,0])
	rotate(a=150)
	square([10,12],true);

	translate([cos(270)*19.5,sin(270)*19.5,0])
	rotate(a=270)
	square([10,10],true);
}
}

// vyrez pro vkladani sroubu
translate([0,0,5])
linear_extrude(height = 15, convexity = 10, twist = 0, slices = 20, scale = 1.0,$fn=100){
	translate([20,-12.5,0])
	circle(d=9);
	translate([-20,-12.5,0])
	circle(d=9);
}}