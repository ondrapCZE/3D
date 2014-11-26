module pyramid(a,b,v){ // a - width, b - length, v - heigth
translate([-a/2,-b/2,0]){
polyhedron(
  points=[ [0,0,0],[a,0,0],[a,b,0],[0,b,0], // the four points at base
           [a/2,b/2,v]  ],                                 // the apex point 
  faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],              // each triangle side
              [1,0,3],[2,1,3] ]                         // two triangles for square base
 );
}
}

module wax_pyramid(a,b,v,wall,r1,r2,h,foot_w,foot_l){
	difference(){
	union(){
		cylinder(h+v, r=r1, $fn=200);
		pyramid(a,b,v);
		translate([-a*3/8,-b/2,0])
		cube([foot_l,foot_w,h+v+10]);
		translate([a*3/8-foot_l,-b/2,0])
		cube([foot_l,foot_w,h+v+10]);
		translate([-a*3/8,b/2-foot_w,0])
		cube([foot_l,foot_w,h+v+10]);
		translate([a*3/8-foot_l,b/2-foot_w,0])
		cube([foot_l,foot_w,h+v+10]);
	}
		pyramid(a-2*wall,b-2*wall,v-wall);
		cylinder(h+v+15, r=r2, $fn=200);
	}

}

//chimney(10,5,20);
wax_pyramid(50,50,180,3,7,4,-15,5,20);