module corner (){
    cylinder(r = 3, h = 1, $fn = 40);
}
module back () {
    //color ([1,0,0])
    //cylinder(r = 2, h = 25, $fn = 40);
    translate([3,0,0]) cube ([69.25,12.8,1 ]);
    translate([0,3,0]) cube ([75.25,6.8,1 ]);
    translate([3,3,0]) corner();
    translate([3,9.8,0]) corner();
    translate([72.25,3,0]) corner();
    translate([72.25,9.8,0]) corner();
}
    

module pin (){
    cube ([1.5,4.8,8.7 ]);
    translate ([-1,2.4,5.85]) 
        rotate ([0,90,0]) 
        cylinder(r = 1.0, h = 1, $fn = 40);
}


back();
translate ([0.8,4,1]) pin();
translate ([1.5+75.25-1.5-.8,4.8+4.4,1]) rotate ([0,0,180]) pin();

translate ([8,1,1]) cube ([60,.75,2.1 ]);
translate ([8,10.8,1]) cube ([60,.75,2.1 ]);