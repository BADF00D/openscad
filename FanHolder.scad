module bar (){ 
    color ([0,0,0.7]) translate([-8,-8,0]) cube([16,16,250]);
}

//frame
translate([-60,-60,0]) bar();
translate([+60,-60,0]) bar();
translate([-60,60,0]) bar();
translate([+60,60,0]) bar();
//bottom
translate ([-70,-70,0])color ([0,0,0.7]) cube([140,140,15]);

//sign at top POLICE BOX
translate ([-60,-70,235])color ([0,0,0.7]) cube([120,140,15]);
translate ([-70,-60,235])color ([0,0,0.7]) cube([140,120,15]);

//roof
translate ([-65,-65,250])color ([0,0,0.7]) cube([130,130,15]);
translate ([-60,-60,255])color ([0,0,0.7]) cube([120,120,15]);
translate ([-55,-55,260])color ([0,0,0.7]) cube([110,110,15]);

//light
translate ([0,0,260])cylinder (h=30, d=20);

module dent(){
    color ([0,0,0.7]) cube([2.1,30,38]);
}
module  window_cross_part (){
    color([.5,.5,.5]) cube ([2,2,38]);
}

module dents_for_one_side(){
    union (){
        translate ([58,-45,40]) dent();
        translate ([58,-45,90]) dent();
        translate ([58,-45,140]) dent();
        translate ([58,-45,190]) dent();
        
        translate ([58,15,40]) dent();
        translate ([58,15,90]) dent();
        translate ([58,15,140]) dent();
        translate ([58,15,190]) dent();
    }
}
module decoration_for_one_side(){
    translate([60,-2,0]) color ([0,0,0.7]) cube([4,4,230]);
    translate([57,-36,190]) window_cross_part();
    translate([57,-26,190]) window_cross_part();
    translate([57,-45,209]) 
        color([.5,.5,.5]) 
            cube ([2,30,2]);
    
    translate([57,24,190]) window_cross_part();
    translate([57,34,190]) window_cross_part();
    translate([57,15,209]) 
        color([.5,.5,.5])
            cube ([2,30,2]);
}

union(){
    difference(){
        translate ([-60,-60,00])color ([0,0,0.7]) cube([120,120,235]);
        rotate ([0,0,0]) dents_for_one_side();
        rotate ([0,0,90]) dents_for_one_side();
        rotate ([0,0,180]) dents_for_one_side();
        rotate ([0,0,270]) dents_for_one_side();
        
    }
    rotate ([0,0,0]) decoration_for_one_side();
    rotate ([0,0,90]) decoration_for_one_side();
    rotate ([0,0,180]) decoration_for_one_side();
    rotate ([0,0,270]) decoration_for_one_side();
}

//clock
module clock (){
    translate ([70,0,125]) 
        rotate([0,90,0]) 
        scale (11) 
        color ([0.75,0.75,0.75,1])
        cylinder (h=.002, d=20, $fn=200);
    translate ([70,0,125]) 
        rotate([0,90,0]) 
        scale (11) 
        color ([0,0,1,0.5])
        cylinder (h=.002, d=20, $fn=200);
}

clock();