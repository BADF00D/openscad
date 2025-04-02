use <pv_modul.scad>
use <h_post_anchor.scad>
use <single_post_foundation.scad>
use <ladder.scad>


translate([-width_of_house,width/2,pole_height+650])
rotate([-45,0,0])
pv_modul();

mirror([0,1,0])
translate([-width_of_house,-width/2,pole_height+650])
rotate([-45,0,0])
pv_modul();

//h_post_anchor();

width=1250;
length=3000;
pole_width=65;
pole_height=2500;
width_of_house=1750;
width_of_balcony=1000;
height_of_balcony_base=1200;
height_of_balcony=800;
total_width=width_of_house+width_of_balcony;
ladder_width=500;

module anchor_n_foundation(){
    h_post_anchor();
    color ("gray",.25)
    foundation();
}

module vpole(){
    color ("brown")
    translate ([-pole_width/2, -pole_width/2,0])
    cube ([pole_width,pole_width,pole_height]);
}

module hpole(){
    color ("brown")
    translate ([-total_width, -pole_width/2,height_of_balcony_base])
    cube ([total_width,pole_width,pole_width]);
}

module dpole(){
    color ("brown")
    translate ([-pole_width/2, -pole_width/2,height_of_balcony_base])
    cube ([pole_width,width,pole_width]);
}

module vboard (width=1000,height=250,thickness=25){
    color ("brown")
    cube([width,thickness,height]);
}

module sandbox(){
    translate([-total_width,0,0])
    vboard(width=total_width);
    translate([-total_width,width,0])
    vboard(width=total_width);
    
    //translate([-total_width,width,0])
    rotate([0,0,90])
    vboard(width=width);
    
    translate([-total_width,0,0])
    rotate([0,0,90])
    vboard(width=width);
}
module climbing_wall(){
    rotate([0,0,90])
    translate([0,-pole_width/2,0])
    vboard(width=width, height=pole_height);
}
climbing_wall();

module vBoardWall (width=1000,height=500){
    count=height;
//    for(i=[0:rung_count-1]) {
//        translate([0,0,i*spacing+first_rung_offset])
//        rung(width=width+rung_overhand);
//    }
}

module cpole(){
    length=width_of_house+(width_of_balcony-ladder_width)/2;
    
    translate([
        -length,
        -pole_width/2,
        height_of_balcony_base+height_of_balcony
    ])
    cube([length,pole_width,pole_width]);
}
cpole();

module grass(){
    color("green", 0.25)
    cube([10000,10000, 1], true);
}



module anchor_n_foundation_pair(){
    anchor_n_foundation();
    translate([0, width, 0])
    vpole();

    translate([0, width, 0])
    anchor_n_foundation()
    ;
    
    vpole();
}
anchor_n_foundation_pair();
translate([-width_of_house, 0,0])
anchor_n_foundation_pair();
translate([-(width_of_house+width_of_balcony), 0,0])
anchor_n_foundation_pair();
hpole();
translate([-(width_of_house+width_of_balcony/2),0,0])
ladder(height=height_of_balcony_base,width=ladder_width);

hpole();
translate([0,width,0])
hpole();
dpole();
translate([-total_width,0,0])
dpole();
translate([-width_of_house,0,0])
dpole();
grass();
sandbox();


