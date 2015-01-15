module zarazka(vyska, sirka, hloubka, kulicka, vyska_seseknuti=3){
	difference(){
		cube([sirka,hloubka,vyska]);

		translate([0.5,kulicka+4,vyska/2])
		rotate([0,90,-4])
		cylinder(r1=kulicka,r2=kulicka,h=sirka+1);

		polyhedron(points = [[0,0,0], [sirka,0,0], 
			[sirka,0,vyska_seseknuti], 
			[0,hloubka,0], [sirka,hloubka,0], 
			[sirka,hloubka,vyska_seseknuti]],
			faces = [[0,1,2],[3,5,4],[0,3,4,1],[1,4,5,2],
			[2,5,3,0]]);

		polyhedron(points = [[0,0,vyska], [sirka,0,vyska], 
			[sirka,0,vyska - vyska_seseknuti], 
			[0,hloubka,vyska], [sirka,hloubka,vyska], 
			[sirka,hloubka,vyska - vyska_seseknuti]],
			faces = [[0,1,2],[3,5,4],[0,3,4,1],[1,4,5,2],
			[2,5,3,0]]);
	}
}

module jazycek(vyska, sirka_zacatek, sirka_konec, delka, 
			vzdalenost_zacatek = 2){
	polyhedron(points = [[0,delka,0],
	[sirka_zacatek/2,delka-vzdalenost_zacatek,0], 
	[sirka_konec/2,0,0], [-sirka_konec/2,0,0],
	[-sirka_zacatek/2,delka-vzdalenost_zacatek,0],
	[0,delka,vyska],
	[sirka_zacatek/2,delka-vzdalenost_zacatek,vyska], 
	[sirka_konec/2,0,vyska], [-sirka_konec/2,0,vyska],
	[-sirka_zacatek/2,delka-vzdalenost_zacatek,vyska]],
	faces=[[0,1,2,3,4], [9,8,7,6,5], [3,2,7,8], [0,4,9,5], 
	[4,3,8,9], [5,6,1,0], [6,7,2,1]]);
}

module lopatka(vyska_lopatka,tyc_uchyceni,
					vyska_zarazka, sirka_zarazka, 
					hloubka_zarazka, kulicka_zarazka,
					vyska_jazycek, sirka_jazycek_zacatek, 
					sirka_jazycek_konec, delka_jazycek,
					vyska_zapusteni){
	polomer_tyc = tyc_uchyceni;

	difference(){
		union(){
			translate([0,polomer_tyc,0])
			cylinder(h=vyska_lopatka,r1=polomer_tyc,r2=polomer_tyc);
			zarazka(vyska_zarazka, sirka_zarazka, 
					hloubka_zarazka, kulicka_zarazka);

			mirror([1,0,0])
			zarazka(vyska_zarazka, sirka_zarazka, 
					hloubka_zarazka, kulicka_zarazka);
			
			translate([0,polomer_tyc,0])
			jazycek(vyska_jazycek, sirka_jazycek_zacatek,
					sirka_jazycek_konec, 
					delka_jazycek-polomer_tyc);
		}

		// diry na tyc uchyceni
		translate([0,polomer_tyc,0])
		cylinder(h=vyska_zapusteni,r1=tyc_uchyceni-1,r2=tyc_uchyceni-1);

		translate([0,polomer_tyc,vyska_lopatka-vyska_zapusteni])
		cylinder(h=vyska_zapusteni,r1=tyc_uchyceni-1,r2=tyc_uchyceni-1);

	}
}

module uchyt(polomer_tyc, vyska, vyska_zapusteni, drzak = false){
	difference(){
		union(){
			cylinder(h=vyska,r1=polomer_tyc,r2=polomer_tyc);
			translate([0,0,vyska])
			cylinder(h=vyska_zapusteni,r1=polomer_tyc-1,r2=polomer_tyc-1);
		}
	
		// zoubky lepsi drzeni
		if(drzak == true){
		for ( i = [0 : 19] )
		{
			translate([	cos(i * 18)*polomer_tyc,
							sin(i * 18)*polomer_tyc,
							4])
			rotate( 45 + i * 18, [0, 0, 1])
			cube([2,2,5], center = true);
		}
		}
	}
}


$fn=100;
lopatka(	30,5,
			30,28,5,12,
			30,2,6,46,
			5 );

translate([50,0,0])
uchyt(5,5,5);

translate([70,0,0])
uchyt(5,25,5,true);
