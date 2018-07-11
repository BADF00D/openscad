
difference(){
    union(){
        difference(){ //back side
            cylinder (d1 = 33.27, d2 = 33.27, h = 6.63, $fn = 120);
            translate([0,0,3.0])
            color([1,0,0])
                cylinder (d1 = 29.52, d2 = 29.52, h = 3.80, $fn = 120);
        }
        difference(){ //pin with hole
            cylinder (d1 = 7.1, d2 = 7.1, h = 22.13, $fn = 120);
            translate([0,0,1.0])
                color([1,0,0])
                    cylinder (d1 = 3.87, d2 = 3.5, h = 22.13, $fn = 120);
        }
    }
    translate([0,0,.2])
    union(){
        translate([0,3.5,0.0])
            color([0,0,1])
            rotate([0,180,0])
            scale(0.45)
            linear_extrude()
            text("Refugees", font="Arial", halign="center");
        translate([0,-3,0.0])
            color([0,0,1])
            rotate([0,180,0])
            scale(0.45)
            linear_extrude()
            text("Welcome", font = "Arial", halign="center");
        translate([0,-10,0.0])
            color([0,0,1])
            rotate([0,180,0])
            scale(0.45)
            linear_extrude()
            text("§1 BGB", font = "Arial", halign="center");
    }
}