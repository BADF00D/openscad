module rung(width=800, diameter=30){
    color ("brown")
    rotate([0,90,0])
    cylinder(width, diameter/2, diameter/2, center=true);
}
module strut(width=40,depth=80,length=1500){
    cube([width, depth, length]);
}

module ladder(height=1500,width=500,rung_count=7,rung_overhand=100,strut_width=40, strut_depth=80){
    spacing=height/rung_count;
    first_rung_offset=spacing/2;
    
    translate([-(width)/2,-40,0])
    strut(width=strut_width,depth=strut_depth,length=height);
    
    translate([(width)/2-strut_width,-40,0])
    strut(width=strut_width,depth=strut_depth,length=height);
    
    for(i=[0:rung_count-1]) {
        translate([0,0,i*spacing+first_rung_offset])
        rung(width=width+rung_overhand);
    }
}