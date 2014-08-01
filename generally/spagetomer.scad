module holes(gap){
union(){
	circle(d=6);
	circle(d=24);
	translate([gap+12+17,0,0])
	circle(d=34);
	translate([2*gap+12+34+20,0,0])
	circle(d=40);
	translate([3*gap+12+34+40+24,0,0])
	circle(d=48);
}
}

module holder(gap, border){
	union(){
		translate([-border-12,0,0])
		circle(d=12);
		circle(d=24+2*border);

		polygon(points=[
					[0,12+border],
					[3*gap+12+34+40+24,24+border],
					[3*gap+12+34+40+24,-24-border],
					[0,-12-border]],
				  paths=[[0,1,2,3]]);
		
		translate([3*gap+12+34+40+24,0,0])
		circle(d=48+2*border);
	}
}

module spagetometer(gap,border,thickness){
	linear_extrude(height = thickness, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0,$fn=200){
	difference(){
		holder(gap,border);
		holes(gap);
		translate([-border-12,0,0])
		circle(d=6);
	}
	}
}

spagetometer(8,8,7);