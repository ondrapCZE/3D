module paprsek(){
	translate([-3,12,0])
	square([6,18]);	
}

module paprsek_vykroj(){
	difference(){
		paprsek();

		translate([0,27,0])
		rotate([0,0,45])
		square([6,6]);
	}
}


module slunecni_zatoka(){
	circle(r=10,$fn=100);

	paprsek_vykroj();

	rotate([0,0,45])
	paprsek();

	rotate([0,0,90])
	paprsek_vykroj();

	rotate([0,0,135])
	paprsek();

	rotate([0,0,180])
	paprsek_vykroj();

	rotate([0,0,225])
	paprsek();

	rotate([0,0,270])
	paprsek_vykroj();

	rotate([0,0,315])
	paprsek();
}

union(){
linear_extrude(height = 1, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0){
	circle(r=35,$fn=300);
}

linear_extrude(height = 4, center = false, convexity = 10, twist = 0, slices = 20, scale = 1.0){
	union(){
		slunecni_zatoka();

		translate([-36,0,0]){
		difference(){
			circle(r=5, $fn=300);
			circle(r=3, $fn=300);
			translate([4,-5,0])
			square([4,10]);
		}}

		difference(){
			circle(r=35, $fn=300);
			circle(r=32, $fn=300);
		}
	}
}
}

	
