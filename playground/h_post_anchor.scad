total_height = 600;
total_width = 71;
total_depth = 60;
thickness = 3;
height_lower_beam = 100;
height_upper_beam = 300;
height_of_lower_hole = 350;
height_of_upper_hole = 550;
diameter_of_hole = 8;

module beam(){
    cube([total_width, total_depth, thickness]);
}

module h_post_anchor(){
    color ("silver")
    translate ([
        -total_width/2,
        -total_depth/2,
        -(height_of_upper_hole-height_of_lower_hole)
    ])
    difference(){
        union(){
            cube([thickness, total_depth, total_height]);
            translate([total_width-thickness,0,0])
                cube([thickness, total_depth, total_height]);
            
            translate([0,0,height_lower_beam])
                beam();
            translate([0,0,height_upper_beam])
                beam();
        }
        translate([0, total_depth/2, height_of_lower_hole])
            rotate([0,90,0])
                cylinder(total_width, diameter_of_hole,diameter_of_hole);
        translate([0, total_depth/2, height_of_upper_hole])
            rotate([0,90,0])
                cylinder(total_width, diameter_of_hole,diameter_of_hole);
    }   
}
h_post_anchor();
//pole();
//point_foundation();