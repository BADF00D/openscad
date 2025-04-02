// PV-Modul mit 72 Half-Cut-Zellen und Alurahmen

// Modulabmessungen
modul_x = 1720;
modul_y = 1130;
modul_z = 25;
rahmen_dicke = 30; // Aluminiumrahmen-Dicke

// Zellengröße (halbierte Standardzelle, ca. 156 mm x 78 mm)
zelle_x = 180;
zelle_y = 90;
zelle_z = 02;
zellen_reihen = 18;  // 72 Half-Cut-Zellen => 24 Reihen x 6 Spalten
zellen_spalten = 6;
zellen_abstand = 1; // Abstand zwischen Zellen

module alurahmen() {
    difference() {
        cube([modul_x, modul_y, modul_z]);
        translate([rahmen_dicke, rahmen_dicke, 0-0.1])
            cube([modul_x - 2*rahmen_dicke, modul_y - 2*rahmen_dicke, modul_z+0.2]);
    }
}

module zelle() {
    color("blue") cube([zelle_x, zelle_y, zelle_z]);
}

module pv_zellen() {
    for (i = [0 : zellen_reihen - 1]) {
        for (j = [0 : zellen_spalten - 1]) {
            translate([
            j * (zelle_x + zellen_abstand) + zellen_abstand*22, 
            i * (zelle_y + zellen_abstand) + zellen_abstand*40, 
            modul_z - 0.2])
            zelle();
        }
    }
}

module pv_modul() {
    color("silver") alurahmen();
    color("white") translate([0,0,-.1]) cube([modul_x, modul_y, modul_z]);
    rotate([0,0,-90]) translate([-modul_y,0,0.0])  pv_zellen();
}

// Gesamtes PV-Modul anzeigen
pv_modul();