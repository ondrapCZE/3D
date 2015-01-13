module zarazka(vyska, sirka, hloubka, kulicka){
	difference(){
		cube([sirka,hloubka,vyska]);
		translate([sirka/2,kulicka/2+2,vyska/2])
		sphere(d=kulicka);
	}
}

module jazycek(vyska, sirka, delka){
	polyhedron(points = [[sirka/2,0,0],[0,delka,0],[-sirka/2,0,0],[sirka/2,0,vyska],[0,delka,vyska],[-sirka/2,0,vyska]], faces=[[0,1,2],[3,5,4],[0,3,4,1],[0,2,5,3],[2,1,4,5]]);
}

module lopatka(vyska_lopatka,tyc_uchyceni,
					vyska_zarazka, sirka_zarazka, 
					hloubka_zarazka, kulicka_zarazka,
					vyska_jazycek, sirka_jazycek, 
					delka_jazycek){
	polomer_tyc = tyc_uchyceni+2;

	difference(){
		union(){
			cylinder(h=vyska_lopatka,r1=polomer_tyc,r2=polomer_tyc);
			translate([polomer_tyc/2,-hloubka_zarazka/2,0])
			zarazka(vyska_zarazka, sirka_zarazka, 
					hloubka_zarazka, kulicka_zarazka);

			translate([-polomer_tyc/2-sirka_zarazka,-hloubka_zarazka/2,0])
			zarazka(vyska_zarazka, sirka_zarazka, 
					hloubka_zarazka, kulicka_zarazka);

			jazycek(vyska_jazycek, sirka_jazycek, 
					delka_jazycek);
		}

		// dira na tyc uchyceni
		cylinder(h=vyska_lopatka-10,r1=tyc_uchyceni,r2=tyc_uchyceni);
		// zoubky lepsi drzeni
		for ( i = [0 : 19] )
		{
			translate([	cos(i * 18)*polomer_tyc,
							sin(i * 18)*polomer_tyc,
							vyska_lopatka - 4])
			rotate( 45 + i * 18, [0, 0, 1])
			cube([2,2,5], center = true);
		}
	}
}

lopatka(60,5,50,20,5,50,50,6,20);
