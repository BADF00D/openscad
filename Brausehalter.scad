difference(){
    translate([0,0,0]){
        union(){
            difference(){
                cylinder (d1 = 19.67, d2=22, h = 29.3, $fn = 120);
                translate ([0,0,-1])
                    cylinder (d = 15, h = 31, $fn = 120);
                translate ([-7.45,1,-1])
                    cube ([14.9,10,31]);
            }
            translate ([0,0,14])
                difference(){
                    translate ([0,0,15])
                        cylinder (d = 25, h= 2, $fn=120);
                    translate ([0,0,14])
                        cylinder (d = 14.9, h= 4, $fn=120);
                    translate ([-7.5,0,-1])
                        cube ([15,15,20]);
            }
            color([1,1,0])
                translate([0,-9,14.35])
                    rotate ([90,0,0])
                        cylinder (d=8, h=3, $fn=120);
        }
    }
    translate([-25,-25,-150])
        cube([50,50,50]);
}

