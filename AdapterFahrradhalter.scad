bottom_height = 7.15;
total_height = 22.38;
top_height = total_height - bottom_height ;
base_diameter = 15.75; 
top_diameter = 14.75;

module outer()  {
    cylinder (d=base_diameter, $fn= 40, h=bottom_height);
    translate ([0,0,bottom_height])
        cylinder (r1=base_diameter/2, r2=top_diameter/2, $fn40, h=top_height);
}

module inner(){
    width = 13;
    depth = 5.6;
    color ([0,1,0]) 
        translate([-width/2,-depth/2,0])
            cube ([width,depth,total_height]);
}

module inner2(){
    width = 7.5;
    depth = 6;
    translate([-width/2,depth/3,bottom_height])
        cube([7.5, depth, top_height]);
}


module complete (){
    difference(){
        outer();
        inner();
        inner2();
    }
}
complete();


