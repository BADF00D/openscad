module fanscrewhole () {
    color ([1,0,0])
    cylinder(r = 2, h = 25, $fn = 40);
}
module bodyhole () {
    color ([1,0,0])
    rotate ([270,0,0])
    cylinder(r = 3, h = 25, $fn = 40);
}
module basicbody (){
    union() {
        translate ([0,0,0])  
            cube ([16, 16,25 ]);
        translate([-16,0,4.6])
            cube ([32,16,15.25 ]);
    }
}
module gabhole(){
    color ([0,1,0])
    cylinder(r = 2, h = 25, $fn = 40);
}
module cutout(){
    color ([1,0,0])
    cube ([9,2,16]);
}
    
    

difference (){
    basicbody();
    translate([-7.7,7.7,0]) fanscrewhole();
    translate([8,-1,12.5]) bodyhole();
    translate ([-17,16,4]) rotate ([0,0,-45])  cutout();
    
    translate([-12,4,0])gabhole();
    translate([-3,4,0])gabhole();
    translate([-3,12,0])gabhole();
    
    rotate([0,90,0]) translate([-4,12,0])gabhole();
    rotate([0,90,0]) translate([-4,4,0])gabhole();
    rotate([0,90,0]) translate([-20,12,0])gabhole();
    rotate([0,90,0]) translate([-20,4,0])gabhole();
}

    
